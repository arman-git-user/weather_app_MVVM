import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ApiCallDemoView extends StatefulWidget {
  const ApiCallDemoView({super.key});

  @override
  State<ApiCallDemoView> createState() => _ApiCallDemoViewState();
}

class _ApiCallDemoViewState extends State<ApiCallDemoView> {
  String URL =
      'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/Pakistan,Karachi/?key=A9YR8BRMMXT6NREUJSC6S43VZ';

  Future<void> APICall(String URL) async{
    final APICall = await http.get(Uri.parse(URL));
    final result = jsonDecode(APICall.body);
    print(result);
  }
@override
  void initState() {
    // TODO: implement initState
    APICall(URL);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container());
  }
}
