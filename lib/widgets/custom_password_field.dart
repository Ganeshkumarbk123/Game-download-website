import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game/support/colors.dart';

class CustomPasswordTextField extends StatefulWidget {
  CustomPasswordTextField({
    required this.labelText,
    this.isPwdType = false,
    required this.controller,
    this.maxLines = 1,
    this.minLines = 1,
    this.isEnabled = true,
    this.textCapitalization = TextCapitalization.sentences,
    this.keyboardType = TextInputType.text,
    this.inputFormatter,
    this.inputAction = TextInputAction.next,
    required this.onChange,
    required this.helperText,
    required this.onSave,
    // required this.validator
  });

  final String labelText;
  final bool isPwdType;
  final bool isEnabled;
  final String helperText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final int maxLines;
  final int minLines;
  final inputFormatter;
  final textCapitalization;
  final TextInputAction inputAction;
  final void Function(String) onChange;
  // final String? Function(String?) validator;
  final void Function(String?) onSave;

  @override
  _CustomPasswordTextFieldState createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool _passwordVisible = false;
  FocusNode myFocusNode = new FocusNode();

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: const TextStyle(color: MyColors.black),
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        enabled: widget.isEnabled,
        obscureText: !_passwordVisible,
        textCapitalization: widget.textCapitalization,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        textInputAction: widget.inputAction,
        focusNode: myFocusNode,
        onChanged: widget.onChange,
        // validator: widget.validator,
        onSaved: widget.onSave,
        onEditingComplete: () => context.nextEditableTextFocus(),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          hintText: widget.helperText,
          helperStyle: const TextStyle(color: MyColors.black),
          labelText: widget.labelText,
          fillColor: MyColors.white,
          hintStyle: const TextStyle(color: MyColors.gray),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: MyColors.borderColor),
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            borderSide: BorderSide(color: MyColors.kPrimaryColor, width: 2),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: MyColors.borderColor),
          ),
          labelStyle: const TextStyle(height: 0.9, color: MyColors.gray),
          suffixIcon: IconButton(
            splashRadius: 0.5,
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: MyColors.gray,
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
        ));
  }
}

extension Utility on BuildContext {
  void nextEditableTextFocus() {
    do {
      FocusScope.of(this).nextFocus();
    } while (
        FocusScope.of(this).focusedChild?.context?.widget is! EditableText);
  }
}
