import 'package:flutter/material.dart';

// Still Under Development

class CustomPopScope extends StatefulWidget {
  const CustomPopScope({super.key, required this.child});

  final Widget child;

  @override
  State<CustomPopScope> createState() => _CustomPopScopeState();
}

class _CustomPopScopeState extends State<CustomPopScope> {
  DateTime? _lastBackPress;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        final now = DateTime.now();
        final pressedTwice = _lastBackPress != null &&
            now.difference(_lastBackPress!) < const Duration(seconds: 2);

        if (pressedTwice) {
          Navigator.of(context).pop(result);
        } else {
          _lastBackPress = now;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Press back again to exit"),
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
      child: widget.child,
    );
  }
}
