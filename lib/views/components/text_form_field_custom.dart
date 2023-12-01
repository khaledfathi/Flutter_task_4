import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatelessWidget {
  final Icon? prefixIcon ; 
  final String? hintText ; 
  final TextEditingController? controller; 
  final TextInputType? keyboardType;
  final bool? obscureText ; 
  const TextFormFieldCustom({super.key,
    this.prefixIcon,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 7),
      height: 43,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 216, 216, 216),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType ,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          prefixIcon: prefixIcon, 
          hintText: hintText,
          border: InputBorder.none,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurpleAccent)),
        ),
      ),
    );
  }
}
