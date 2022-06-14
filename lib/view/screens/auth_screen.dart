import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthScreen> {
  @override
  void initState() {
    super.initState();
    verifyToken().then((value) {
      if (value) {
        Navigator.of(context).pushReplacementNamed('/homeScreen');
      } else {
        Navigator.of(context).pushReplacementNamed('/signInScreen');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Future<bool> verifyToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.getString('access-token') != null) {
      return true;
    } else {
      return false;
    }
  }
}
