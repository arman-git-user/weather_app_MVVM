import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/utils/utils.dart';

class CustomShowModalBottomSheet0 extends StatelessWidget {
  const CustomShowModalBottomSheet0({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}


class CustomShowModalBottomSheet {
  void showWeatherBottomSheet(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 1;
    double width = MediaQuery.of(context).size.width * 1;
    showModalBottomSheet(
      backgroundColor: Colors.white38.withValues(alpha: 0.4),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          height: height * 0.4,
          decoration: BoxDecoration(
            color: Colors.white38.withValues(alpha: 0.4),
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: height * 0.04),
              Center(child: Text('Weekly Forecast')),
              SizedBox(height: height * 0.035),
              SizedBox(
                height: height * 0.18,
                child: ListView.builder(
                  itemCount: 7,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    // height = height * 0.2;
                    return Container(

                      margin: EdgeInsets.only(left: 20, right: 10),
                      padding: EdgeInsets.all(33),
                      height: 50,
                      // width: 30,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(45),
                      ),
                      child: Column(
                        children: [
                          Text(Utils.weekDays()[index])
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],

          ),
        );
      },
    );
  }
}
