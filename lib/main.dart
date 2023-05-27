import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jumpreza/screens/login_page.dart';
import 'package:jumpreza/screens/register_page.dart';
import 'package:jumpreza/screens/terms_and_privacy_page.dart';

import 'screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
    );
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: TabsPage(),
    //   // home: HomePage(),
    //   theme: ThemeData(primarySwatch: Colors.deepPurple),
    // );
  }
}

/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'policy',
          builder: (BuildContext context, GoRouterState state) {
            return TermsAndPrivacyPage();
          },
        ),
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return LoginPage();
          },
        ),
        GoRoute(
          path: 'register',
          builder: (BuildContext context, GoRouterState state) {
            return RegisterPage();
          },
        ),
      ],
    ),
  ],
);
