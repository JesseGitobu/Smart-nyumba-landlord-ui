import 'package:flutter/material.dart';
import 'package:smart_nyumba_landlord/features/authentication/presentation/landlord_log_in/screens/log_in_screen.dart';

class IHaveAnAccount extends StatelessWidget {
  const IHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
              MaterialPageRoute(builder: (context) => const LogInScreen()),
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
    );
  }
}
