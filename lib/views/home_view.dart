import 'package:flutter/material.dart';
import 'package:task_l4/controllers/home_controller.dart';
import 'package:task_l4/views/components/divider_with%20label.dart';
import 'package:task_l4/views/components/social_media_row.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.sizeOf(context).width;
    double fullHeight = MediaQuery.sizeOf(context).height;

    return OrientationBuilder(builder: (context, orientation) {
      return SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              HomeController().databaseView(context: context); 
            },
            backgroundColor: Colors.blue,
            child: const Icon(Icons.storage_rounded),
          ),
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color.fromARGB(255, 218, 218, 218),
          body: SizedBox(
            width: fullWidth,
            height: fullHeight,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: fullHeight * 0.5,
                    decoration: const BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/icons/app_icon.png',
                        width: 100,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: fullWidth * 0.1,
                  right: fullWidth * 0.1,
                  top: fullHeight * 0.32,
                  bottom: fullHeight * 0.12,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 2),
                            blurRadius: 5),
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, -2),
                            blurRadius: 5),
                      ],
                    ),
                    child: ListView(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 20),
                          child: const Text(
                            'Welcome to App Name',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(
                              top: 20, left: 20, right: 20),
                          child: const Text(
                            'Discover amazing thing near around you',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 20, left: 20, right: 20, bottom: 10),
                          width: double.infinity,
                          child: MaterialButton(
                            color: Colors.deepPurpleAccent,
                            onPressed: () {
                              Navigator.of(context).pushNamed('auth.login');
                            },
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.deepPurpleAccent)),
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('auth.signup');
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Colors.deepPurpleAccent,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                        const DividerWithLabel(
                          text: 'Or connect using',
                          margin: EdgeInsets.symmetric(
                              vertical: 25, horizontal: 20),
                          width: double.infinity,
                          height: 40,
                          textFlex: 6,
                          leftFlex: 2,
                          rightFlex: 2,
                        ),
                        SocialMediaRow(
                          onTapPhone: () => Navigator.of(context)
                              .pushNamed('auth.loginWithNumber'),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: fullHeight * 0.04,
                  child: Container(
                    alignment: Alignment.center,
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Skip',
                          style: TextStyle(fontSize: 18),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
