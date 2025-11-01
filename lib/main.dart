import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mostawak/features/achievement/achievement.dart';
import 'package:mostawak/features/auth/onboarding/splash.dart';
import 'package:mostawak/features/home/home/screens/main_screen.dart';
import 'package:mostawak/features/profile/profile.dart';
import 'package:mostawak/features/progress_overview/progress_overview.dart';
import 'package:mostawak/features/settings/settings.dart';

import 'core/theme/light_theme.dart';

import 'features/home/challenges/screens/challenges_screen.dart';
import 'generated/l10n.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final Locale _language = const Locale('en');

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) { 
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: LightTheme.theme(_language),
          home:  const ProfilePage(),  
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: _language,
        );
      },
    );
  }
}
