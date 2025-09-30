// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
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
  String get localeName => 'ar';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "checkYourEmail": MessageLookupByLibrary.simpleMessage(
      "تحقق من بريدك الإلكتروني",
    ),
    "confirm": MessageLookupByLibrary.simpleMessage("تأكيد"),
    "emailResent": MessageLookupByLibrary.simpleMessage("تم إعادة الإرسال"),
    "gotEmail": MessageLookupByLibrary.simpleMessage("لم يصلك البريد؟"),
    "passwordReset": MessageLookupByLibrary.simpleMessage(
      "إعادة تعيين كلمة المرور",
    ),
    "passwordResetMessage": MessageLookupByLibrary.simpleMessage(
      "تم إعادة تعيين كلمة المرور بنجاح. اضغط \"تأكيد\" لإعداد كلمة مرور جديدة",
    ),
    "resendEmail": MessageLookupByLibrary.simpleMessage("إعادة الإرسال"),
    "sentMessage1": MessageLookupByLibrary.simpleMessage(
      "أرسلنا رابط إعادة تعيين إلى ",
    ),
    "sentMessage2": MessageLookupByLibrary.simpleMessage(
      "، أدخل الرمز المكون من 6 أرقام المذكور في البريد الإلكتروني",
    ),
    "verificationFailed": MessageLookupByLibrary.simpleMessage(
      "فشل التحقق. تأكد من الرمز وحاول مرة أخرى",
    ),
    "verifyCode": MessageLookupByLibrary.simpleMessage("تأكيد الرمز"),
  };
}
