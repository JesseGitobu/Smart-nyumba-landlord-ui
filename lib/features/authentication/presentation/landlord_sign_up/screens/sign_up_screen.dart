import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_nyumba_landlord/features/authentication/application/auth_services.dart';
import 'package:smart_nyumba_landlord/common_widgets/custom_button.dart';
import 'package:smart_nyumba_landlord/features/authentication/presentation/landlord_log_in/screens/log_in_screen.dart';
import 'package:smart_nyumba_landlord/constants/themes/app_theme.dart';
import 'package:smart_nyumba_landlord/features/authentication/presentation/splash_screen/widgets/background_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: ScreenContent(context),
        ),
      ),
    );
  }

  Widget ScreenContent(BuildContext context) {
    double WIDTH = MediaQuery.of(context).size.width;
    Widget Background = CustomPaint(
      size: Size(
          WIDTH,
          (WIDTH * 2.163551401869159)
              .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
      painter: RPSCustomPainter(),
    );
    Widget Logo = Container(
      width: 100,
      height: 100,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/smart1.jpeg'),
          fit: BoxFit.fill,
        ),
        shape: BoxShape.circle,
      ),
    );
    Widget AppTitle = Container(
      width: 230,
      height: 50,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
        child: Text(
          'SMART ESTATE',
          style: TextStyle(
              color: HexColor("#927F19"),
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.none,
              fontFamily: 'Roboto Serif',
              fontSize: 24),
        ),
      ),
    );

    Widget LoginButton = CustomButton(
        title: "Confirm",
        titleStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.none,
            fontFamily: 'Roboto Condensed',
            fontSize: 24),
        gradiant: const [AppTheme.gold],
        onTap: () {});
    return Stack(children: [
      Background,
      Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Logo,
            ),
            SizedBox(
              height: WIDTH / 12,
            ),
            AppTitle,
            SizedBox(
              height: WIDTH / 15,
            ),
            LoginForm(context),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: Row(
                children: [
                  const Text(
                    'I have an account?',
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none,
                        fontFamily: 'PT Serif',
                        fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LogInScreen()),
                      );
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Color.fromARGB(255, 212, 175, 5),
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none,
                        fontFamily: 'PT Serif',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  Widget LoginForm(BuildContext context) {
    Widget LoginButton = CustomButton(
      title: "Confirm",
      titleStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          decoration: TextDecoration.none,
          fontFamily: 'Roboto Condensed',
          fontSize: 24),
      gradiant: const [AppTheme.gold],
      onTap: () {
        if (_signUpFormKey.currentState!.validate()) {
          signUpUser();
        }
      },
    );
    return Container(
        height: 423,
        width: 330,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.white,
        ),
        child: Form(
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
                      child: TextFormField(
                        controller: _fnameController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          hintText: 'First Name',
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(
                                color: Colors.black87,
                                width: 2,
                                style: BorderStyle.solid),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(
                                color: Colors.black87,
                                width: 2,
                                style: BorderStyle.solid),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(
                                color: Colors.redAccent,
                                width: 2,
                                style: BorderStyle.solid),
                          ),
                          labelText: 'First Name',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          fillColor: Colors.white,
                        ),
                        onSaved: (String? value) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Firstname cannot be empty";
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
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        controller: _snameController,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
                          hintText: 'Second Name',
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(
                                color: Colors.black87,
                                width: 2,
                                style: BorderStyle.solid),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(
                                color: Colors.black87,
                                width: 2,
                                style: BorderStyle.solid),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(
                                color: Colors.redAccent,
                                width: 2,
                                style: BorderStyle.solid),
                          ),
                          labelText: 'Second Name',
                          fillColor: Colors.white,
                        ),
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
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    hintText: 'E-mail',
                    labelText: 'E-mail',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(
                          color: Colors.black87,
                          width: 2,
                          style: BorderStyle.solid),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(
                          color: Colors.black87,
                          width: 2,
                          style: BorderStyle.solid),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(
                          color: Colors.redAccent,
                          width: 2,
                          style: BorderStyle.solid),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    fillColor: Colors.white,
                  ),
                  onSaved: (String? value) {},
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "email cannot be empty";
                    }
                  },
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 55,
                width: 270,
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: _phoneController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(
                          color: Colors.black87,
                          width: 2,
                          style: BorderStyle.solid),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(
                          color: Colors.black87,
                          width: 2,
                          style: BorderStyle.solid),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(
                          color: Colors.redAccent,
                          width: 2,
                          style: BorderStyle.solid),
                    ),
                    hintText: 'Phone Number',
                    labelText: 'Phone Number',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    fillColor: Colors.white,
                  ),
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
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _passwordController,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(
                          color: Colors.black87,
                          width: 2,
                          style: BorderStyle.solid),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(
                          color: Colors.black87,
                          width: 2,
                          style: BorderStyle.solid),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(
                          color: Colors.redAccent,
                          width: 2,
                          style: BorderStyle.solid),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'Password',
                    labelText: 'Password',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    fillColor: Colors.white,
                  ),
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
                child: SizedBox(height: 60, width: 150, child: LoginButton),
              )
            ],
          ),
        ));
  }
}
