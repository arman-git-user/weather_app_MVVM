import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/view_model/show_weather_view_model.dart';

class DemoView extends StatelessWidget {
  const DemoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ShowWeatherViewModel>(
        builder: (context, value, child) {
          if(value.loading){
            return Center(child: CircularProgressIndicator(),);
          }
          if (value.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, color: Colors.red, size: 40),
                  Text("Oops! ${value.error}"),
                  ElevatedButton(
                    onPressed: () => value.fetchWeather(),
                    child: Text("Try Again"),
                  ),
                ],
              ),
            );
          }
          if (value.weather == null) {
            return const Center(
              child: Text(
                "No weather data available",
                style: TextStyle(color: Colors.black,fontSize: 30),
              ),
            );
          }

          return Container(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
          Text(value.weather!.days![0].temp.toString())],
          )
          );
        },
      ),
    );
  }
}
