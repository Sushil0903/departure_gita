

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(
      Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, "home_page");
    },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Opacity(
              opacity: 0.8,
              child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSD3VKeFjqFldbDcLvj1PRFEleKaX_FkA7Xkektzl0_aqr5iSaKvqfhiE8P37VI08o9aEg&usqp=CAU",
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Foreground content
          Center(
            child: Text(
              "BHAGAVAD GITA",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
