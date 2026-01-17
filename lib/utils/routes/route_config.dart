import 'package:go_router/go_router.dart';
import 'package:weather_app/view/home_view.dart';
import 'package:weather_app/view/search_view.dart';

class RoutesConfig{
  static final GoRouter routes= GoRouter(routes: [
    GoRoute(path: '/',name: "HomeView",builder: (context, state) => const HomeView(),),
    GoRoute(path: '/SearchView',name: "SearchView",builder: (context,state)=>const SearchView())
  ]);
}