import 'package:flutter/material.dart';
import 'package:task_l4/controllers/auth_controller.dart';
import 'package:task_l4/views/components/structured_screen.dart';
import 'package:task_l4/views/components/text_form_field_custom.dart';

class NewPasswordView extends StatefulWidget {
  final int recordId;
  const NewPasswordView({super.key, required this.recordId});

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  //filed controllers
  TextEditingController passwordCtl = TextEditingController();
  TextEditingController confirmPasswordCtl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.sizeOf(context).width;
    double fullHeight = MediaQuery.sizeOf(context).height;
    return StructuredScreen(
      title: 'Create New Password',
      subTitle:
          'Create new password and please never share it with anyone for safe use',
      fullHeight: fullHeight,
      fullWidth: fullWidth,
      dataBoxTop: fullHeight * 0.3,
      dataBoxBottom: fullHeight * 0.4,
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
            TextFormFieldCustom(
              prefixIcon: const Icon(Icons.password),
              hintText: 'New Password',
              keyboardType: TextInputType.number,
              obscureText: true,
              controller: passwordCtl,
            ),
            TextFormFieldCustom(
              prefixIcon: const Icon(Icons.password),
              hintText: 'Confirm New Password',
              keyboardType: TextInputType.number,
              obscureText: true,
              controller: confirmPasswordCtl,
            ),
            MaterialButton(
              color: Colors.deepPurpleAccent,
              minWidth: double.infinity,
              onPressed: () {
                AuthController().updatePassword(
                    recordId: widget.recordId,
                    password: passwordCtl.text,
                    confirmPassword: confirmPasswordCtl.text,
                    context: context);
              },
              child: const Text(
                'Updata Password',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
