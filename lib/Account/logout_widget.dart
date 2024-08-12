import 'package:flutter/material.dart';
import 'package:your_ear_fits/Account/logout.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ElevatedButton(
      onPressed: Logout.logout,
      child: Text(
        'Logout',
      ),
    );
  }
}
