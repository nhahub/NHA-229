// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mostawak/screens/forgot_pass_3.dart';

// class ForgotPassScreen21 extends StatefulWidget {
//   const ForgotPassScreen21({super.key, required this.email});

//   final String email;

//   @override
//   State<ForgotPassScreen21> createState() => _ForgotPassScreen21State();
// }

// class _ForgotPassScreen21State extends State<ForgotPassScreen21> {
//   final _controllers = List.generate(6, (_) => TextEditingController());
//   final _focusNodes = List.generate(6, (_) => FocusNode());
//   bool _validOTP = true;

//   void _verify() {
//     setState(() {
//       _validOTP =
//           _controllers.every((controller) => controller.text.isNotEmpty);
//     });
//     if (_validOTP) {
//       Navigator.push(context,
//           MaterialPageRoute(builder: (context) => const ForgotPassScreen3()));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: IconButton(
//               onPressed: () {
//                 // Navigator.pop(context);
//               },
//               icon: const Icon(
//                 Icons.arrow_back_sharp,
//                 color: Color(0xff16697b),
//               )),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 50),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       'Check Your Email',
//                       style: Theme.of(context).textTheme.displayLarge,
//                     )),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 Text.rich(
//                   TextSpan(
//                     children: [
//                       TextSpan(
//                         text: 'We sent a reset link to ',
//                         style: Theme.of(context).textTheme.bodySmall,
//                       ),
//                       TextSpan(
//                         text: widget.email,
//                         style: Theme.of(context).textTheme.bodyMedium,
//                       ),
//                       TextSpan(
//                         text: ' enter 6 digit code that mentioned in the email',
//                         style: Theme.of(context).textTheme.bodySmall,
//                       ),
//                     ],
//                     style: Theme.of(context).textTheme.bodySmall,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   textDirection: TextDirection.ltr,
//                   children: List.generate(
//                     6,
//                     (index) => SizedBox(
//                       width: 50,
//                       // height: 40,
//                       child: KeyboardListener(
//                         focusNode: FocusNode(),
//                         onKeyEvent: (event) {
//                           if (event is KeyDownEvent &&
//                               event.logicalKey ==
//                                   LogicalKeyboardKey.backspace &&
//                               index > 0 &&
//                               _controllers[index].text.isEmpty) {
//                             FocusScope.of(context)
//                                 .requestFocus(_focusNodes[index - 1]);
//                           } else if (event is KeyDownEvent &&
//                               event.logicalKey == LogicalKeyboardKey.enter) {
//                             _verify();
//                           }
//                         },
//                         child: TextFormField(
//                           controller: _controllers[index],
//                           focusNode: _focusNodes[index],
//                           maxLength: 1,
//                           // initialValue: '${index % 2 == 0 ? index : null}',
//                           keyboardType: TextInputType.number,
//                           textAlign: TextAlign.center,
//                           textAlignVertical: TextAlignVertical.center,
//                           style: const TextStyle(fontSize: 16),
//                           inputFormatters: [
//                             FilteringTextInputFormatter.digitsOnly
//                           ],
//                           onTap: () {
//                             if (_controllers[index].text.isEmpty &&
//                                 _controllers.any(
//                                     (controller) => controller.text.isEmpty)) {
//                               FocusScope.of(context).requestFocus(_focusNodes[
//                                   _controllers.indexOf(_controllers.firstWhere(
//                                       (value) => value.text.isEmpty))]);
//                             }
//                           },
//                           onChanged: (value) {
//                             if (value.isNotEmpty && index < 5) {
//                               FocusScope.of(context)
//                                   .requestFocus(_focusNodes[index + 1]);
//                             }
//                           },
//                           decoration: InputDecoration(
//                             counterText: '',
//                             errorText: null,
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   color: _validOTP
//                                       ? const Color(0xff16697B)
//                                       : const Color(0xffF44336),
//                                   width: 1),
//                               borderRadius:
//                                   const BorderRadius.all(Radius.circular(12)),
//                             ),
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   color: _validOTP
//                                       ? const Color(0xff9e9e9e)
//                                       : const Color(0xffF44336),
//                                   width: 1),
//                               borderRadius:
//                                   const BorderRadius.all(Radius.circular(12)),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: !_validOTP ? 13 : 9,
//                 ),
//                 if (!_validOTP)
//                   Text(
//                     'Verification failed. Check the code and try again',
//                     style: GoogleFonts.poppins(
//                         fontSize: 12, color: const Color(0xffF44336)),
//                   ),
//                 const SizedBox(
//                   height: 17,
//                 ),
//                 ElevatedButton(
//                   onPressed: _verify,
//                   child: Text(
//                     'VERIFY CODE',
//                     style: Theme.of(context).textTheme.displayLarge?.copyWith(
//                           fontSize: 23,
//                           color: Theme.of(context)
//                               .elevatedButtonTheme
//                               .style
//                               ?.foregroundColor
//                               ?.resolve({}),
//                         ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 12,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "haven't got the email yet?",
//                       style: Theme.of(context)
//                           .textTheme
//                           .bodySmall
//                           ?.copyWith(fontSize: 12),
//                     ),
//                     TextButton(
//                         onPressed: () {
//                           ScaffoldMessenger.of(context)
//                               .showSnackBar(const SnackBar(
//                             content: Text('Email Resent'),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(12))),
//                           ));
//                         },
//                         child: Text(
//                           'Resend email',
//                           style: Theme.of(context)
//                               .textButtonTheme
//                               .style
//                               ?.textStyle
//                               ?.resolve({}),
//                         ))
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     for (var controller in _controllers) {
//       controller.dispose();
//     }

//     for (var focusNode in _focusNodes) {
//       focusNode.dispose();
//     }

//     super.dispose();
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
// import 'package:smart_auth/smart_auth.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text('Pinput Example'),
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(30, 60, 87, 1),
          ),
        ),
        body: const FractionallySizedBox(
          widthFactor: 1,
          // You can also checkout the [PinputBuilderExample]
          child: PinputExample(),
        ),
      ),
    ),
  );
}

