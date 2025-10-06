import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'success_screen.dart';
import '../../../../generated/l10n.dart';
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
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_sharp,
                      color: Color(0xff16697b),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 53),
              Row(
                children: [
                  Text(
                    S.current.setNewPassword,
                    style: Theme.of(context).textTheme.displayLarge,
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
                      S.current.setPasswordMessage,
                      style: Theme.of(context).textTheme.bodySmall,
                      softWrap: true,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 29),
              // TODO: Add validation to the text fields
              CustomTextField(
                hintText: S.current.password,
              ), // TODO: use the custom text field from lib/features/auth/login/widgets/custom_textfield.dart
              const SizedBox(height: 28),
              CustomTextField(
                // TODO: use the custom text field from lib/features/auth/login/widgets/custom_textfield.dart
                hintText: '${S.current.confirm} ${S.current.password}',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 31.0,
                  // horizontal: 14,
                ),
                child: SizedBox(
                  width: 309.w,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SuccessScreen(),
                        ),
                      );
                    },
                    child: Text(
                      S.of(context).updatePassword,
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context)
                            .elevatedButtonTheme
                            .style
                            ?.foregroundColor
                            ?.resolve({}),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
