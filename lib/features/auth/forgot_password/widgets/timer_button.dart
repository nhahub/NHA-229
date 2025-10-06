import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostawak/features/auth/controllers/timer_bloc.dart';

class TimerButton extends StatelessWidget {
  const TimerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TimerBloc(),
      child: BlocBuilder<TimerBloc, Duration>(
        builder: (context, durationState) {
          return Row(
            children: <Widget>[
              TextButton(
                onPressed:
                    durationState.inSeconds > 0
                        ? null
                        : () {
                          context.read<TimerBloc>().add(
                            StartTimer(const Duration(minutes: 1)),
                          );
                          for (int i = 0; i < 60; i++) {
                            Future.delayed(const Duration(seconds: 1), () {
                              context.read<TimerBloc>().add(DecreaseTimer());
                            });
                          }
                        },
                child: Text(
                  'Resend code in ',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              Text(
                '${(durationState.inSeconds ~/ 60).toString().padLeft(2, '0')}:${(durationState.inSeconds % 60).toString().padLeft(2, '0')}',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: const Color(0xff16697B)),
              ),
            ],
          );
        },
      ),
    );
  }
}