/// This is the basic usage of Pinput
/// For more examples check out the demo directory
class PinputExample extends StatefulWidget {
  const PinputExample({super.key});

  @override
  State<PinputExample> createState() => _PinputExampleState();
}

class _PinputExampleState extends State<PinputExample> {
  // late final SmsRetriever smsRetriever;
  late final TextEditingController pinController;
  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    // On web, disable the browser's context menu since this example uses a custom
    // Flutter-rendered context menu.
    if (kIsWeb) {
      BrowserContextMenu.disableContextMenu();
    }
    formKey = GlobalKey<FormState>();
    pinController = TextEditingController();
    focusNode = FocusNode();

    /// In case you need an SMS autofill feature
    // smsRetriever = SmsRetrieverImpl(SmartAuth());
  }

  @override
  void dispose() {
    if (kIsWeb) {
      BrowserContextMenu.enableContextMenu();
    }
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    /// Optionally you can use form to validate the Pinput
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            // Specify direction if desired
            textDirection: TextDirection.ltr,
            child: Pinput(
              // You can pass your own SmsRetriever implementation based on any package
              // in this example we are using the SmartAuth
              enableInteractiveSelection: true,
              // smsRetriever: smsRetriever,
              controller: pinController,
              focusNode: focusNode,
              defaultPinTheme: defaultPinTheme,
              separatorBuilder: (index) => const SizedBox(width: 8),
              validator: (value) {
                return (value != null && value.isEmpty) ? null : 'Pin is incorrect';
              },
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) {
                debugPrint('onCompleted: $pin');
              },
              onChanged: (value) {
                debugPrint('onChanged: $value');
              },
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 22,
                    height: 1,
                    color: focusedBorderColor,
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: fillColor,
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.redAccent),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              focusNode.unfocus();
              formKey.currentState!.validate();
            },
            child: const Text('Validate'),
          ),
        ],
      ),
    );
  }
}

/// You, as a developer should implement this interface.
/// You can use any package to retrieve the SMS code. in this example we are using SmartAuth
// class SmsRetrieverImpl implements SmsRetriever {
//   const SmsRetrieverImpl(this.smartAuth);

//   final SmartAuth smartAuth;

//   @override
//   Future<void> dispose() {
//     return smartAuth.removeSmsListener();
//   }

//   @override
//   Future<String?> getSmsCode() async {
//     final signature = await smartAuth.getAppSignature();
//     debugPrint('App Signature: $signature');
//     final res = await smartAuth.getSmsCode(useUserConsentApi: true);
//     if (res.succeed && res.codeFound) {
//       return res.code!;
//     }
//     return null;
//   }

//   @override
//   bool get listenForMultipleSms => false;
// }
