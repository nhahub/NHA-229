import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../login/screens/login_screen.dart';
import '../widgets/custom_button.dart';

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
                    'successful',
                    style: Theme.of(context).textTheme.forPassH,
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
                'Congratulations!Your password has been changed.Click continue to login',
                style: Theme.of(context).textTheme.forPassS,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 18),
              CustomButton(
                text: 'continue',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
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
