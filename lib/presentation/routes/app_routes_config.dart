import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_wizard/presentation/ui/pages/home_page.dart';
import 'package:weather_wizard/presentation/ui/pages/slider_view_page.dart';

class AppRouter {
  final GoRouter router = GoRouter(
   // initialLocation: '/slider_view',
    routes: [
      GoRoute(
        //name: 'home',
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
      ),
      GoRoute(
        // name: 'weather_details',
        path: '/slider_view',
        builder: (BuildContext context, GoRouterState state) {
          return const SliderViewPage();
        },
      ),
    ],
  );
}
