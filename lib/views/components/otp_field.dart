import 'package:flutter/material.dart';

class OTPField extends StatelessWidget {
  const OTPField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: OTPBlock(),),
          Expanded(child: OTPBlock(),),
          Expanded(child: OTPBlock(),),
          Expanded(child: OTPBlock(),),
          Expanded(child: OTPBlock(),),
          Expanded(child: OTPBlock(),),
        ],
      ),
    );
  }

  Widget OTPBlock() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 216, 216, 216),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const TextField(        
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: InputDecoration(
          border: InputBorder.none,
          counterText: '',
        ),
      ),
    );
  }
}
