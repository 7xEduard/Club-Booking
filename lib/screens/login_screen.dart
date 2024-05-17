import 'package:clubs_booking/components/custom_button.dart';
import 'package:clubs_booking/components/custom_text_field.dart';
import 'package:clubs_booking/components/password_widget.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key, this.email, this.password});

  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FooterView(
        footer: Footer(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'SignupScreen');
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      color: Color(0xFF17c3b2),
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFF17c3b2),
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                const Text(
                  'Welcome back!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                    color: Color(0xFF17c3b2),
                  ),
                ),
                const Text(
                  'Enter your credentiails to continue',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  icon: Icons.email_outlined,
                  onChanged: (data) {
                    email = data;
                  },
                  hintText: "Email Address",
                ),
                const SizedBox(height: 15),
                PasswordField(
                  hintText: 'Password',
                  onChanged: (data) {
                    password = data;
                  },
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'SignupScreen');
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Color(0xFF17c3b2),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                CustomButton(
                  onPressed: () {},
                  labelText: 'Login',
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          Column(
            children: [
              const Text(
                'By logging, you are agreeing with our',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Terms of Use",
                      style: TextStyle(
                        color: Color(0xFF17c3b2),
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFF17c3b2),
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const Text(
                    " and ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Privacy Policy",
                      style: TextStyle(
                        color: Color(0xFF17c3b2),
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFF17c3b2),
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
