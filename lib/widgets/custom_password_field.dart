import 'package:flutter/material.dart';

//import '../viewmodels/sign_up_viewmodel.dart';

class CustomPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  CustomPasswordField({
    required this.controller,
    required this.labelText,
    required this.validator,
    required this.onChanged
  });

  @override
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: widget.labelText,
        filled: true,
        fillColor: Color(0xfff8f8f8), // Background color
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), // Border radius
          borderSide: BorderSide.none, // No border
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), // Border radius
          borderSide: BorderSide.none, // No border
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), // Border radius
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor, // Border color when focused
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), // Border radius
          borderSide: BorderSide(
            color:
                Colors.red, // Border color when error occurs
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), // Border radius
          borderSide: BorderSide(
            color: Colors.red
            , // Border color when focused and error occurs
          ),
        ),

        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: _togglePasswordVisibility,
        ),
      ),
      validator: widget.validator,
    );
  }
}
