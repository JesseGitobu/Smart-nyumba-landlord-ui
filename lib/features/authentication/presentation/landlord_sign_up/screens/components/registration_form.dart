import 'package:flutter/material.dart';
import 'package:smart_nyumba_landlord/features/authentication/application/auth_services.dart';
import 'package:smart_nyumba_landlord/features/authentication/presentation/landlord_sign_up/widget/custom_textfield.dart';
import 'package:smart_nyumba_landlord/features/authentication/presentation/landlord_sign_up/screens/components/registration_button.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _signUpFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _fnameController = TextEditingController();
  final TextEditingController _snameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _fnameController.dispose();
    _snameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      firstName: _fnameController.text,
      secondName: _snameController.text,
      phoneNumber: _phoneController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signUpFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: const Text(
              'Register',
              style: TextStyle(
                  color: Color.fromARGB(255, 212, 175, 5),
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.none,
                  fontFamily: 'Roboto Condensed',
                  fontSize: 24),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                SizedBox(
                  height: 55,
                  width: 130,
                  child: CustomTextField(
                    controller: _emailController,
                    obscure: false,
                    hint: 'Enter your First Name ',
                    title: 'First Name',
                    prefix: const Icon(Icons.email_outlined),
                    onSaved: (String? value) {},
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "First Name cannot be empty";
                      }
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  height: 55,
                  width: 140,
                  child: CustomTextField(
                    controller: _emailController,
                    obscure: false,
                    hint: 'Enter your Second Name',
                    title: 'Second Name',
                    prefix: const Icon(Icons.email_outlined),
                    onSaved: (String? value) {},
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Second Name cannot be empty";
                      }
                    },
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 55,
            width: 270,
            child: CustomTextField(
              controller: _emailController,
              obscure: false,
              hint: 'Enter your E-mail ',
              title: 'E-mail address',
              prefix: const Icon(Icons.email_outlined),
              onSaved: (String? value) {},
              validator: (String? value) {
                if (value!.isEmpty) {
                  return "Email Address cannot be empty";
                }
              },
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 55,
            width: 270,
            child: CustomTextField(
              controller: _emailController,
              obscure: false,
              hint: 'Enter your Phone Number ',
              title: 'Phone Number',
              prefix: const Icon(Icons.email_outlined),
              onSaved: (String? value) {},
              validator: (String? value) {
                if (value!.isEmpty) {
                  return "phone Number cannot be empty";
                }
              },
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 55,
            width: 270,
            child: CustomTextField(
              controller: _emailController,
              obscure: false,
              hint: 'Enter your Password',
              title: 'Password',
              prefix: const Icon(Icons.email_outlined),
              onSaved: (String? value) {},
              validator: (String? value) {
                if (value!.isEmpty) {
                  return "Password cannot be empty";
                }
              },
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: SizedBox(
                height: 60,
                width: 150,
                child: RegisterButton(
                  onTap: () {
                    if (_signUpFormKey.currentState!.validate()) {
                      signUpUser();
                    }
                  },
                )),
          )
        ],
      ),
    );
  }
}
