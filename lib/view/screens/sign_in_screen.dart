import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/view/screens/home_screen.dart';
import '../widgets/rounded_button_widget.dart';
import '/controller/stores/user_store.dart';
import '/view/screens/sign_up_screen.dart';

import '../../utils/colors/app_colors.dart';
import '../widgets/label_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  UserStore userStore = UserStore();
  final _key = GlobalKey<FormState>();

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgroundSignInColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.07,
                vertical: size.height * 0.15,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('icons/bucket_and_paint.svg'),
                      const Text(
                        'XTintas',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.1),
                  const Text(
                    'Entrar na plataforma',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  const LabelInput('Email'),
                  TextFormField(
                    decoration: inputCustomDecoration(),
                  ),
                  const LabelInput('Senha'),
                  TextFormField(
                    decoration: inputCustomDecoration(),
                  ),
                  const SizedBox(height: 25),
                  RoundedButton(
                    backgroundColor: const Color(0xFFFFFFFF),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: AppColors.backgroundSignInColor,
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                    onTapButton: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                    },
                  ),
                  const SizedBox(height: 25),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignUpScreen()));
                    },
                    child: const Text(
                      'Criar conta',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration inputCustomDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white.withOpacity(0.4),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide.none,
      ),
    );
  }
}
