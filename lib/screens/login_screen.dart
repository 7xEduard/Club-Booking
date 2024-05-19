import 'package:clubs_booking/components/custom_button.dart';
import 'package:clubs_booking/components/custom_text_field.dart';
import 'package:clubs_booking/components/password_widget.dart';
import 'package:clubs_booking/service/api.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> logInKey = GlobalKey();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

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
            child: Form(
              key: logInKey,
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
                    controller: emailAddressController,
                    icon: Icons.email_outlined,
                    onChanged: (data) {},
                    hintText: "Email Address",
                    validator: emailValidate,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 15),
                  PasswordField(
                    controller: passwordController,
                    hintText: 'Password',
                    onChanged: (data) {},
                    validator: passwordValidate,
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Color(0xFF17c3b2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                    onPressed: () async {
                      if (logInKey.currentState!.validate()) {
                        API api = API();
                        api.loginPushData(
                          email: emailAddressController.text,
                          password: passwordController.text,
                        );

                        if (await api.loginResponse(
                          email: emailAddressController.text,
                          password: passwordController.text,
                        )) {
                          Navigator.pushNamed(context, 'Home');
                        } else {
                          showMessage(context, "Invalid Email Or Password");
                        }
                        logInKey.currentState!.reset();
                        emailAddressController.clear();
                        passwordController.clear();
                      }
                    },
                    labelText: 'Login',
                  ),
                ],
              ),
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

  String? emailValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email must not be empty.';
    } else if (!EmailValidator.validate(value)) {
      return 'Email syntax is not valid.';
    }
    return null;
  }

  String? passwordValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password must not be empty.';
    } else if (value.length < 6) {
      return 'Password must be at least 6 digits.';
    }
    return null;
  }

  void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
