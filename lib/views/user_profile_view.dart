import 'package:flutter/material.dart';
import 'package:task_l4/models/user_model.dart';
import 'package:task_l4/views/components/structured_screen.dart';

class UserProfileView extends StatelessWidget {
  final UserModel userRecord;
  const UserProfileView({super.key, required this.userRecord});

  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.sizeOf(context).width;
    double fullHeight = MediaQuery.sizeOf(context).height;

    return StructuredScreen(
      fullHeight: fullHeight,
      fullWidth: fullWidth,
      title: 'Welcome : ${userRecord.name}',
      subTitle: 'This is your profile page',
      backgroundTopHightPercent: 0.3,
      dataBoxTop: fullHeight * 0.25,
      dataBoxBottom: fullHeight * 0.18,
      dataBoxLeft: fullWidth * 0.1,
      dataBoxRight: fullWidth * 0.1,
      dataBoxDecoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Container(
          width: double.infinity,
          height: 350,
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
              userDataCard(
                  icon: const Icon(Icons.person),
                  title: 'User Name',
                  data: userRecord.name),
              userDataCard(
                  icon: const Icon(Icons.email),
                  title: 'Email',
                  data: userRecord.email),
              userDataCard(
                  icon: const Icon(Icons.phone),
                  title: 'Phone',
                  data: userRecord.phone),
              userDataCard(
                  icon: const Icon(Icons.password),
                  title: 'Password',
                  data: userRecord.password),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 50),
                child: MaterialButton(
                  color: Colors.deepPurpleAccent,                  
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('home', (route) => false);
                  },
                  child: const Text('Logout')),
              ),
            ],
          )),
    );
  }

  Widget userDataCard(
      {required String title, required String? data, required Icon icon}) {
    return Card(
      child: ListTile(
        leading: icon,
        title: Text(
          data ?? '',
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}
