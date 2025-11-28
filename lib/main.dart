import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mostawak/data/preferences/preference_manager.dart';
import 'package:mostawak/features/profile/profile.dart';
import 'package:mostawak/features/settings/controllers/language_controller.dart';
import 'firebase_options.dart';
import 'core/theme/light_theme.dart';
import 'generated/l10n.dart';
import 'features/auth/onboarding/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await PreferenceManager().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final String language =
        PreferenceManager().getString('languageCode') ?? 'en';
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => LanguageController(language),
          child: BlocBuilder<LanguageController, String>(
            builder: (context, languageState) {
              return MaterialApp(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                theme: LightTheme.theme(Locale(languageState)),
                home: ProfilePage(),
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                locale: Locale(languageState),
              );
            },
          ),
        );
      },
    );
  }
}
