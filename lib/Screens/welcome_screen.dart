import 'dart:ui';

import 'package:delivery_panel/Screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:delivery_panel/widgets/custom_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 35),
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/image1.png",
                    height: 300,
                  ),
                  const SizedBox(height: 20,),
                  const Text(
                    "let's get started",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const Text(
                    "Never a Better time than now to Start",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38
                    ),
                  ),
                  const SizedBox(height: 20,),
                  // custom button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: CustomButton(
                     onPressed: (){
                       Navigator.push(
                         context,
                         MaterialPageRoute(
                           builder: (context)=> const RegisterScreen()
                           ),
                       );
                     },
                      text: "Get Started",
                    ),
                  )
              ],
            ),),
          )),
    );
  }
}
