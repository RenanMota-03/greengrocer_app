import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer_app/src/auth/components/custom_text_field.dart';
import 'package:greengrocer_app/src/auth/sign_up_screen.dart';
import 'package:greengrocer_app/src/config/custom_colors.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text.rich(
                      TextSpan(
                        style: TextStyle(fontSize: 40),
                        children: [
                          TextSpan(
                            text: "Green",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: "grocer",
                            style: TextStyle(
                              color: CustomColors.customContrastColor,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 30,
                      child: DefaultTextStyle(
                        style: TextStyle(fontSize: 25, color: Colors.white),
                        child: AnimatedTextKit(
                          pause: Duration.zero,
                          repeatForever: true,
                          animatedTexts: [
                            FadeAnimatedText('Frutas'),
                            FadeAnimatedText('Verduras'),
                            FadeAnimatedText('Legumes'),
                            FadeAnimatedText('Carnes'),
                            FadeAnimatedText('Cereais'),
                            FadeAnimatedText('Laticíneos'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 35),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    CustomTextField(label: "Email", prefixIcon: Icons.email),
                    CustomTextField(
                      label: "Senha",
                      prefixIcon: Icons.lock,
                      isSecret: true,
                    ),

                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onPressed: () {},
                        child: Text("Entrar", style: TextStyle(fontSize: 18)),
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Esqueceu a senha?",
                          style: TextStyle(
                            color: CustomColors.customContrastColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(90),
                              thickness: 2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text("ou"),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(90),
                              thickness: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(width: 2, color: Colors.green),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Criar conta',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
