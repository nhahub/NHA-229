import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostawak/generated/l10n.dart';

import '../../controllers/timer_bloc.dart';

class TimerButton extends StatelessWidget {
  const TimerButton({super.key, required this.onPressed});

  final Function() onPressed;

  void startTimer(BuildContext context) async {
    context.read<TimerBloc>().add(StartTimer(const Duration(minutes: 1)));
    for (int i = 0; i < 60; i++) {
      await Future.delayed(const Duration(seconds: 1), () {
        if (context.mounted) {
          context.read<TimerBloc>().add(DecreaseTimer());
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TimerBloc(const Duration(minutes: 0)),
      child: BlocBuilder<TimerBloc, Duration>(
        builder: (context, durationState) {
          return durationState.inSeconds > 0
              ? Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '${S.of(context).resendEmail} ',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(fontSize: 12),
                    ),
                    TextSpan(
                      text:
                          '${(durationState.inSeconds ~/ 60).toString().padLeft(2, '0')}:${(durationState.inSeconds % 60).toString().padLeft(2, '0')}',
                      style: Theme.of(
                        context,
                      ).textButtonTheme.style?.textStyle?.resolve({}),
                    ),
                  ],
                ),
              )
              : TextButton(
                onPressed: () {
                  startTimer(context);
                  onPressed();
                },
                child: Text(
                  S.of(context).resendEmail,
                  style: Theme.of(
                    context,
                  ).textButtonTheme.style?.textStyle?.resolve({}),
                ),
              );
        },
      ),
    );
  }
}
