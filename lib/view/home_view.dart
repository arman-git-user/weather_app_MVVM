import 'package:flutter/material.dart';
import 'package:weather_app/resources/widgets/modal_bottom_sheet.dart';
import 'package:weather_app/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/view_model/show_weather_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white38.withValues(alpha: 0.1),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: ""),
          // BottomNavigationBarItem(icon: Icon(Icons.account_box))
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              '${Utils.getImage("background.jpg")}',
              fit: BoxFit.cover,
            ),
            // Container(
            //   color: Color(0xFF92F4F7),
            //   height: double.infinity,
            //   width: double.infinity,
            // ),
          ),
          Positioned.fill(
            top: screenHeight * 0.3,
            child: Image.asset(
              '${Utils.getImage('HouseLogo.png')}',
              fit: BoxFit.fitWidth,
            ),
          ),
          Consumer<ShowWeatherViewModel>(
            builder: (context, value, child) {
              if(value.loading){
                return Center(child: CircularProgressIndicator(),);
              }
              if(value.error != null){
              return Text(value.error!.toString());
              }
              if (value.weather == null) {
                return const Center(
                  child: Text(
                    "No weather data available",
                    style: TextStyle(color: Colors.black,fontSize: 30),
                  ),
                );
              }

              return Container(
                height: screenHeight,
                width: screenWidth,
                child: SafeArea(
                  child: Column(
                    children: [
                      SizedBox(height: screenHeight * 0.1),
                      Text(
                        value.weather!.days![0].temp.toString(),
                        style: TextStyle(color: Colors.black, fontSize: 45),
                      ),
                      Text(
                        "19",
                        style: TextStyle(color: Colors.white, fontSize: 55),
                      ),
                      Text(
                        "Mostly Clear",
                        style: TextStyle(color: Colors.white54, fontSize: 20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("H:24", style: TextStyle(color: Colors.white)),
                          SizedBox(width: screenWidth * 0.05),
                          Text("L:18", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          CustomShowModalBottomSheet().showWeatherBottomSheet(
                            context,
                          );
                        },
                        child: Text("Press"),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
