import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../generated/l10n.dart';
import 'confirm_reset_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.email});

  final String email;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _controllers = List.generate(6, (_) => TextEditingController());
  final _focusNodes = List.generate(6, (_) => FocusNode());
  bool _validOTP = true;

  void _verify() {
    setState(() {
      _validOTP =
          _controllers.every((controller) => controller.text.isNotEmpty);
    });
    if (_validOTP) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ConfirmResetScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: Color(0xff16697b),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 28),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 50),
            child: Column(
              children: <Widget>[
                Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      S.of(context).checkYourEmail,
                      style: Theme.of(context).textTheme.displayLarge,
                    )),
                const SizedBox(
                  height: 8,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: S.of(context).sentMessage1,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      TextSpan(
                        text: widget.email,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: S.of(context).sentMessage2,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  textDirection: TextDirection.ltr,
                  children: List.generate(
                    6,
                    (index) => SizedBox(
                      width: 50,
                      // height: 40,
                      child: KeyboardListener(
                        focusNode: FocusNode(),
                        onKeyEvent: (event) {
                          if (event is KeyDownEvent &&
                              event.logicalKey ==
                                  LogicalKeyboardKey.backspace &&
                              index > 0 &&
                              _controllers[index].text.isEmpty) {
                            FocusScope.of(context)
                                .requestFocus(_focusNodes[index - 1]);
                          } else if (event is KeyDownEvent &&
                              event.logicalKey == LogicalKeyboardKey.enter) {
                            _verify();
                          }
                        },
                        child: TextFormField(
                          controller: _controllers[index],
                          focusNode: _focusNodes[index],
                          maxLength: 1,
                          // initialValue: '${index % 2 == 0 ? index : null}',
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          style: const TextStyle(fontSize: 16),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          onTap: () {
                            if (_controllers[index].text.isEmpty &&
                                _controllers.any(
                                    (controller) => controller.text.isEmpty)) {
                              FocusScope.of(context).requestFocus(_focusNodes[
                                  _controllers.indexOf(_controllers.firstWhere(
                                      (value) => value.text.isEmpty))]);
                            }
                          },
                          onChanged: (value) {
                            if (value.isNotEmpty && index < 5) {
                              FocusScope.of(context)
                                  .requestFocus(_focusNodes[index + 1]);
                            }
                          },
                          decoration: InputDecoration(
                            counterText: '',
                            errorText: null,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: _validOTP
                                      ? const Color(0xff16697B)
                                      : const Color(0xffF44336),
                                  width: 1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: _validOTP
                                      ? const Color(0xff9e9e9e)
                                      : const Color(0xffF44336),
                                  width: 1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: !_validOTP ? 13 : 9,
                ),
                if (!_validOTP)
                  Text(
                    S.of(context).verificationFailed,
                    style: GoogleFonts.poppins(
                        fontSize: 12, color: const Color(0xffF44336)),
                  ),
                const SizedBox(
                  height: 17,
                ),
                ElevatedButton(
                  onPressed: _verify,
                  child: Text(
                    S.of(context).verifyCode,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
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
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.of(context).gotEmail,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: 12),
                    ),
                    TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(S.of(context).emailResent),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                          ));
                        },
                        child: Text(
                          S.of(context).resendEmail,
                          style: Theme.of(context)
                              .textButtonTheme
                              .style
                              ?.textStyle
                              ?.resolve({}),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }

    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }

    super.dispose();
  }
}
