import 'package:flutter/material.dart';
import 'package:weather_app/resources/widgets/modal_bottom_sheet.dart';
import 'package:weather_app/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/view_model/show_weather_view_model.dart';

import '../resources/widgets/another_modal_bottom_sheet.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchFieldController = TextEditingController();
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    print(Utils.weekDays().length);
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                '${Utils.getImage("bg-weather.png")}',
                fit: BoxFit.cover,
              ),
              // Container(
              //   color: Color(0xFF92F4F7),
              //   height: double.infinity,
              //   width: double.infinity,
              // ),
            ),
            // Positioned.fill(
            //   top: screenHeight * 0.3,
            //   child: Image.asset(
            //     '${Utils.getImage('HouseLogo.png')}',
            //     fit: BoxFit.fitWidth,
            //   ),
            // ),
            Consumer<ShowWeatherViewModel>(
              builder: (context, value, child) {
                if (value.loading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (value.error != null) {
                  return Text(value.error!.toString());
                }
                if (value.weather == null) {
                  return const Center(
                    child: Text(
                      "No weather data available",
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  );
                }

                return Container(
                  height: screenHeight,
                  width: screenWidth,
                  child: SafeArea(
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        SizedBox(
                          width: screenWidth * 0.94,
                          child: TextField(style: TextStyle(color: Colors.white),
                            controller: searchFieldController,
                            decoration: InputDecoration(
                              suffixIcon: InkWell(
                                onTap: () {},
                                child: Icon(Icons.search, color: Colors.white),
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
                          style: TextStyle(color: Colors.white, fontSize: 35),
                        ),
                        Text(
                          '${value.weather!.days![Utils.currentSelectedDate - 1].temp}°',
                          style: TextStyle(color: Colors.white, fontSize: 60),
                        ),
                        Text(
                          value
                              .weather!
                              .days![Utils.currentSelectedDate - 1]
                              .conditions
                              .toString(),
                          style: TextStyle(color: Colors.white54, fontSize: 20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'H: ' +
                                  value
                                      .weather!
                                      .days![Utils.currentSelectedDate - 1]
                                      .tempmax
                                      .toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(width: screenWidth * 0.05),
                            Text(
                              'L: ' +
                                  value
                                      .weather!
                                      .days![Utils.currentSelectedDate - 1]
                                      .tempmin
                                      .toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.white38.withValues(
                                alpha: 0.4,
                              ),
                              builder: (_) => Container(
                                height: screenHeight * 0.4,
                                decoration: BoxDecoration(
                                  color: Colors.white38.withValues(alpha: 0.4),
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(24),
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(height: screenHeight * 0.04),
                                    const Center(
                                      child: Text('Weekly Forecast'),
                                    ),
                                    SizedBox(height: screenHeight * 0.035),
                                    SizedBox(
                                      height: screenHeight * 0.18,
                                      child: ListView.builder(
                                        itemCount: Utils.weekDays().length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            margin: const EdgeInsets.only(
                                              left: 20,
                                              right: 10,
                                            ),
                                            padding: const EdgeInsets.all(33),
                                            decoration: BoxDecoration(
                                              color: value.isMatched
                                                  ? Colors.red
                                                  : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(45),
                                            ),
                                            child: Column(
                                              children: [
                                                Text(Utils.weekDays()[index]),
                                                Text(
                                                  value
                                                      .weather!
                                                      .days![index]
                                                      .temp
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Text("Press"),
                        ),
                        // SizedBox(height: 429,),
                        // Image.asset(Utils.getImage('TabBar.png'),fit: BoxFit.cover,)
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
