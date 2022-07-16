import 'package:flutter/material.dart';
import 'package:game/support/colors.dart';


class CustomizeTextFormField extends StatefulWidget {
  CustomizeTextFormField(
      {
      required this.labelText,
      this.isPwdType = false,
      required this.controller,
        this.maxLines = 1,
      this.minLines = 1,
        this.isEnabled = true,
        this.isReadonly = false,
      this.textCapitalization = TextCapitalization.sentences,
      this.keyboardType = TextInputType.text,
      this.inputFormatter,
      this.showSufix=false,
      this.inputAction = TextInputAction.next,
      required this.onChange,
      required this.helperText,
        // required this.validator,
      required this.onSave,
      required this.onClick,});

  final String labelText;
  final bool isPwdType;
  final bool isEnabled;
  final bool isReadonly;
  final String helperText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final int maxLines;
  final int minLines;
  final bool showSufix;
  final inputFormatter;
  final textCapitalization;
  final TextInputAction inputAction;
  final void Function(String) onChange;
  // final String? Function(String?) validator;
  final void Function(String?) onSave;


  final VoidCallback onClick;
  @override
  _CustomizeTextFormFieldState createState() => _CustomizeTextFormFieldState();
}

class _CustomizeTextFormFieldState extends State<CustomizeTextFormField> {
  FocusNode myFocusNode = FocusNode();


  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        widget.showSufix?
         const Positioned(
          bottom: 13,
          right: 12,
          child: SizedBox(
            width: 24,
            height: 24,
            child:Icon(Icons.search,color: MyColors.gray,),
          ),
        ):Container(),

        TextFormField(

            style: const TextStyle(color: MyColors.black),
            inputFormatters: widget.inputFormatter,
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: widget.isPwdType,
            enabled: widget.isEnabled,
            readOnly: widget.isReadonly,
            textCapitalization: widget.textCapitalization,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            textInputAction: widget.inputAction ,
            focusNode: myFocusNode,
            onChanged: widget.onChange,
            // validator: widget.validator,
            onSaved: widget.onSave,
            onTap: widget.onClick,
            //onEditingComplete:  () => FocusScope.of(context).nextFocus(),
            onEditingComplete: () => context.nextEditableTextFocus(),
            //onFieldSubmitted: (_) => context.nextEditableTextFocus(),
            decoration:  InputDecoration(

              helperStyle: const TextStyle(
                  color: MyColors.black),
              contentPadding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              hintText: widget.helperText,
              labelText: widget.labelText,
              fillColor: MyColors.white,
              hintStyle: const TextStyle(color: MyColors.gray),
              border:  const OutlineInputBorder(
                borderSide: BorderSide(color:MyColors.borderColor),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              focusColor: MyColors.red,
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(color: MyColors.kPrimaryColor,width: 2),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(color: MyColors.borderColor),
              ),
              // alignLabelWithHint: true,
              labelStyle: const TextStyle(
                height: 0.9,
                color:  MyColors.gray
                ,
              ),
            ),
        ),
      ],
    );
  }
}
class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

extension Utility on BuildContext {
  void nextEditableTextFocus() {
    do {
      FocusScope.of(this).nextFocus();
    } while (FocusScope.of(this).focusedChild?.context?.widget is! EditableText);
  }
}