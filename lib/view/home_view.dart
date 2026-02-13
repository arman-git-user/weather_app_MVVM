import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/utils/utils.dart';
import 'package:weather_app/view_model/home_view_model.dart';
import 'package:weather_app/resources/widgets/CustomDraggableWeatherSheet.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ShowWeatherViewModel>().fetchWeatherByCity("Karachi");
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _searchCity() {
    FocusScope.of(context).unfocus();

    context.read<ShowWeatherViewModel>().fetchWeatherByCity(
      _searchController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                Utils.getImage("AnotherBG.png"),
                fit: BoxFit.cover,
              ),
            ),

            SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  SizedBox(
                    width: screenWidth * 0.94,
                    child: TextField(
                      controller: _searchController,
                      textInputAction: TextInputAction.search,
                      onSubmitted: (_) => _searchCity(),
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: _searchCity,
                          child: const Icon(Icons.search, color: Colors.white),
                        ),
                        hintText: 'Search location...',
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.04),

                  Expanded(
                    child: Consumer<ShowWeatherViewModel>(
                      builder: (context, value, child) {
                        // First load
                        if (value.loading &&
                            (value.weather == null ||
                                value.lastSearch == true)) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (value.weather == null && value.error != null) {
                          return Center(
                            child: Text(
                              value.error!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                          );
                        }
                        if (value.weather == null) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        final resolved = value.weather!.resolvedAddress!
                            .toLowerCase();

                        final query = _searchController.text
                            .trim()
                            .toLowerCase();

                        if (!value.loading &&
                            query.isNotEmpty &&
                            !resolved.contains(query)) {
                          value.isCurrentCityInvalid = true;
                          return const Center(
                            child: Text(
                              'Enter a valid location',
                              style: TextStyle(
                                fontSize: 26,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          );
                        }

                        final day =
                            value.weather!.days![Utils.currentSelectedDate - 1];

                        return Column(
                          children: [
                            Text(
                              '${value.weather!.address![0].toUpperCase()+ value.weather!.address!.substring(1)}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                              ),
                            ),

                            Text(
                              '${day.temp}°',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 60,
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  day.conditions.toString(),
                                  style: const TextStyle(
                                    color: Colors.white54,
                                    fontSize: 20,
                                  ),
                                ),
                                Image.asset(
                                  Utils.IconsSelect(day.conditions.toString()),
                                  height: 40,
                                ),
                              ],
                            ),

                            const SizedBox(height: 15),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'H: ${day.tempmax}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.05),
                                Text(
                                  'L: ${day.tempmin}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            const CustomDraggableWeatherSheet(),
          ],
        ),
      ),
    );
  }
}
