import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/label_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF5B4DA7),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.07,
                vertical: size.height * 0.12,
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
                  SizedBox(height: size.height * 0.05),
                  const Text(
                    'Criar conta',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  const LabelInput('Nome'),
                  TextFormField(
                    decoration: inputCustomDecoration(),
                  ),
                  const LabelInput('Email'),
                  TextFormField(
                    decoration: inputCustomDecoration(),
                  ),
                  const LabelInput('Senha'),
                  TextFormField(
                    decoration: inputCustomDecoration(),
                  ),
                  const LabelInput('Confirmar senha'),
                  TextFormField(
                    decoration: inputCustomDecoration(),
                  ),
                  const SizedBox(height: 25),
                  GestureDetector(
                    onTap: () {
                      // final user = User(
                      //   name: 'controllerName',
                      //   email: 'controllerEmail',
                      //   password: 'controllerPassword',
                      // );
                      // final user1 = User.fromJson({});
                      // user1.name;
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 50),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      height: 48,
                      child: const Center(child: Text('Criar conta')),
                    ),
                  ),
                  const SizedBox(height: 25),
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
