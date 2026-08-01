import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:pray_iafcj/firebase_options.dart';
import 'package:pray_iafcj/core/app_theme.dart';
import 'package:pray_iafcj/screens/about_screen.dart';
import 'package:pray_iafcj/screens/splash.dart';
import 'package:pray_iafcj/screens/welcome/welcome_screen.dart';
import 'package:pray_iafcj/screens/auth/login_screen.dart';
import 'package:pray_iafcj/screens/auth/register_screen.dart';
import 'package:pray_iafcj/screens/home/tab_shell.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    print("Firebase iniciado correctamente");
  } catch (e, s) {
    print("ERROR FIREBASE:");
    print(e);
    print(s);
  }

  runApp(const PrayIAFCJ());
}

class PrayIAFCJ extends StatelessWidget {
  const PrayIAFCJ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pray IAFCJ',
      theme: AppTheme.lightTheme,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const Splash(),
        '/': (context) => const WelcomeScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const TabShell(),
        '/lectura': (context) => const TabShell(initialIndex: 1),
        '/oracion': (context) => const TabShell(initialIndex: 2),
        '/profile': (context) => const TabShell(initialIndex: 3),
        '/about': (context) => const AboutScreen(),
      },
    );
  }
}
