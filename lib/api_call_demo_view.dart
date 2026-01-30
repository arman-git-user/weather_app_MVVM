import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DemoDate extends StatelessWidget {
  const DemoDate({super.key});

  @override
  Widget build(BuildContext context) {



    // print(startDate);

    return Scaffold(
      body: Container(
        child: Center(child: Text("startDate", style: TextStyle(fontSize: 30))),
      ),
    );
  }
}
