import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smart_nyumba_landlord/features/authentication/presentation/splash_screen/screen/components/login_buttons.dart';
import 'package:smart_nyumba_landlord/features/authentication/presentation/splash_screen/widgets/background_widget.dart';
import 'package:smart_nyumba_landlord/constants/themes/app_theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: ScreenContent(context));
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
      width: 150,
      height: 150,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/smart1.jpeg'),
          fit: BoxFit.fill,
        ),
        shape: BoxShape.circle,
      ),
    );
    Widget AppTitle = Container(
      width: 300,
      height: 60,
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
              fontSize: 30),
        ),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Background,
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Logo,
                  ),
                  SizedBox(
                    height: WIDTH / 6,
                  ),
                  AppTitle,
                  SizedBox(
                    height: WIDTH / 5,
                  ),
                  SizedBox(
                      width: AppTheme.size(context).width * 0.6,
                      child: LandlordLoginButton(
                        key: key,
                      )),
                  const SizedBox(height: AppTheme.elementSpacing),
                  SizedBox(
                      width: AppTheme.size(context).width * 0.6,
                      child: CaretakerLoginButton(
                        key: key,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
