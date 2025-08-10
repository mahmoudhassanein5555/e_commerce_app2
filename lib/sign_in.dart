import 'package:e_commerce_app/home_page.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class SignIn_Page extends StatefulWidget {
  const SignIn_Page({super.key});

  @override
  State<SignIn_Page> createState() => _SignIn_PageState();
}

// ignore: camel_case_types
class _SignIn_PageState extends State<SignIn_Page> {
  bool done = false;
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFF6153CC)),
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF6153CC), Color.fromARGB(255, 150, 142, 209)],
          ),
        ),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            height: height * 0.45,
            width: width * 0.9,
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Container(
                    child: Text(
                      "Welcome Back",
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontFamily: "Suwannaphum-Bold",
                        fontSize: 40,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Sign in to ShopCraft",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 86, 84, 90),
                        fontFamily: "Suwannaphum-Bold",
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Container(
                    margin: EdgeInsets.only(right: 280),
                    child: Text(
                      "Email",
                      style: TextStyle(fontFamily: "Suwannaphum-Bold"),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Container(
                    margin: EdgeInsets.only(right: 30, left: 30, bottom: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hint: Text(
                          "Enter your email",
                          style: TextStyle(
                            fontFamily: "Suwannaphum-Bold",
                            color: const Color.fromARGB(255, 75, 88, 95),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide: BorderSide(
                            color: Colors.deepPurple,
                            width: 2,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Re Enter Your Name ";
                        } else if (!value.contains("@") ||
                            !value.contains(".")) {
                          return "Incorrect email";
                        }
                        return null;
                      },
                    ),
                  ),
                  /////////////////////////////////////////////////////////////////////////
                  Container(
                    margin: EdgeInsets.only(right: 250),
                    child: Text(
                      "Password",
                      style: TextStyle(fontFamily: "Suwannaphum-Bold"),
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Container(
                    margin: EdgeInsets.only(right: 30, left: 30, bottom: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hint: Text(
                          "Enter your password",
                          style: TextStyle(
                            fontFamily: "Suwannaphum-Bold",
                            color: const Color.fromARGB(255, 75, 88, 95),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide: BorderSide(
                            color: Colors.deepPurple,
                            width: 2,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password is required";
                        } else if (value.length < 6) {
                          return "Password must be at least 6 characters";
                        } else {
                          done = true;
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                  ),
                  ////////////////////////////////////////////////////////////
                  ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        debugPrint("re");
                      }
                      if (done) {
                        showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text("You have signed in successfully"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder:
                                          (
                                            context,
                                            animation,
                                            secondaryanimation,
                                          ) => HomePage(),
                                      transitionDuration: Duration(
                                        milliseconds: 500,
                                      ),
                                      transitionsBuilder:
                                          (
                                            context,
                                            animation,
                                            secondaryanimation,
                                            child,
                                          ) {
                                            return FadeTransition(
                                              opacity: animation,
                                              child: child,
                                            );
                                          },
                                    ),
                                    (route) => false,
                                  );
                                },
                                child: Text("Close"),
                              ),
                            ],
                          );
                        },
                      );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 148, 86, 255),
                      minimumSize: Size(300, 45),
                    ),

                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        fontFamily: "Suwannaphum-Bold",
                        color: Colors.black,
                        fontSize: 19,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
