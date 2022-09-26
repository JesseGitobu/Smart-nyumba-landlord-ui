import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_nyumba_landlord/common_widgets/custom_button.dart';
import 'package:smart_nyumba_landlord/features/authentication/application/auth_services.dart';
import 'package:smart_nyumba_landlord/features/authentication/presentation/landlord_sign_up/screens/sign_up_screen.dart';
import 'package:smart_nyumba_landlord/constants/themes/app_theme.dart';
import 'package:smart_nyumba_landlord/features/authentication/presentation/splash_screen/widgets/background_widget.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
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
              padding: const EdgeInsets.only(top: 10),
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
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Row(
                children: [
                  const Text(
                    'Dont have an account?',
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
                            builder: (context) => const SignUpScreen()),
                      );
                    },
                    child: const Text(
                      'Register',
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
    Widget ForgotPassword = TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignUpScreen()),
        );
      },
      child: const Text(
        'Forgot Password?',
        style: TextStyle(
          color: Color.fromARGB(255, 212, 175, 5),
          fontWeight: FontWeight.w700,
          decoration: TextDecoration.none,
          fontFamily: 'PT Serif',
          fontSize: 20,
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
      onTap: () {
        // Validate returns true if the form is valid, or false otherwise.
        if (_signInFormKey.currentState!.validate()) {
          signInUser();
        }
        ;
      },
    );
    return Container(
        height: 390,
        width: 300,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.white,
        ),
        child: Form(
          key: _signInFormKey,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Log In',
                  style: TextStyle(
                      color: Color.fromARGB(255, 212, 175, 5),
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                      fontFamily: 'Roboto Condensed',
                      fontSize: 40),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  height: 60,
                  width: 270,
                  child: TextFormField(
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
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.email_outlined),
                      hintText: 'Enter your E-mail ',
                      labelText: 'E-mail address',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      fillColor: Colors.white,
                    ),
                    onSaved: (String? value) {},
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Email Address cannot be empty";
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  height: 60,
                  width: 270,
                  child: TextFormField(
                    obscureText: true,
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
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Password',
                      labelText: 'Password',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      fillColor: Colors.white,
                    ),
                    onSaved: (String? password) {},
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Password cannot be empty";
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(100, 10, 0, 0),
                child: ForgotPassword,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: SizedBox(height: 60, width: 150, child: LoginButton),
                ),
              )
            ],
          ),
        ));
  }
}
