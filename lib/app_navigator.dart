import 'package:flutter/material.dart';
import 'package:poc_navigation/page.dart';
import 'package:provider/provider.dart';

import 'custom_route.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WhitePage(
              title: 'Page with navigator default',
              buttonText: 'go to page with navigator 1',
              onPressed: () => goTo(context, '/1'),
            ),
        '/1': (context) => WhitePage(
              title: 'Page with navigator 1',
              buttonText: 'go to page with navigator 2',
              onPressed: () => goTo(context, '/2'),
            ),
        '/2': (context) => WhitePage(
              title: 'Page with navigator 2',
              buttonText: 'go to page with navigator default',
              onPressed: () => goTo(context, '/'),
            )
      },
    );
  }

  void goTo(BuildContext context, String route) {
    //Navigator.of(context, rootNavigator: true).pushNamed(route);
    Provider.of<CustomRoute>(context, listen: false).pushNamed(context, route);
  }
}
