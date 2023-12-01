import 'package:flutter/material.dart';

class SocialMediaRow extends StatelessWidget {
  final void Function()? onTapPhone; 
  final double? width; 
  const SocialMediaRow({super.key , this.onTapPhone , this.width=double.infinity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            child: Image.asset(
              'assets/icons/social_media/facebook.png',
              width: 35,
            ),
          ),
          InkWell(
              child: Image.asset(
            'assets/icons/social_media/google.png',
            width: 40,
          )),
          InkWell(
              child: Image.asset(
            'assets/icons/social_media/twitter.png',
            width: 35,
          )),
          InkWell(
            onTap: onTapPhone,
            child: Image.asset(
              'assets/icons/social_media/phone.png',
              width: 25,
            ),
          ),
        ],
      ),
    );
  }
}
