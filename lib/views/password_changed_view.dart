import 'package:flutter/material.dart';
import 'package:task_l4/views/components/structured_screen.dart';

class PasswordChangedView extends StatelessWidget {
  const PasswordChangedView({super.key});
  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.sizeOf(context).width;
    double fullHeight = MediaQuery.sizeOf(context).height;
    return StructuredScreen(
      fullHeight: fullHeight,
      fullWidth: fullWidth,
      backgroundTopHightPercent: 0.3,
      dataBoxTop: fullHeight * 0.2,
      dataBoxBottom: fullHeight * 0.25,
      dataBoxLeft: fullWidth * 0.1,
      dataBoxRight: fullWidth * 0.1,
      dataBoxDecoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey, offset: Offset(0, 2), blurRadius: 5),
              BoxShadow(
                  color: Colors.grey, offset: Offset(0, -2), blurRadius: 5),
            ]),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: const Text(
                'Password Changed ',
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Text(            
              'Congratulations!! You\'r successfully changed your Password',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.deepPurpleAccent,
              ),
            ),
            Expanded(
              child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 50),
                  child: Image.asset('assets/images/ok_image.png')),
            ),
            MaterialButton(
              color: Colors.deepPurpleAccent,
              minWidth: double.infinity,
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil('home', (route) => false);
              },
              child: const Text(
                'Back to Home',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
