import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;
  final bool showVisibilityButton;
  final bool hPadding;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.validator,
    this.hintText = '',
    this.showVisibilityButton = false,
    this.hPadding = true,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.hPadding ? 30 : 0),
      child: TextFormField(
        controller: widget.controller,
        textDirection: TextDirection.ltr,
        obscureText: widget.showVisibilityButton ? _obscureText : false,
        validator: widget.validator ??
            (value) {
              if (value == null || value.trim().isEmpty) {
                return 'This field cannot be empty';
              }
              return null;
            },
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Color(0xff9E9E9E)),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 14,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.black, width: 1.2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.black, width: 1.2),
          ),
          suffixIcon: widget.showVisibilityButton
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: () => setState(() => _obscureText = !_obscureText),
                )
              : null,
        ),
      ),
    );
  }
}
