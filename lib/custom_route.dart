import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomRoute {
  CustomRoute({
    key,
    required this.useGoRoute,
  }) : super();

  bool useGoRoute = true;
  pushNamed(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    return useGoRoute
        ? GoRouter.of(context).goNamed(routeName)
        : Navigator.of(context, rootNavigator: true)
            .pushNamed(routeName, arguments: arguments);
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    throw UnimplementedError();
  }
}
