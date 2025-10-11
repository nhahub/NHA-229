// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "checkYourEmail": MessageLookupByLibrary.simpleMessage("Check Your Email"),
    "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
    "cont": MessageLookupByLibrary.simpleMessage("Continue"),
    "emailResent": MessageLookupByLibrary.simpleMessage("Email Resent"),
    "gotEmail": MessageLookupByLibrary.simpleMessage(
      "haven\'t got the email yet?",
    ),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "passwordReset": MessageLookupByLibrary.simpleMessage("Password Reset"),
    "passwordResetMessage": MessageLookupByLibrary.simpleMessage(
      "your password has been successfully reset. Click confirm to set a new password",
    ),
    "resendEmail": MessageLookupByLibrary.simpleMessage("Resend email"),
    "resetSuccess": MessageLookupByLibrary.simpleMessage("Successful"),
    "resetSuccessMessage": MessageLookupByLibrary.simpleMessage(
      "Congratulations! Your password has been changed. Click continue to login",
    ),
    "sentMessage1": MessageLookupByLibrary.simpleMessage(
      "We sent a reset link to ",
    ),
    "sentMessage2": MessageLookupByLibrary.simpleMessage(
      " enter 6 digit code that mentioned in the email",
    ),
    "setNewPassword": MessageLookupByLibrary.simpleMessage(
      "Set a new password",
    ),
    "setPasswordMessage": MessageLookupByLibrary.simpleMessage(
      "Create a new password. Ensure it differs form the previous ones for security",
    ),
    "updatePassword": MessageLookupByLibrary.simpleMessage("Update Password"),
    "verificationFailed": MessageLookupByLibrary.simpleMessage(
      "Verification failed. Check the code and try again",
    ),
    "verifyCode": MessageLookupByLibrary.simpleMessage("Verify Code"),
  };
}
