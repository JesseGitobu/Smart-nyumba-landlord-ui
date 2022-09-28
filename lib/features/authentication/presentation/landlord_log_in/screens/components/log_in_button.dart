import 'package:flutter/material.dart';
import 'package:smart_nyumba_landlord/constants/themes/app_theme.dart';
import 'package:smart_nyumba_landlord/features/authentication/presentation/landlord_sign_up/screens/sign_up_screen.dart';
import 'package:smart_nyumba_landlord/common_widgets/custom_button.dart';
import 'package:smart_nyumba_landlord/features/authentication/application/auth_services.dart';
import 'package:smart_nyumba_landlord/features/authentication/presentation/landlord_log_in/screens/components/log_in_form.dart';

class LogInButton extends StatelessWidget {
  final Function()? onTap;
  const LogInButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: "Confirm",
      titleStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          decoration: TextDecoration.none,
          fontFamily: 'Roboto Condensed',
          fontSize: 24),
      gradiant: const [AppTheme.gold],
      onTap: onTap,
    );
  }
}
