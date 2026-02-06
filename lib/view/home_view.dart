import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/utils/utils.dart';
import 'package:weather_app/view_model/show_weather_view_model.dart';
import 'package:weather_app/resources/widgets/modal_bottom_sheet.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _searchCity() {
    FocusScope.of(context).unfocus();

    context
        .read<ShowWeatherViewModel>()
        .fetchWeatherByCity(_searchController.text);
  }
  @override
  void initState() {
    // TODO: implement initState
    context.read<ShowWeatherViewModel>().fetchWeatherByCity("Karachi");
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

            Consumer<ShowWeatherViewModel>(
              builder: (context, value, child) {

                if (value.loading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (value.error != null) {
                  return Center(child: Text(value.error.toString()));
                }

                if (value.weather == null) {
                  return const Center(
                    child: Text(
                      "No weather data available",
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  );
                }

                return SizedBox(
                  height: screenHeight,
                  width: screenWidth,
                  child: SafeArea(
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
                                child: const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                              ),
                              hint: Text(
                                'Search City...',
                                style: TextStyle(color: Colors.grey.shade400),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(22),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(22),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.04),

                        Text(
                          value.weather!.address.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                          ),
                        ),

                        Text(
                          '${value.weather!.days![Utils.currentSelectedDate - 1].temp}°',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              value
                                  .weather!
                                  .days![Utils.currentSelectedDate - 1]
                                  .conditions
                                  .toString(),
                              style: const TextStyle(
                                color: Colors.white54,
                                fontSize: 20,
                              ),
                            ),
                            Image.asset(
                              Utils.IconsSelect(
                                value
                                    .weather!
                                    .days![Utils.currentSelectedDate - 1]
                                    .conditions
                                    .toString(),
                              ),
                              height: 40,
                            ),
                          ],
                        ),

                        const SizedBox(height: 15),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'H: ${value.weather!.days![Utils.currentSelectedDate - 1].tempmax}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.05),
                            Text(
                              'L: ${value.weather!.days![Utils.currentSelectedDate - 1].tempmin}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            const CustomDraggableWeatherSheet(),
          ],
        ),
      ),
    );
  }
}
