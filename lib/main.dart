import 'package:auth/viewmodels/sign_in_out_viewmodel.dart';
import 'package:auth/views/sign_up_view.dart';
import 'package:auth/views/splash_screeen_view.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'views/sign_in.dart';
import 'views/home_view.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_core/firebase_core.dart';

const String login_page = '/login_page';
const String register_page = '/register_page';
const String home_page = '/home_page';
const String splash_screen = '/splash_screen';

final _router = GoRouter(
  initialLocation: splash_screen,

  routes: [
    GoRoute(
      path: login_page,
      builder: (context, state) => LoginView(),
    ),
    GoRoute(
      path: register_page,
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
      path: home_page,
      builder: (context, state) => HomeView(),
    ),
    GoRoute(
      path: splash_screen,
      builder: (context, state) => const SplashScreen(),
    ),
  ],
);

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => LoginViewModel()),
    ],
    child: MyApp(),
  ),


  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter MVVM Auth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: Consumer<AuthViewModel>(
      //   builder: (context, authViewModel, child) {
      //     return authViewModel.users.isNotEmpty ? HomeView() : LoginView();
      //   },
      // ),
    );
  }
}