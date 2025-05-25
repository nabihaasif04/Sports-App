import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sports_app4/screens/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3), // Adjust duration as needed
      vsync: this,
    );

    // Listen to the animation status and trigger the page transition once it's complete
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Trigger the custom page transition
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder:
                (context, animation, secondaryAnimation) =>
                    const OnboardingScreen(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              const begin = Offset(1.0, 0.0); // Slide from right
              const end = Offset.zero; // End position (fully on the screen)
              const curve = Curves.easeInOut; // Smooth curve for transition
              var tween = Tween(
                begin: begin,
                end: end,
              ).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
            transitionDuration: const Duration(
              milliseconds: 800,
            ), // Smooth duration
          ),
        );
      }
    });

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFDE5D07), // Orange top
              Color.fromARGB(255, 143, 63, 14), // Light orange bottom
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Lottie.asset(
            'assets/images/animations/Animation-running.json', // Path to your Lottie file
            controller: _controller,
            onLoaded: (composition) {
              _controller
                ..duration = composition.duration
                ..forward();
            },
            width: 300,
            height: 300,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
