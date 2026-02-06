import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/utils/routes/route_config.dart';
import 'package:weather_app/view/home_view.dart';
import 'package:weather_app/view/search_view.dart';
import 'package:weather_app/view_model/show_weather_view_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ShowWeatherViewModel>(
          create: (_) => ShowWeatherViewModel(),
        ),
      ],
      child: MaterialApp.router(

        title: 'Flutter Demo',
        routeInformationParser: RoutesConfig.routes.routeInformationParser,
        routeInformationProvider: RoutesConfig.routes.routeInformationProvider,
        routerDelegate: RoutesConfig.routes.routerDelegate,
        theme: ThemeData(
          fontFamily: 'SF',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
      ),
    );
  }
}
