import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'success_screen.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class SetPassScreen extends StatelessWidget {
  const SetPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/images/icon.svg',
                      width: 24,
                      height: 24,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 53),
              Row(
                children: [
                  Text(
                    'set a new password',
                    style: Theme.of(context).textTheme.forPassH,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  SizedBox(
                    width: 324,
                    height: 48,
                    child: Text(
                      'create a new password.Ensure it differs from the previous ones for security',
                      style: Theme.of(context).textTheme.forPassS,
                      softWrap: true,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 29),
              const CustomTextField(hintText: 'Password'),
              const SizedBox(height: 28),
              const CustomTextField(hintText: 'Confirm Password'),
              const SizedBox(height: 31),
              CustomButton(
                text: 'update password',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SuccessScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
