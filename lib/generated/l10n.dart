// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Check Your Email`
  String get checkYourEmail {
    return Intl.message(
      'Check Your Email',
      name: 'checkYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `We sent a reset link to `
  String get sentMessage1 {
    return Intl.message(
      'We sent a reset link to ',
      name: 'sentMessage1',
      desc: '',
      args: [],
    );
  }

  /// ` enter 6 digit code that mentioned in the email`
  String get sentMessage2 {
    return Intl.message(
      ' enter 6 digit code that mentioned in the email',
      name: 'sentMessage2',
      desc: '',
      args: [],
    );
  }

  /// `Verification failed. Check the code and try again`
  String get verificationFailed {
    return Intl.message(
      'Verification failed. Check the code and try again',
      name: 'verificationFailed',
      desc: '',
      args: [],
    );
  }

  /// `Verify Code`
  String get verifyCode {
    return Intl.message('Verify Code', name: 'verifyCode', desc: '', args: []);
  }

  /// `haven't got the email yet?`
  String get gotEmail {
    return Intl.message(
      'haven\'t got the email yet?',
      name: 'gotEmail',
      desc: '',
      args: [],
    );
  }

  /// `Resend email`
  String get resendEmail {
    return Intl.message(
      'Resend email',
      name: 'resendEmail',
      desc: '',
      args: [],
    );
  }

  /// `Email Resent`
  String get emailResent {
    return Intl.message(
      'Email Resent',
      name: 'emailResent',
      desc: '',
      args: [],
    );
  }

  /// `Password Reset`
  String get passwordReset {
    return Intl.message(
      'Password Reset',
      name: 'passwordReset',
      desc: '',
      args: [],
    );
  }

  /// `your password has been successfully reset. Click confirm to set a new password`
  String get passwordResetMessage {
    return Intl.message(
      'your password has been successfully reset. Click confirm to set a new password',
      name: 'passwordResetMessage',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Set a new password`
  String get setNewPassword {
    return Intl.message(
      'Set a new password',
      name: 'setNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Create a new password. Ensure it differs form the previous ones for security`
  String get setPasswordMessage {
    return Intl.message(
      'Create a new password. Ensure it differs form the previous ones for security',
      name: 'setPasswordMessage',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Update Password`
  String get updatePassword {
    return Intl.message(
      'Update Password',
      name: 'updatePassword',
      desc: '',
      args: [],
    );
  }

  /// `Successful`
  String get resetSuccess {
    return Intl.message('Successful', name: 'resetSuccess', desc: '', args: []);
  }

  /// `Check Your Email! We sent a reset link to your email. Reset your password and login`
  String get resetSuccessMessage {
    return Intl.message(
      'Check Your Email! We sent a reset link to your email. Reset your password and login',
      name: 'resetSuccessMessage',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get cont {
    return Intl.message('Continue', name: 'cont', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
