import 'package:clubs_booking/components/custom_button.dart';
import 'package:clubs_booking/components/custom_text_field.dart';
import 'package:clubs_booking/components/password_widget.dart';
import 'package:clubs_booking/models/response_model.dart';
import 'package:clubs_booking/service/api.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({
    super.key,
  });

  final GlobalKey<FormState> signUpKey = GlobalKey();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

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
            child: Form(
              key: signUpKey,
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
                    onChanged: (data) {},
                    keyboardType: TextInputType.name,
                    controller: nameController,
                    hintText: "Name",
                    validator: nameValidate,
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    keyboardType: TextInputType.emailAddress,
                    icon: Icons.email_outlined,
                    onChanged: (data) {},
                    controller: emailAddressController,
                    hintText: "Email Address",
                    validator: emailValidate,
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    icon: Icons.phone_outlined,
                    onChanged: (data) {},
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                    hintText: "Phone",
                    validator: phoneValidate,
                  ),
                  const SizedBox(height: 15),
                  PasswordField(
                    hintText: 'Password',
                    onChanged: (data) {},
                    validator: passwordValidate,
                    controller: passwordController,
                  ),
                  const SizedBox(height: 15),
                  PasswordField(
                    hintText: 'Confirm Password',
                    validator: confirmPasswordValidate,
                    onChanged: (data) {},
                    controller: confirmPasswordController,
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
                    onPressed: () async {
                      if (signUpKey.currentState!.validate()) {
                        API api = API();
                        api.registerPushData(
                            name: nameController.text,
                            email: emailAddressController.text,
                            password: passwordController.text,
                            phoneNumber: phoneController.text);
                        
                        ResponseModel responseModel =
                            await api.regirterResponse(
                                name: nameController.text,
                                email: emailAddressController.text,
                                password: passwordController.text,
                                phoneNumber: phoneController.text);

                        if (responseModel.status == "success") {
                          Navigator.pushNamed(context, 'Home');
                        } else {
                          showMessage(context, responseModel.message);
                        }
                        signUpKey.currentState!.reset();
                        nameController.clear();
                        emailAddressController.clear();
                        passwordController.clear();
                        confirmPasswordController.clear();
                        phoneController.clear();
                      }
                    },
                    labelText: 'Register',
                  ),
                ],
              ),
            ),
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

  String? confirmPasswordValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'please confirm your password.';
    } else if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  String? nameValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name must not be empty.';
    }
    return null;
  }

  String? phoneValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone must not be empty.';
    } else if (value.length < 11 || value.length > 11) {
      return 'Phone must be at least 11 digits.';
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
/**/