import 'package:flutter/material.dart';
import '/view/screens/auth_screen.dart';
import '/view/screens/sign_in_screen.dart';
import '/view/screens/sign_up_screen.dart';

import 'view/screens/auth_screen.dart';
import 'view/screens/home_screen.dart';
import 'view/screens/sign_in_screen.dart';
import 'view/screens/sign_up_screen.dart';

//Package para testar responsividade! - Device Preview

// void main() => runApp(
//       DevicePreview(
//         enabled: !kReleaseMode,
//         builder: (context) => const MyApp(),
//       ),
//     );

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         useInheritedMediaQuery: true,
//         locale: DevicePreview.locale(context),
//         builder: DevicePreview.appBuilder,
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData.light(),
//         darkTheme: ThemeData.dark(),
//         initialRoute: '/authScreen',
//         routes: {
//           '/authScreen': (context) => const AuthScreen(),
//           '/homeScreen': (context) => const HomeScreen(),
//           '/signInScreen': (context) => const SignInScreen(),
//           '/signUpScreen': (context) => const SignUpScreen(),
//         });
//   }
// }

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        initialRoute: '/authScreen',
        routes: {
          '/authScreen': (context) => const AuthScreen(),
          '/homeScreen': (context) => const HomeScreen(),
          '/signInScreen': (context) => const SignInScreen(),
          '/signUpScreen': (context) => const SignUpScreen(),
        });
  }
}
