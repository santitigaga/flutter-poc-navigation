import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poc_navigation/page.dart';

class AppRouter extends StatelessWidget {
  const AppRouter({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(initialLocation: '/', routes: [
        GoRoute(
            name: '/',
            path: '/',
            builder: (context, state) => WhitePage(
                  title: 'Page go router default',
                  buttonText: 'go to page go router 1',
                  onPressed: () => goTo(context, '/1'),
                )),
        GoRoute(
            name: '/1',
            path: '/1',
            builder: (context, state) => WhitePage(
                  title: 'Page go router 1',
                  buttonText: 'go to page go router 2',
                  onPressed: () => goTo(context, '/2'),
                )),
        GoRoute(
            name: '/2',
            path: '/2',
            builder: (context, state) => WhitePage(
                  title: 'Page go router 2',
                  buttonText: 'go to page go router default',
                  onPressed: () => goTo(context, '/'),
                ))
      ]),
    );
  }

  void goTo(BuildContext context, String route) {
    //return context.go(route);
    Navigator.of(context, rootNavigator: true).pushNamed(route);
    //Provider.of<CustomRoute>(context, listen: false).pushNamed(context, route);
  }
}
