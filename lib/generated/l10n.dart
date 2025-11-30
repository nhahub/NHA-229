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

  /// `Welcome to`
  String get welcome {
    return Intl.message('Welcome to', name: 'welcome', desc: '', args: []);
  }

  /// `Your place to learn and develop in simple and easy steps`
  String get welcomeMessage {
    return Intl.message(
      'Your place to learn and develop in simple and easy steps',
      name: 'welcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Challenge Your Friends!`
  String get challengeYourFriends {
    return Intl.message(
      'Challenge Your Friends!',
      name: 'challengeYourFriends',
      desc: '',
      args: [],
    );
  }

  /// `Compete with your friends, test your knowledge, and make learning more exciting`
  String get challengeYourFriendsMessage {
    return Intl.message(
      'Compete with your friends, test your knowledge, and make learning more exciting',
      name: 'challengeYourFriendsMessage',
      desc: '',
      args: [],
    );
  }

  /// `Learn with Fun`
  String get learnWithFun {
    return Intl.message(
      'Learn with Fun',
      name: 'learnWithFun',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy a different educational journey full of fun, challenge, and Interactions`
  String get learnWithFunMessage {
    return Intl.message(
      'Enjoy a different educational journey full of fun, challenge, and Interactions',
      name: 'learnWithFunMessage',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message('Get Started', name: 'getStarted', desc: '', args: []);
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `This field is required`
  String get fieldRequired {
    return Intl.message(
      'This field is required',
      name: 'fieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters`
  String get passwordLength {
    return Intl.message(
      'Password must be at least 6 characters',
      name: 'passwordLength',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `I accept `
  String get accept {
    return Intl.message('I accept ', name: 'accept', desc: '', args: []);
  }

  /// `Terms & Conditions`
  String get termsConditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'termsConditions',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `or`
  String get or {
    return Intl.message('or', name: 'or', desc: '', args: []);
  }

  /// `Continue with Google`
  String get continueWithGoogle {
    return Intl.message(
      'Continue with Google',
      name: 'continueWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account? ',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Failed to sign up. Please try again.`
  String get failedToSignUp {
    return Intl.message(
      'Failed to sign up. Please try again.',
      name: 'failedToSignUp',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get validEmail {
    return Intl.message(
      'Please enter a valid email',
      name: 'validEmail',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Failed to login. Please try again.`
  String get failedToLogin {
    return Intl.message(
      'Failed to login. Please try again.',
      name: 'failedToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get doNotHaveAccount {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'doNotHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `please enter your email to receive a password reset link`
  String get resetPasswordMessage {
    return Intl.message(
      'please enter your email to receive a password reset link',
      name: 'resetPasswordMessage',
      desc: '',
      args: [],
    );
  }

  /// `Send Reset Link`
  String get sendResetLink {
    return Intl.message(
      'Send Reset Link',
      name: 'sendResetLink',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
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
