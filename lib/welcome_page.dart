import 'package:e_commerce_app/sign_in.dart';
import 'package:e_commerce_app/sign_up.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ShopCraft",
          style: TextStyle(
            fontFamily: "Suwannaphum-Bold",
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 82, 68, 188),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF6153CC), Color.fromARGB(255, 150, 142, 209)],
          ),
        ),
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 200),
              child: Text(
                "Your Premium Shopping Experience",
                style: TextStyle(
                  fontFamily: "Suwannaphum-Bold",
                  fontSize: 20,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            SizedBox(height: height * 0.05),
            Container(
              height: height * 0.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      width: width * 0.45,
                      height: height * 0.45,
                      "images/2.webp",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      width: width * 0.45,
                      height: height * 0.45,
                      "https://tse4.mm.bing.net/th/id/OIP.XjoOJdjiUmS4i_Zyr99phgHaFj?cb=thfc1&rs=1&pid=ImgDetMain&o=7&rm=3",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryanimation) =>
                            SignUp_Page(),
                        transitionDuration: Duration(milliseconds: 500),
                        transitionsBuilder:
                            (context, animation, secondaryanimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                      ),
                    );
                  },
                  child: Text(
                    "<Sign Up>",
                    style: TextStyle(fontFamily: "Suwannaphum-Bold"),
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryanimation) =>
                            SignIn_Page(),
                        transitionDuration: Duration(milliseconds: 500),
                        transitionsBuilder:
                            (context, animation, secondaryanimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                      ),
                    );
                  },
                  child: Text(
                    "<Sign in>",
                    style: TextStyle(fontFamily: "Suwannaphum-Bold"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
