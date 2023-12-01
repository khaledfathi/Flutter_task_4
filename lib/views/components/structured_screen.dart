import 'package:flutter/material.dart';

class StructuredScreen extends StatelessWidget {
  final double fullHeight;
  final double fullWidth;
  final double? backgroundTopHightPercent; 
  final String? title;
  final String? subTitle;
  final double? dataBoxLeft ; 
  final double? dataBoxRight ; 
  final double? dataBoxTop ; 
  final double? dataBoxBottom ; 
  final BoxDecoration? dataBoxDecoration ; 
  final Widget? child ; 

  const StructuredScreen(
      {super.key,
      required this.fullHeight,
      required this.fullWidth,
      this.backgroundTopHightPercent,
      this.title,
      this.subTitle,      
      this.dataBoxLeft=100,
      this.dataBoxRight=100, 
      this.dataBoxTop=250, 
      this.dataBoxBottom=250,
      this.dataBoxDecoration,
      this.child,
      });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color.fromARGB(255, 218, 218, 218),
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            toolbarHeight: 80,
            foregroundColor: Colors.white,
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(size: 30, color: Colors.white),
            title: Image.asset(
              'assets/icons/app_icon.png',
              width: 100,
            ),
            centerTitle: true,
          ),
          body: SizedBox(
            width: fullWidth,
            height: fullHeight,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                      height: backgroundTopHightPercent!=null ? fullHeight * backgroundTopHightPercent! : fullHeight * 0.35,
                      width: fullWidth,
                      decoration: const BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                      ),
                      child: Container(
                          margin: const EdgeInsets.only(
                              top: 80, bottom: 100, left: 20, right: 20),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                alignment: Alignment.centerLeft,
                                child: Text(title ?? '', 
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(subTitle ?? '', 
                                   style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16
                                  ),
                                ),
                              ),
                            ],
                          ))),
                ),
                Positioned(
                  left: dataBoxLeft,
                  right: dataBoxRight,
                  top: dataBoxTop,
                  bottom: dataBoxBottom,
                  child: Container(
                    decoration: dataBoxDecoration ?? const BoxDecoration(color: Colors.white),
                    child: child,
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
          )),
    );
  }
}
