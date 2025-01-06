import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:google_fonts/google_fonts.dart'; // Add Google Fonts package
import 'login_screen.dart';  // Import your login screen

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<ContentConfig> listContentConfig = [];

  @override
  void initState() {
    super.initState();

    listContentConfig = [
      ContentConfig(
        title: "Welcome!",
        description:
            "We’re thrilled to have you. Let’s get you set up so you can start enjoying all the features we offer.",
        pathImage: "assets/images/welcome.png",
        backgroundColor: Colors.transparent,
        styleTitle: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            shadows: [
              Shadow(
                blurRadius: 10.0,
                color: Colors.black45,
                offset: Offset(2.0, 2.0),
              ),
            ],
          ),
        ),
        styleDescription: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: Colors.white70,
            fontSize: 18.0,
            height: 1.5,
          ),
        ),
        marginTitle: EdgeInsets.only(top: 20.0),
        marginDescription: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      ),
      ContentConfig(
        title: "Remote Monitoring",
        description:
            "Monitor your device from anywhere with real-time updates. Stay connected and in control.",
        pathImage: "assets/images/monitoring.png",
        backgroundColor: Colors.transparent,
        styleTitle: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            shadows: [
              Shadow(
                blurRadius: 10.0,
                color: Colors.black45,
                offset: Offset(2.0, 2.0),
              ),
            ],
          ),
        ),
        styleDescription: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: Colors.white70,
            fontSize: 18.0,
            height: 1.5,
          ),
        ),
        marginTitle: EdgeInsets.only(top: 20.0),
        marginDescription: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      ),
      ContentConfig(
        title: "Automated Rocking",
        description:
            "Our app can automate rocking based on your preferences. Set it up once and let us take care of the rest.",
        pathImage: "assets/images/rocking.png",
        backgroundColor: Colors.transparent,
        styleTitle: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            shadows: [
              Shadow(
                blurRadius: 10.0,
                color: Colors.black45,
                offset: Offset(2.0, 2.0),
              ),
            ],
          ),
        ),
        styleDescription: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: Colors.white70,
            fontSize: 18.0,
            height: 1.5,
          ),
        ),
        marginTitle: EdgeInsets.only(top: 20.0),
        marginDescription: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      ),
      ContentConfig(
        title: "Live Video Streaming",
        description:
            "Access live video streaming anytime, anywhere. Stay connected through high-quality, real-time video.",
        pathImage: "assets/images/video.png",
        backgroundColor: Colors.transparent,
        styleTitle: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            shadows: [
              Shadow(
                blurRadius: 10.0,
                color: Colors.black45,
                offset: Offset(2.0, 2.0),
              ),
            ],
          ),
        ),
        styleDescription: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: Colors.white70,
            fontSize: 18.0,
            height: 1.5,
          ),
        ),
        marginTitle: EdgeInsets.only(top: 20.0),
        marginDescription: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      ),
    ];
  }

  void onDonePress() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.pink, Colors.orange, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: IntroSlider(
            key: UniqueKey(),
            listContentConfig: listContentConfig,
            onDonePress: onDonePress,
            renderSkipBtn: Text(
              "Skip",
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            renderNextBtn: Icon(Icons.navigate_next, color: Colors.white, size: 32.0),
            renderDoneBtn: Text(
              "Get Started!",
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            renderPrevBtn: Icon(Icons.navigate_before, color: Colors.white, size: 32.0),
          ),
        ),
      ),
    );
  }
}
