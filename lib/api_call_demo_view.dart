import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/utils/utils.dart';

class DemoDate extends StatelessWidget {
  const DemoDate({super.key});

  @override
  Widget build(BuildContext context) {
    // print(startDate);
var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(child: TextField(decoration: InputDecoration(hintText: '',hint: Text('data')),),
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(Utils.getImage('ImageBackGroundImage.png')),fit: BoxFit.cover),
        ),
      ),
    );
  }
}
