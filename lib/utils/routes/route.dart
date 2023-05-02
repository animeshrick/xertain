import 'package:flutter/material.dart';

import '../../module/image_genarator/view_ui/image_genarator.dart';
import 'routes_name.dart';
class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case MyRoutes.imageGenerator:
        return MaterialPageRoute(builder: (_) =>  ImageGeneratorUi());

      // case MyRoutes.nabBarRoute:
      //   if (args is int) {
      //     return MaterialPageRoute(
      //       builder: (_) => CustomBottomNavBar(index: args),
      //     );
      //   }
      //   return _errorRoute();

      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(
                child: Text("No route found"),
              ),
            );
          },
        );
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
