import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  String? gender;
  String? role;
  String? sportsType;
  String? level;
  String? availableDays;

  final _orange = const Color(0xFFFFA726);
  final _brown = const Color(0xFF6D4C41);
  final _darkOrange = const Color(0xFFE65100); // Dark orange color for focus

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [_orange, _brown],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Card(
              color: Colors.white,
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Center(
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(
                            'assets/placeholder_user.png',
                          ),
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 16),

                      _buildTextField('Name'),
                      _buildTextField(
                        'Age',
                        keyboardType: TextInputType.number,
                      ),
                      _buildTextField('Username'),
                      _buildTextField(
                        'Email',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      _buildTextField(
                        'Phone Number',
                        keyboardType: TextInputType.phone,
                      ),
                      _buildTextField('Bio', maxLines: 3),
                      _buildTextField('Location'),

                      _buildDropdownField(
                        label: 'Gender',
                        value: gender,
                        items: ['Male', 'Female', 'Other'],
                        onChanged: (val) => setState(() => gender = val),
                      ),
                      _buildDropdownField(
                        label: 'Role / Position',
                        value: role,
                        items: [
                          'Forward',
                          'Midfielder',
                          'Defender',
                          'Goalkeeper',
                          'Coach',
                          'Other',
                        ],
                        onChanged: (val) => setState(() => role = val),
                      ),
                      _buildDropdownField(
                        label: 'Sports Type',
                        value: sportsType,
                        items: [
                          'Football',
                          'Basketball',
                          'Cricket',
                          'Tennis',
                          'Other',
                        ],
                        onChanged: (val) => setState(() => sportsType = val),
                      ),
                      _buildDropdownField(
                        label: 'Level',
                        value: level,
                        items: [
                          'Beginner',
                          'Intermediate',
                          'Advanced',
                          'Professional',
                        ],
                        onChanged: (val) => setState(() => level = val),
                      ),
                      _buildDropdownField(
                        label: 'Available Days',
                        value: availableDays,
                        items: ['Weekdays', 'Weekends', 'Everyday'],
                        onChanged: (val) => setState(() => availableDays = val),
                      ),

                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _orange,
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Save profile logic
                          }
                        },
                        child: const Text('Save Profile'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label, {
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Focus(
        child: TextFormField(
          cursorColor: _darkOrange,
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(color: Colors.grey),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: _darkOrange, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: _orange),
              borderRadius: BorderRadius.circular(12),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            floatingLabelStyle: TextStyle(color: _darkOrange),
          ),
          validator:
              (value) =>
                  value == null || value.isEmpty ? 'Please enter $label' : null,
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: DropdownButtonFormField<String>(
        value: value,
        onChanged: onChanged,
        items:
            items
                .map((item) => DropdownMenuItem(value: item, child: Text(item)))
                .toList(),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.grey),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: _orange),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: _darkOrange, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          floatingLabelStyle: TextStyle(color: _darkOrange),
        ),
        icon: Icon(Icons.arrow_drop_down, color: _orange),
        dropdownColor: Colors.white,
        borderRadius: BorderRadius.circular(12),
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
