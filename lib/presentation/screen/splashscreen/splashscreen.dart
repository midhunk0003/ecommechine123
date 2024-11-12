import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      checkLoginOrNot();
    });
    super.initState();
  }

  void checkLoginOrNot() async {
    final sharedpre = await SharedPreferences.getInstance();
    final String? logintoken = sharedpre.getString("auth_token");
    if (logintoken != null) {
      print("homebottom");
      Navigator.pushReplacementNamed(context, "/bottomNavbar");
    } else {
      print("login");
      Navigator.pushReplacementNamed(context, '/loginscreen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.amber,
              image: DecorationImage(
                image: AssetImage("assets/images/splash2.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/cart.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
