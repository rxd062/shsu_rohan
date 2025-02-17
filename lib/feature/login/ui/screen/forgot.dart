import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kat_game/common/constant/images.dart';
import 'package:kat_game/common/widgets/buttons/common_rounded_button.dart';
import 'package:kat_game/common/widgets/form_fields/text_field_with_names.dart';
import 'package:kat_game/feature/home/ui/screen/home_page.dart';
import 'package:kat_game/feature/login/controller/login_controller.dart';
import 'package:kat_game/feature/login/controller/register_controller.dart';
import 'package:kat_game/feature/login/controller/resetcontroller.dart';
import 'package:kat_game/feature/login/ui/screen/login.dart';
import 'package:kat_game/feature/login/ui/screen/register.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  TextEditingController email = TextEditingController();
  // bool isObscure = true;
  // IconData showPassword = Icons.visibility;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            width: width,
            child: Column(
              children: [
                const SizedBox(
                  height: 128,
                ),
                Image.asset(
                  Images.bigbearkat,
                  height: 120,
                ),
                const SizedBox(
                  height: 64,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: FormFieldsWithName(
                      name: 'Email',
                      textEditingController: email,
                    )),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: RichText(
                    text: TextSpan(
                        text: 'Do you have an account? ',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        children: [
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) => const Register()),
                                    ),
                                  );
                                },
                              text: 'Sign up',
                              style: TextStyle(
                                fontSize: 14,
                                color: theme.primaryColor,
                              ))
                        ]),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: CommonRoundedButton(
                    name: 'Reset Password',
                    onTap: () async {
                      ResetController handlepassreset = ResetController();
                      handlepassreset.reset(email.text);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const Login();
                        }),
                        (route) => false,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 64,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
