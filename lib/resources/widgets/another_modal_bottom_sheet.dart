// import 'package:flutter/material.dart';
// import 'package:weather_app/utils/utils.dart';
//
// class WeatherBottomSheet extends StatefulWidget {
//   const WeatherBottomSheet({super.key});
//
//   @override
//   State<WeatherBottomSheet> createState() => _WeatherBottomSheetState();
// }
//
// class _WeatherBottomSheetState extends State<WeatherBottomSheet> {
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//
//     return Container(
//       height: height * 0.4,
//       decoration: BoxDecoration(
//         color: Colors.white38.withValues(alpha: 0.4),
//         borderRadius: const BorderRadius.vertical(
//           top: Radius.circular(24),
//         ),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           SizedBox(height: height * 0.04),
//           const Center(child: Text('Weekly Forecast')),
//           SizedBox(height: height * 0.035),
//           SizedBox(
//             height: height * 0.18,
//             child: ListView.builder(
//               itemCount: 7,
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (context, index) {
//                 return Container(
//                   margin: const EdgeInsets.only(left: 20, right: 10),
//                   padding: const EdgeInsets.all(33),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(45),
//                   ),
//                   child: Column(
//                     children: [
//                       Text(Utils.weekDays()[index]),
//                     ],
//
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
