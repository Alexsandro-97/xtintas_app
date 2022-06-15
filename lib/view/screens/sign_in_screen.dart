import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xtintas_app/utils/validators/form_validators.dart';

import '/controller/stores/user_store.dart';
import '/view/screens/sign_up_screen.dart';
import '../../utils/colors/app_colors.dart';
import '../widgets/input_decoration_widget.dart';
import '../widgets/label_widget.dart';
import '../widgets/rounded_button_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  UserStore userStore = UserStore();
  final _key = GlobalKey<FormState>();

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgroundSignInColor,
      body: Stack(
        children: [
          Container(),
          Form(
            key: _key,
            child: GestureDetector(
              onTap: FocusScope.of(context).unfocus,
              child: SingleChildScrollView(
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
                      const SizedBox(height: 20),
                      const LabelInput('Email'),
                      TextFormField(
                        decoration: InputDecorationCustom.customDecoration(
                          placeHolder: 'Type your email!',
                        ),
                        controller: _controllerEmail,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        validator: Validators.emailValidator,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        cursorColor: AppColors.cursorColor,
                      ),
                      const LabelInput('Senha'),
                      TextFormField(
                        decoration: InputDecorationCustom.customDecoration(
                          placeHolder: 'Type your password!',
                        ).copyWith(
                          helperText: 'Mínimo de 8 caracteres!',
                          helperStyle: const TextStyle(color: Colors.white),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                            },
                            icon: Icon(
                              isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        controller: _controllerPassword,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        obscureText: isObscure,
                        validator: Validators.passwordValidator,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        cursorColor: AppColors.cursorColor,
                        inputFormatters: [LengthLimitingTextInputFormatter(16)],
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
                        onTapButton: () async {
                          final formState = Form.of(context);
                          if (formState != null && formState.validate()) {
                            bool hasLogin = userStore.signIn();
                            print(hasLogin);
                            if (hasLogin) {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/homeScreen', (route) => false);
                            } else {
                              _controllerPassword.clear();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Email ou senha incorretos!'),
                                ),
                              );
                            }
                          }
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
            ),
          ),
        ],
      ),
    );
  }
}
