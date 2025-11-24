import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mostawak/core/constants/app_assets.dart';

import '../../../../generated/l10n.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 99, horizontal: 28),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(AppAssets.raad),
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
                    SvgPicture.asset(AppAssets.ellipse),
                    SvgPicture.asset(AppAssets.check),
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
                        Navigator.pop(
                          context,
                        );
                      },
                      child: Text(
                        S.current.cont,
                        style:
                            Theme.of(context).textTheme.displayLarge?.copyWith(
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
      ),
    );
  }
}
