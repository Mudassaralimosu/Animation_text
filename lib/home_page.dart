import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showAnim = false;

  double top1 = 200;
  double top2 = 400;
  double left = 500;
  bool type = false;

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        showAnim = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Positioned(
              top: 70,
              width: width,
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.redAccent),
                child: Center(
                  child: DefaultTextStyle(
                    style: TextStyle(fontSize: 30, color: Colors.white),
                    child: AnimatedTextKit(
                        repeatForever: false,
                        totalRepeatCount: 5,
                        animatedTexts: [
                          RotateAnimatedText("Innovator",
                              rotateOut: false
                                   // you can comment this out , it looks more good
                              )
                        ]),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                top: top1,
                left: 0,
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
                  width: width,
                  child: DefaultTextStyle(
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'popin',
                        color: Colors.blue,
                      ),
                      child: AnimatedTextKit(
                        totalRepeatCount: 1,
                        repeatForever: false,
                        animatedTexts: [
                          TyperAnimatedText(
                              "Have the courage ",
                              speed: Duration(milliseconds: 100)),
                          TyperAnimatedText(
                              "to follow your heart",
                              speed: Duration(milliseconds: 100)),
                          TyperAnimatedText("and intuition",
                              speed: Duration(milliseconds: 100)),
                          TyperAnimatedText("--- Steve Jobs",
                              speed: Duration(milliseconds: 100))
                        ],
                      )),
                )),
            showAnim
                ? AnimatedPositioned(
                    duration: Duration(milliseconds: 500),
                    top: top2,
                    width: width,
                    child: Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blueAccent),
                      child: Container(
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 10,
                                height: 100,
                              ),
                              Text(
                                "Stay",
                                style: TextStyle(
                                    fontSize: 40, color: Colors.white),
                              ),
                              SizedBox(
                                width: 15,
                                height: 100,
                              ),
                              DefaultTextStyle(
                                  style: TextStyle(
                                      fontSize: 35, color: Colors.white),
                                  child: AnimatedTextKit(
                                    onFinished: () {
                                      setState(() {
                                        top1 = 400;
                                        top2 = 200;
                                        left = 0;
                                        type = true;
                                      });
                                    },
                                    repeatForever: false,
                                    totalRepeatCount: 1,
                                    animatedTexts: [
                                      RotateAnimatedText("Hungry"),
                                      RotateAnimatedText("Cool"),
                                      RotateAnimatedText("Foolish")
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
            // AnimatedPositioned(
            //     duration: Duration(
            //       milliseconds: 500,
            //     ),
            //     top: 450,
            //     left: left,
            //     child: Container(
            //       width: width - 40,
            //       height: 400,
            //       margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(40),
            //           color: Colors.deepOrangeAccent),
            //       child: type
            //           ? DefaultTextStyle(
            //               style: const TextStyle(fontSize: 30.0),
            //               child: Padding(
            //                 padding: const EdgeInsets.all(8.0),
            //                 child: Center(
            //                   child: AnimatedTextKit(
            //                     repeatForever: true,
            //                     animatedTexts: [
            //                       TypewriterAnimatedText(
            //                           'If something is important enough',
            //                           curve: Curves.easeIn,
            //                           speed: Duration(milliseconds: 80)),
            //                       TypewriterAnimatedText(
            //                           'you do it even if the odds,',
            //                           curve: Curves.easeIn,
            //                           speed: Duration(milliseconds: 80)),
            //                       TypewriterAnimatedText(
            //                           'are not in your favor',
            //                           curve: Curves.easeIn,
            //                           speed: Duration(milliseconds: 80)),
            //                     ],
            //                   ),
            //                 ),
            //               ),
            //             )
            //           : Text(""),
            //     )
            //     )
          ],
        ),
      ),
    );
    ;
  }
}
