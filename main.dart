import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Screens
import 'package:sports_app4/screens/splashscreen.dart';
import 'package:sports_app4/screens/onboarding.dart';
import 'package:sports_app4/screens/loginpage.dart';
import 'package:sports_app4/screens/signup.dart';
import 'package:sports_app4/screens/verification_signup.dart';
import 'package:sports_app4/screens/profile.dart';
import 'package:sports_app4/screens/goodle_maps_flutter.dart';
import 'package:sports_app4/screens/homepage.dart'; // ✅ Import HomePage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const orangePrimary = Color(0xFFDE5D07);

    return MaterialApp(
      title: 'Sports App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: const MaterialColor(0xFFDE5D07, {
          50: Color(0xFFFFF3E0),
          100: Color(0xFFFFE0B2),
          200: Color(0xFFFFCC80),
          300: Color(0xFFFFB74D),
          400: Color(0xFFFFA726),
          500: orangePrimary,
          600: Color(0xFFF57C00),
          700: Color(0xFFEF6C00),
          800: Color(0xFFE65100),
          900: Color(0xFFBF360C),
        }),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: orangePrimary),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: orangePrimary,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
        textTheme: TextTheme(
          headlineMedium: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          bodyMedium: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.grey[700],
          ),
        ),
      ),

      // ✅ Set the initial screen (you can change this)
      initialRoute: '/splash',

      routes: {
        '/splash': (context) => const SplashScreen(),
        '/': (context) => const OnboardingScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/verification_signup': (context) => const VerificationSignupScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/maps': (context) => MapScreen(),
        '/home': (context) => const HomePage(), // ✅ Home screen route
      },
    );
  }
}
