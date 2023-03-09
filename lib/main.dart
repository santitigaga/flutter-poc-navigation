import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poc_navigation/page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      builder: (context, child) {
        return WidgetsApp.router(
          color: Colors.black,
          routerConfig: GoRouter(initialLocation: '/', routes: [
            GoRoute(
                path: '/',
                builder: (context, state) => WhitePage(
                      title: 'page default',
                      buttonText: 'go to page 1',
                      onPressed: () => context.go('/1'),
                    )),
            GoRoute(
                path: '/1',
                builder: (context, state) => WhitePage(
                      title: 'page 1',
                      buttonText: 'go to page 2',
                      onPressed: () => context.go('/2'),
                    )),
            GoRoute(
                path: '/2',
                builder: (context, state) => WhitePage(
                    title: 'page 2',
                    buttonText: 'go to page lo quesea ',
                    onPressed: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => WhitePage(
                            title: 'page 1',
                            buttonText: 'go to page default',
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ))))
          ]),
        );
      },
      routes: {
        '/': (context) => WhitePage(
              title: 'page default',
              buttonText: 'go to page 1',
              onPressed: () => Navigator.of(context).pushNamed('/1'),
            ),
        '/1': (context) => WhitePage(
              title: 'page 1',
              buttonText: 'go to page 2',
              onPressed: () => Navigator.of(context).pushNamed('/2'),
            ),
        '/2': (context) => WhitePage(
              title: 'page 2',
              buttonText: 'go to page default',
              onPressed: () => Navigator.of(context).pushNamed('/'),
            )
      },
    );
    return MaterialApp.router(
      routerConfig: GoRouter(initialLocation: '/', routes: [
        GoRoute(
            path: '/',
            builder: (context, state) => WhitePage(
                  title: 'page default',
                  buttonText: 'go to page 1',
                  onPressed: () => Navigator.of(context).pushNamed('/1'),
                )),
        GoRoute(
            path: '/1',
            builder: (context, state) => WhitePage(
                  title: 'page 1',
                  buttonText: 'go to page 2',
                  onPressed: () => Navigator.of(context).pushNamed('/2'),
                )),
        GoRoute(
            path: '/2',
            builder: (context, state) => WhitePage(
                  title: 'page 2',
                  buttonText: 'go to page default',
                  onPressed: () => Navigator.of(context).pushNamed('/'),
                ))
      ]),
    );
  }
}
