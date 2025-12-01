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

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Learn`
  String get learn {
    return Intl.message('Learn', name: 'learn', desc: '', args: []);
  }

  /// `Challenges`
  String get challenges {
    return Intl.message('Challenges', name: 'challenges', desc: '', args: []);
  }

  /// `Shop`
  String get shop {
    return Intl.message('Shop', name: 'shop', desc: '', args: []);
  }

  /// `Stats & Dashboard`
  String get statsDashboard {
    return Intl.message(
      'Stats & Dashboard',
      name: 'statsDashboard',
      desc: '',
      args: [],
    );
  }

  /// `Chat with AI`
  String get chatWithAI {
    return Intl.message('Chat with AI', name: 'chatWithAI', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Zero to Hero`
  String get zeroToHero {
    return Intl.message('Zero to Hero', name: 'zeroToHero', desc: '', args: []);
  }

  /// `Item Shop`
  String get itemShop {
    return Intl.message('Item Shop', name: 'itemShop', desc: '', args: []);
  }

  /// `Learn Smarter`
  String get learnSmarter {
    return Intl.message(
      'Learn Smarter',
      name: 'learnSmarter',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get chat {
    return Intl.message('Chat', name: 'chat', desc: '', args: []);
  }

  /// `Start Learning with Mostawak! 📚\nDiscover interactive lessons and practical exercises that guide you step by step, helping you build skills and stay motivated on your journey`
  String get learnCardContent {
    return Intl.message(
      'Start Learning with Mostawak! 📚\nDiscover interactive lessons and practical exercises that guide you step by step, helping you build skills and stay motivated on your journey',
      name: 'learnCardContent',
      desc: '',
      args: [],
    );
  }

  /// `Start from zero and level up your skills step by step. Complete daily tasks, earn points, unlock ranks, and become the hero of your learning journey!`
  String get challengeCardContent {
    return Intl.message(
      'Start from zero and level up your skills step by step. Complete daily tasks, earn points, unlock ranks, and become the hero of your learning journey!',
      name: 'challengeCardContent',
      desc: '',
      args: [],
    );
  }

  /// `Explore and unlock extra features that enhance your experience! From advanced learning tools to exclusive content and rewards, everything you need is at your fingertips to get the most out of the app.`
  String get itemShopCardContent {
    return Intl.message(
      'Explore and unlock extra features that enhance your experience! From advanced learning tools to exclusive content and rewards, everything you need is at your fingertips to get the most out of the app.',
      name: 'itemShopCardContent',
      desc: '',
      args: [],
    );
  }

  /// ` Track your progress and performance all in one place! Get clear insights, see your achievements, and stay motivated with real-time statistics and an interactive dashboard.`
  String get statsCardContent {
    return Intl.message(
      ' Track your progress and performance all in one place! Get clear insights, see your achievements, and stay motivated with real-time statistics and an interactive dashboard.',
      name: 'statsCardContent',
      desc: '',
      args: [],
    );
  }

  /// `Discuss your lessons, fix your mistakes, and improve step by step. Your AI tutor is here to guide you from Zero to Hero!`
  String get chatCardContent {
    return Intl.message(
      'Discuss your lessons, fix your mistakes, and improve step by step. Your AI tutor is here to guide you from Zero to Hero!',
      name: 'chatCardContent',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `Programming`
  String get programming {
    return Intl.message('Programming', name: 'programming', desc: '', args: []);
  }

  /// `Science`
  String get science {
    return Intl.message('Science', name: 'science', desc: '', args: []);
  }

  /// `Math`
  String get math {
    return Intl.message('Math', name: 'math', desc: '', args: []);
  }

  /// `Ready to learn something\nnew today?`
  String get readyToLearn {
    return Intl.message(
      'Ready to learn something\nnew today?',
      name: 'readyToLearn',
      desc: '',
      args: [],
    );
  }

  /// `Start Learning`
  String get startLearning {
    return Intl.message(
      'Start Learning',
      name: 'startLearning',
      desc: '',
      args: [],
    );
  }

  /// `Coming\nSoon`
  String get comingSoon {
    return Intl.message('Coming\nSoon', name: 'comingSoon', desc: '', args: []);
  }

  /// `My Rank`
  String get myRank {
    return Intl.message('My Rank', name: 'myRank', desc: '', args: []);
  }

  /// `Keep pushing forward! Every challenge brings you closer to the top`
  String get challengesMessage {
    return Intl.message(
      'Keep pushing forward! Every challenge brings you closer to the top',
      name: 'challengesMessage',
      desc: '',
      args: [],
    );
  }

  /// `My Stats`
  String get myStats {
    return Intl.message('My Stats', name: 'myStats', desc: '', args: []);
  }

  /// `Ranked`
  String get ranked {
    return Intl.message('Ranked', name: 'ranked', desc: '', args: []);
  }

  /// `Unranked`
  String get unranked {
    return Intl.message('Unranked', name: 'unranked', desc: '', args: []);
  }

  /// `READY!`
  String get ready {
    return Intl.message('READY!', name: 'ready', desc: '', args: []);
  }

  /// `Use your points to unlock cool rewards and power-ups.`
  String get shopMessage {
    return Intl.message(
      'Use your points to unlock cool rewards and power-ups.',
      name: 'shopMessage',
      desc: '',
      args: [],
    );
  }

  /// `Your Balance`
  String get yourBalance {
    return Intl.message(
      'Your Balance',
      name: 'yourBalance',
      desc: '',
      args: [],
    );
  }

  /// `coins`
  String get coins {
    return Intl.message('coins', name: 'coins', desc: '', args: []);
  }

  /// `Epic`
  String get epic {
    return Intl.message('Epic', name: 'epic', desc: '', args: []);
  }

  /// `Common`
  String get common {
    return Intl.message('Common', name: 'common', desc: '', args: []);
  }

  /// `Mostawak hero avatar`
  String get mostawakHeroAvatar {
    return Intl.message(
      'Mostawak hero avatar',
      name: 'mostawakHeroAvatar',
      desc: '',
      args: [],
    );
  }

  /// `A heroic style — sharp, \ndetermined, and full of energy`
  String get aHeroicStyle {
    return Intl.message(
      'A heroic style — sharp, \ndetermined, and full of energy',
      name: 'aHeroicStyle',
      desc: '',
      args: [],
    );
  }

  /// `Black and white theme`
  String get blackAndWhiteTheme {
    return Intl.message(
      'Black and white theme',
      name: 'blackAndWhiteTheme',
      desc: '',
      args: [],
    );
  }

  /// `A clean black-and-white theme — minimal, \nelegant, and timeless.`
  String get aCleanBlackAndWhiteTheme {
    return Intl.message(
      'A clean black-and-white theme — minimal, \nelegant, and timeless.',
      name: 'aCleanBlackAndWhiteTheme',
      desc: '',
      args: [],
    );
  }

  /// `Double XP Weekend`
  String get doubleXP {
    return Intl.message(
      'Double XP Weekend',
      name: 'doubleXP',
      desc: '',
      args: [],
    );
  }

  /// `Get 2x points for completing levels\nfor the next 7 days`
  String get doubleXPMessage {
    return Intl.message(
      'Get 2x points for completing levels\nfor the next 7 days',
      name: 'doubleXPMessage',
      desc: '',
      args: [],
    );
  }

  /// `3x XP Weekend`
  String get tripleXP {
    return Intl.message('3x XP Weekend', name: 'tripleXP', desc: '', args: []);
  }

  /// `Get 3x points for completing levels \nfor the next 7 days`
  String get tripleXPMessage {
    return Intl.message(
      'Get 3x points for completing levels \nfor the next 7 days',
      name: 'tripleXPMessage',
      desc: '',
      args: [],
    );
  }

  /// `Unlock`
  String get unlock {
    return Intl.message('Unlock', name: 'unlock', desc: '', args: []);
  }

  /// `Apply Now`
  String get applyNow {
    return Intl.message('Apply Now', name: 'applyNow', desc: '', args: []);
  }

  /// `Achievements`
  String get achievements {
    return Intl.message(
      'Achievements',
      name: 'achievements',
      desc: '',
      args: [],
    );
  }

  /// `Rank`
  String get rank {
    return Intl.message('Rank', name: 'rank', desc: '', args: []);
  }

  /// `Progress`
  String get progress {
    return Intl.message('Progress', name: 'progress', desc: '', args: []);
  }

  /// `Progress Overview`
  String get progressOverview {
    return Intl.message(
      'Progress Overview',
      name: 'progressOverview',
      desc: '',
      args: [],
    );
  }

  /// `Lecture`
  String get lecture {
    return Intl.message('Lecture', name: 'lecture', desc: '', args: []);
  }

  /// `Completed`
  String get completed {
    return Intl.message('Completed', name: 'completed', desc: '', args: []);
  }

  /// `Coins Gained`
  String get coinsGained {
    return Intl.message(
      'Coins Gained',
      name: 'coinsGained',
      desc: '',
      args: [],
    );
  }

  /// `Completed Tests`
  String get completedTests {
    return Intl.message(
      'Completed Tests',
      name: 'completedTests',
      desc: '',
      args: [],
    );
  }

  /// `Success Rate`
  String get successRate {
    return Intl.message(
      'Success Rate',
      name: 'successRate',
      desc: '',
      args: [],
    );
  }

  /// `Daily Streak`
  String get dailyStreak {
    return Intl.message(
      'Daily Streak',
      name: 'dailyStreak',
      desc: '',
      args: [],
    );
  }

  /// `Completed Lessons`
  String get completedLessons {
    return Intl.message(
      'Completed Lessons',
      name: 'completedLessons',
      desc: '',
      args: [],
    );
  }

  /// `Completed Courses`
  String get completedCourses {
    return Intl.message(
      'Completed Courses',
      name: 'completedCourses',
      desc: '',
      args: [],
    );
  }

  /// `Total Time Spent`
  String get totalTimeSpent {
    return Intl.message(
      'Total Time Spent',
      name: 'totalTimeSpent',
      desc: '',
      args: [],
    );
  }

  /// `Hi!`
  String get hi {
    return Intl.message('Hi!', name: 'hi', desc: '', args: []);
  }

  /// `How can I assist you in your learning journey today?`
  String get chatGreeting {
    return Intl.message(
      'How can I assist you in your learning journey today?',
      name: 'chatGreeting',
      desc: '',
      args: [],
    );
  }

  /// `Ask Sensei`
  String get askSensei {
    return Intl.message('Ask Sensei', name: 'askSensei', desc: '', args: []);
  }

  /// `Loading...`
  String get loading {
    return Intl.message('Loading...', name: 'loading', desc: '', args: []);
  }

  /// `User`
  String get user {
    return Intl.message('User', name: 'user', desc: '', args: []);
  }

  /// `Failed to load user data.`
  String get failedToLoadUserData {
    return Intl.message(
      'Failed to load user data.',
      name: 'failedToLoadUserData',
      desc: '',
      args: [],
    );
  }

  /// `Choose Image Source`
  String get chooseImage {
    return Intl.message(
      'Choose Image Source',
      name: 'chooseImage',
      desc: '',
      args: [],
    );
  }

  /// `Failed to pick image`
  String get failedToPickImage {
    return Intl.message(
      'Failed to pick image',
      name: 'failedToPickImage',
      desc: '',
      args: [],
    );
  }

  /// `Points`
  String get points {
    return Intl.message('Points', name: 'points', desc: '', args: []);
  }

  /// `Profile Info`
  String get profileInfo {
    return Intl.message(
      'Profile Info',
      name: 'profileInfo',
      desc: '',
      args: [],
    );
  }

  /// `Logout failed`
  String get logoutFailed {
    return Intl.message(
      'Logout failed',
      name: 'logoutFailed',
      desc: '',
      args: [],
    );
  }

  /// `App Preferences`
  String get appPreferences {
    return Intl.message(
      'App Preferences',
      name: 'appPreferences',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Offline Mode`
  String get offlineMode {
    return Intl.message(
      'Offline Mode',
      name: 'offlineMode',
      desc: '',
      args: [],
    );
  }

  /// `Account Settings`
  String get accountSettings {
    return Intl.message(
      'Account Settings',
      name: 'accountSettings',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `User Details`
  String get userDetails {
    return Intl.message(
      'User Details',
      name: 'userDetails',
      desc: '',
      args: [],
    );
  }

  /// `Legal & Info`
  String get legalInfo {
    return Intl.message('Legal & Info', name: 'legalInfo', desc: '', args: []);
  }

  /// `App Info`
  String get appInfo {
    return Intl.message('App Info', name: 'appInfo', desc: '', args: []);
  }

  /// `Help & Support`
  String get helpSupport {
    return Intl.message(
      'Help & Support',
      name: 'helpSupport',
      desc: '',
      args: [],
    );
  }

  /// `CONGRATULATIONS`
  String get congratulations {
    return Intl.message(
      'CONGRATULATIONS',
      name: 'congratulations',
      desc: '',
      args: [],
    );
  }

  /// `KEEP TRYING`
  String get keepTrying {
    return Intl.message('KEEP TRYING', name: 'keepTrying', desc: '', args: []);
  }

  /// `Great Job! You did it!`
  String get greatJobMessage {
    return Intl.message(
      'Great Job! You did it!',
      name: 'greatJobMessage',
      desc: '',
      args: [],
    );
  }

  /// `Keep trying – failure is just a step toward success`
  String get keepTryingMessage {
    return Intl.message(
      'Keep trying – failure is just a step toward success',
      name: 'keepTryingMessage',
      desc: '',
      args: [],
    );
  }

  /// `Your Score`
  String get yourScore {
    return Intl.message('Your Score', name: 'yourScore', desc: '', args: []);
  }

  /// `Share`
  String get share {
    return Intl.message('Share', name: 'share', desc: '', args: []);
  }

  /// `Try Again`
  String get tryAgain {
    return Intl.message('Try Again', name: 'tryAgain', desc: '', args: []);
  }

  /// `English Challenge Room`
  String get englishChallengeRoom {
    return Intl.message(
      'English Challenge Room',
      name: 'englishChallengeRoom',
      desc: '',
      args: [],
    );
  }

  /// `Beginner`
  String get beginner {
    return Intl.message('Beginner', name: 'beginner', desc: '', args: []);
  }

  /// `Intermediate`
  String get intermediate {
    return Intl.message(
      'Intermediate',
      name: 'intermediate',
      desc: '',
      args: [],
    );
  }

  /// `Advanced`
  String get advanced {
    return Intl.message('Advanced', name: 'advanced', desc: '', args: []);
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
