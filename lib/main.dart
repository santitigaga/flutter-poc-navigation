import 'package:flutter/material.dart';
import 'package:poc_navigation/app_compatibility.dart';
import 'package:poc_navigation/custom_route.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Setup());
}

class Setup extends StatelessWidget {
  const Setup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
/*     return MultiProvider(providers: [
      Provider<CustomRoute>(create: (_) => CustomRoute(useGoRoute: false))
    ], child: const AppNavigator()); */
    /*     return MultiProvider(providers: [
      Provider<CustomRoute>(create: (_) => CustomRoute(useGoRoute: true))
    ], child: const AppRouter()); */

    return MultiProvider(providers: [
      Provider<CustomRoute>(create: (_) => CustomRoute(useGoRoute: false))
    ], child: AppCompatibility());
  }
}
