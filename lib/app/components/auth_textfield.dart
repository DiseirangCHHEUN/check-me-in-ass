import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required Function(String?) onSaved,
    bool obscuretext = false,
    required TextEditingController controller,
    required String label,
    required TextInputType keyboardType,
    required String? Function(String?)? validator,
    IconData? icon,
  })  : _controller = controller,
        _label = label,
        _onSaved = onSaved,
        _keyboardType = keyboardType,
        _obscureText = obscuretext,
        _validator = validator,
        _icon = icon;

  final Function(String?) _onSaved;
  final bool _obscureText;
  final TextEditingController _controller;
  final TextInputType _keyboardType;
  final String _label;
  final String? Function(String?)? _validator;
  final IconData? _icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: _onSaved,
      obscureText: _obscureText,
      controller: _controller,
      keyboardType: _keyboardType,
      validator: _validator,
      decoration: InputDecoration(
        labelText: _label,
        prefixIcon: Icon(_icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}

class CreateAccountTextField extends AuthTextField {
  const CreateAccountTextField(
      {super.key,
      required super.onSaved,
      required super.controller,
      required super.label,
      required super.keyboardType,
      required super.validator,
      super.icon = Icons.abc,
      super.obscuretext});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: _onSaved,
      obscureText: _obscureText,
      controller: _controller,
      keyboardType: _keyboardType,
      validator: _validator,
      decoration: InputDecoration(
        labelText: _label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
