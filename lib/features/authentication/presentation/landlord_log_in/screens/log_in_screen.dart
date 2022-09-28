import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_nyumba_landlord/features/authentication/presentation/landlord_log_in/screens/components/log_in_form.dart';
import 'package:smart_nyumba_landlord/features/authentication/application/auth_services.dart';
import 'package:smart_nyumba_landlord/features/authentication/presentation/landlord_log_in/screens/components/no_account.dart';
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
            const LogInForm(),
            const Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: DontHaveAnAccount(),
            ),
          ],
        ),
      ),
    ]);
  }
}
