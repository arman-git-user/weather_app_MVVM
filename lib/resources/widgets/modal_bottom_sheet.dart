import 'dart:ui'; // 👈 required for glass blur

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/utils/utils.dart';
import 'package:weather_app/view_model/show_weather_view_model.dart';

class CustomDraggableWeatherSheet extends StatelessWidget {
  const CustomDraggableWeatherSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.08,
      minChildSize: 0.08,
      maxChildSize: 0.4,
      builder: (context, scrollController) {
        return Consumer<ShowWeatherViewModel>(
          builder: (context, value, child) {
            if (value.weather == null) {
              return const SizedBox.shrink();
            }

            final height = MediaQuery.of(context).size.height;

            return ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(24),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.18),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.35),
                      width: 1,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ],
                  ),

                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),

                          Container(
                            width: 40,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),

                          SizedBox(height: height * 0.02),

                          const Center(
                            child: Text(
                              'Weekly Forecast',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.white70,
                              ),
                            ),
                          ),

                          SizedBox(height: height * 0.03),

                          SizedBox(
                            height: height * 0.18,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: Utils.weekDays().length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.only(
                                    left: 20,
                                    right: 10,
                                  ),
                                  padding: const EdgeInsets.all(18),
                                  decoration: BoxDecoration(
                                    color:Utils.returnColor(index)? Colors.blueGrey:Colors.transparent.withValues(
                                      alpha: 0.2,
                                    ),
                                    borderRadius: BorderRadius.circular(45),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        Utils.weekDays()[index],
                                        style: TextStyle(color: Colors.white70),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "${value.weather!.days![index].temp}°",
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.white70,
                                        ),
                                      ),
                                      Image.asset(
                                        Utils.IconsSelect(
                                          value.weather!.days![index].conditions
                                              .toString(),
                                        ),
                                        height: 30,
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
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
