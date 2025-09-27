import 'package:flutter/material.dart';
import 'package:mostawak/generated/l10n.dart';

class ConfirmResetScreen extends StatelessWidget {
  const ConfirmResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: Color(0xff16697b),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 28),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 50),
          child: Column(
            children: <Widget>[
              Align(
                  // alignment: Alignment.centerLeft,
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    S.of(context).passwordReset,
                    style: Theme.of(context).textTheme.displayLarge,
                  )),
              const SizedBox(
                height: 10,
              ),
              Text(
                S.of(context).passwordResetMessage,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const SetPasswordScreen()));
                  },
                  child: Text(
                    S.of(context).confirm,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context)
                            .elevatedButtonTheme
                            .style
                            ?.foregroundColor
                            ?.resolve({})),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
