import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../login/screens/login_screen.dart';
import '../../../../generated/l10n.dart';

extension CustomTextTheme on TextTheme {
  TextStyle get forPassH => const TextStyle(
    fontSize: 40,
    color: Color(0xff16697B),
    fontFamily: 'BebasNeue',
  );
  TextStyle get forPassS => const TextStyle(
    fontSize: 16,
    color: Color(0xff9E9E9E),
    fontFamily: 'Poppins',
  );
}

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 99, horizontal: 28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset('assets/images/raad.svg'),
                  Text(
                    S.current.resetSuccess.toUpperCase(),
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 35),
              Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset('assets/images/Ellipse.svg'),
                  SvgPicture.asset('assets/images/Check.svg'),
                ],
              ),
              const SizedBox(height: 35),
              Text(
                S.current.resetSuccessMessage,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: SizedBox(
                  width: 309,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      S.current.cont,
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
