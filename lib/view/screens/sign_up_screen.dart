import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xtintas_app/controller/stores/user_store.dart';
import 'package:xtintas_app/view/widgets/rounded_button_widget.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/validators/form_validators.dart';
import '../widgets/input_decoration_widget.dart';
import '../widgets/label_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isObscureText1 = true;
  bool isObscureText2 = true;
  String? _confirmPassword;

  final _key = GlobalKey<FormState>();

  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  UserStore userStore = UserStore();

  @override
  void dispose() {
    _controllerName.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF5B4DA7),
      body: Stack(
        children: [
          Container(),
          Observer(builder: (context) {
            return Form(
              key: _key,
              child: GestureDetector(
                onTap: FocusScope.of(context).unfocus,
                child: SingleChildScrollView(
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
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecorationCustom.customDecoration(
                            placeHolder: 'Type your name!',
                          ),
                          controller: _controllerName,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          validator: Validators.nameValidator,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          cursorColor: AppColors.cursorColor,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(25)
                          ],
                        ),
                        const LabelInput('Email'),
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
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
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecorationCustom.customDecoration(
                            placeHolder: 'Type your password!',
                          ).copyWith(
                            suffixIcon: ExcludeFocus(
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isObscureText1 = !isObscureText1;
                                  });
                                },
                                icon: Icon(
                                  isObscureText1
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          onChanged: (v) {
                            setState(() {
                              _confirmPassword = v;
                            });
                          },
                          controller: _controllerPassword,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          obscureText: isObscureText1,
                          validator: Validators.passwordValidator,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          cursorColor: AppColors.cursorColor,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(16)
                          ],
                        ),
                        const LabelInput('Confirmar senha'),
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecorationCustom.customDecoration(
                            placeHolder: 'Confirm your password!',
                          ).copyWith(
                            suffixIcon: ExcludeFocus(
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isObscureText2 = !isObscureText2;
                                  });
                                },
                                icon: Icon(
                                  isObscureText2
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          obscureText: isObscureText2,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo obrigatório';
                            }
                            if (value != _confirmPassword) {
                              return 'Senhas não coincidem!';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          cursorColor: AppColors.cursorColor,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(16)
                          ],
                        ),
                        const SizedBox(height: 25),
                        // GestureDetector(
                        //   onTap: () {},
                        //   child: Container(
                        //     margin: const EdgeInsets.symmetric(horizontal: 50),
                        //     decoration: BoxDecoration(
                        //         color: Colors.white,
                        //         borderRadius: BorderRadius.circular(50)),
                        //     height: 48,
                        //     child: const Center(child: Text('Criar conta')),
                        //   ),
                        // ),
                        RoundedButton(
                          onTapButton: () async {
                            userStore.setName(_controllerName.text);
                            userStore.setEmail(_controllerEmail.text);
                            userStore.setPassword(_controllerPassword.text);
                            if (_key.currentState!.validate()) {
                              final hasSignUp = await userStore.signUp();
                              if (hasSignUp) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text('Usuário cadastrado com sucesso!'),
                                  ),
                                );
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    '/signInScreen', (route) => false);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Usuário já cadastrado!'),
                                  ),
                                );
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Preencha todos os campos acima!',
                                  ),
                                ),
                              );
                            }
                          },
                          backgroundColor: Colors.white,
                          child: const Text('Criar conta'),
                        ),
                        const SizedBox(height: 25),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
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
