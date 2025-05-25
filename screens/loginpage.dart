import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sports_app4/screens/goodle_maps_flutter.dart';
import 'package:sports_app4/screens/profile.dart';
import 'package:sports_app4/screens/homepage.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final size = MediaQuery.of(context).size;
    const orangeColor = Color(0xFFDE5D07);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Top Animated Header
          Stack(
            children: [
              Container(
                height: size.height * 0.35,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [orangeColor, Color(0xFFFF914D)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Lottie.asset(
                  'assets/images/animations/animation-login.json',
                  fit: BoxFit.cover,
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 50, top: 50),
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.2),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Login Form in Curved White Box
          Expanded(
            child: ClipPath(
              clipper: CurvedDownwardClipper(),
              child: Container(
                width: double.infinity,
                color: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Text(
                          'Welcome Back',
                          style: GoogleFonts.poppins(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Please sign in to continue',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        const SizedBox(height: 28),

                        // Email Field
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: const Icon(
                              Icons.email,
                              color: orangeColor,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: orangeColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Enter your email';
                            if (!value.contains('@'))
                              return 'Enter a valid email';
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        // Password Field
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: orangeColor,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: orangeColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24),

                        // Login Button
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.login, color: Colors.white),
                          label: Text(
                            'Login',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: orangeColor,
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 24,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            elevation: 4,
                          ),
                        ),
                        const SizedBox(height: 16),

                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: GoogleFonts.poppins(color: Colors.grey[700]),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Divider with "OR"
                        Row(
                          children: [
                            const Expanded(child: Divider(thickness: 1.2)),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Text(
                                'OR',
                                style: GoogleFonts.poppins(
                                  color: const Color.fromARGB(255, 4, 4, 4),
                                ),
                              ),
                            ),
                            const Expanded(child: Divider(thickness: 1.2)),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // Google Sign In with Custom Image
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            side: const BorderSide(color: Colors.grey),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/images/google.png', // Your custom Google icon
                                height: 24,
                                width: 24,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                'Continue with Google',
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Sign Up Prompt
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: GoogleFonts.poppins(),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/signup');
                              },
                              child: Text(
                                "Sign Up",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  color: orangeColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CurvedDownwardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 60);
    path.quadraticBezierTo(size.width / 2, -60, size.width, 60);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
