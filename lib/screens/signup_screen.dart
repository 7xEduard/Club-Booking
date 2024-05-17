import 'package:clubs_booking/components/custom_button.dart';
import 'package:clubs_booking/components/custom_text_field.dart';
import 'package:clubs_booking/components/password_widget.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({
    super.key,
  });

  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  String? phone;

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
                  "Already have an account? ",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Log in",
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
                  'Create account!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                    color: Color(0xFF17c3b2),
                  ),
                ),
                const Text(
                  'Register to get started',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  icon: Icons.account_circle_outlined,
                  onChanged: (data) {
                    name = data;
                  },
                  hintText: "Name",
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  icon: Icons.email_outlined,
                  onChanged: (data) {
                    email = data;
                  },
                  hintText: "Email Address",
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  icon: Icons.phone_outlined,
                  onChanged: (data) {
                    phone = data;
                  },
                  hintText: "Phone",
                ),
                const SizedBox(height: 15),
                PasswordField(
                  hintText: 'Password',
                  onChanged: (data) {
                    password = data;
                  },
                ),
                const SizedBox(height: 15),
                PasswordField(
                  hintText: 'Confirm Password',
                  onChanged: (data) {
                    confirmPassword = data;
                  },
                ),
                const SizedBox(height: 30),
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
                const SizedBox(height: 20),
                CustomButton(
                  onPressed: () {},
                  labelText: 'Register',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
/**/