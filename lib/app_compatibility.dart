import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poc_navigation/page.dart';

class AppCompatibility extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  AppCompatibility({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/1': (context) => WhitePage(
              title: 'page 1',
              buttonText: 'go to page 2',
              onPressed: () => Navigator.of(context).pushNamed('/2'),
            ),
        '/2': (context) => WhitePage(
              title: 'page 2',
              buttonText: 'go to page default',
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/')
                    .then((_) => context.go('/3'));
              },
            ),
        '/3': (context) => WhitePage(
              title: 'page 3 repeat',
              buttonText: 'go to page default',
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/')
                    .then((_) => context.go('/3'));
              },
            ),
        '/': (context) => Router.withConfig(
              config: GoRouter(
                initialLocation: '/',
                routes: [
                  GoRoute(
                    path: '/',
                    builder: (context, __) => WhitePage(
                      title: 'page default',
                      buttonText: 'go to page 1',
                      onPressed: () => context.go('/3'),
                    ),
                  ),
                  GoRoute(
                    path: '/3',
                    builder: (context, __) => WhitePage(
                      title: 'page 3',
                      buttonText: 'go to page 2',
                      onPressed: () => context.go('/4'),
                    ),
                  ),
                  GoRoute(
                    path: '/4',
                    builder: (contexto, __) => WhitePage(
                      title: 'page 2',
                      buttonText: 'go to page lo quesea ',
                      onPressed: () {
                        print("hello");
                        Navigator.of(context).pushNamed('/1');
                      },
                    ),
                  )
                ],
              ),
            ),
      },
    );
  }
}
