import 'package:flutter/material.dart';
import 'package:smart_nyumba_landlord/constants/themes/app_theme.dart';
import 'package:smart_nyumba_landlord/features/authentication/presentation/landlord_log_in/screens/log_in_screen.dart';
import 'package:smart_nyumba_landlord/common_widgets/custom_button.dart';
import 'package:smart_nyumba_landlord/features/property_management/presentation/screens/property/property_screen.dart';

class LandlordLoginButton extends StatelessWidget {
  const LandlordLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        title: "Landlord",
        titleStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.none,
            fontFamily: 'Roboto Condensed',
            fontSize: 24),
        gradiant: const [AppTheme.gold],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LogInScreen()),
          );
        });
  }
}

class CaretakerLoginButton extends StatelessWidget {
  const CaretakerLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        title: "Caretaker",
        titleStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.none,
            fontFamily: 'Roboto Condensed',
            fontSize: 24),
        gradiant: const [AppTheme.gold],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PropertyScreen()),
          );
        });
  }
}
