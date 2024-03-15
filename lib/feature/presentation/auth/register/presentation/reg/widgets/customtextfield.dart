import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zahra/core/ulits/const.dart';

// ignore: must_be_immutable
class CustomTextfield extends StatelessWidget {
  CustomTextfield({
    super.key,
    this.hintTex,
    this.suficon,
    this.preicon,
    this.controller,
    this.type,
    this.onChanged,
    this.valid,
    this.labelTex,
    this.inputformatter,
    this.obs,
  });

  String? hintTex;
  String? labelTex;
  IconButton? suficon;
  Icon? preicon;
  TextEditingController? controller;
  TextInputType? type;
  List<TextInputFormatter>? inputformatter;
  bool? obs;
  Function(String)? onChanged;
  String? Function(String?)? valid;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 80),
        child: TextFormField(
          enableSuggestions: true,
          inputFormatters: inputformatter,
          onChanged: onChanged,
          validator: valid,
          controller: controller,
          keyboardType: type,
          obscureText: obs!,
          decoration: InputDecoration(
            filled: true,
            fillColor: textbutton,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: textcontent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: textcontent),
            ),
            prefixIcon: preicon,
            suffixIcon: suficon,
            hintText: hintTex,
            labelText: labelTex,
            labelStyle: const TextStyle(color: titlecolor),
            focusColor: kprimarycolor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}
