import 'package:flutter/material.dart';

class RowStatements extends StatefulWidget {
  final bool showCheckbox;
  final String normalText;
  final TextStyle? normalTextStyle;
  final String linkText;
  final TextStyle? linkTextStyle;
  final VoidCallback onLinkTap;

  const RowStatements({
    super.key,
    this.showCheckbox = true,
    required this.normalText,
    this.normalTextStyle,
    required this.linkText,
    this.linkTextStyle,
    required this.onLinkTap,
  });

  @override
  State<RowStatements> createState() => _RowStatementsState();
}

class _RowStatementsState extends State<RowStatements> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.showCheckbox)
          SizedBox(
            width: 18,
            height: 18,
            child: Checkbox(
              value: isChecked,
              activeColor: const Color(0xff16697B),
              checkColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  isChecked = value ?? false;
                });
              },
            ),
          ),
        if (widget.showCheckbox) const SizedBox(width: 8),
        Text(
          widget.normalText,
          style: widget.normalTextStyle ??
              const TextStyle(
                color: Color(0xff82C0CB),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
        ),
        GestureDetector(
          onTap: widget.onLinkTap,
          child: Text(
            widget.linkText,
            style: widget.linkTextStyle ??
                const TextStyle(
                  color: Color(0xffFFA62B),
                  fontSize: 16,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
      ],
    );
  }
}
