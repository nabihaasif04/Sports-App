import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFDE5D07),
              Color(0xFF7A4E23),
            ], // Orange and Brown gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            // Back Button
            Positioned(
              top: MediaQuery.of(context).padding.top + 8,
              left: 8,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            // White container for form
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: MediaQuery.of(context).size.height * 0.92,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                ),
                child: SafeArea(
                  top: false,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header
                          Text(
                            'Create your account',
                            style: GoogleFonts.poppins(
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                              color: Colors.black, // Black text
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Let’s get started with your details below.',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 32),

                          // Full Name
                          _buildTextField(hint: 'Full Name'),
                          const SizedBox(height: 20),

                          // Email
                          _buildTextField(
                            hint: 'Email',
                            inputType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 20),

                          // Phone
                          _buildTextField(
                            hint: 'New Password',
                            inputType: TextInputType.phone,
                          ),
                          const SizedBox(height: 20),

                          // Password
                          _buildTextField(
                            hint: 'Confirm Password',
                            isPassword: true,
                          ),
                          const SizedBox(height: 32),

                          // Sign Up Button
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/profile');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFDE5D07),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                'Sign Up',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 24),

                          // Already have an account
                          Center(
                            child: RichText(
                              text: TextSpan(
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                ),
                                children: [
                                  const TextSpan(
                                    text: 'Already have an account? ',
                                  ),
                                  WidgetSpan(
                                    child: GestureDetector(
                                      onTap: () {
                                        // Navigate to login screen
                                      },
                                      child: Text(
                                        'Log in',
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFFDE5D07),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    bool isPassword = false,
    TextInputType inputType = TextInputType.text,
  }) {
    return TextField(
      obscureText: isPassword,
      keyboardType: inputType,
      style: GoogleFonts.poppins(
        fontSize: 16,
        color: Colors.black,
      ), // Text color black
      cursorColor: const Color(0xFFDE5D07), // Orange cursor
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.poppins(color: Colors.grey),
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
