import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences

import 'login_page.dart';

void main() {
  runApp(SignupPage());
}

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String firstName = '';
  String surname = '';
  String email = '';
  String phoneNumber = '';
  String password = '';
  String confirmPassword = '';
  String selectedRole = 'Farmer'; // Default role
  bool agreedToTerms = false;
  bool passwordVisible = false; // Track password visibility
  bool passwordMatch = true; // Track password match

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove debug banner
      theme: ThemeData(
        primaryColor: Colors.lightGreen, // Set your desired primary color here
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen, // Set header color to light green
          title: Text(
            'Sign Up',
            style: TextStyle(
                color: Colors.white), // Set header text color to white
          ),
        ),
        body: Stack(
          children: [
            Image.asset(
              'assets/farm.jpeg', // Replace with your image asset
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              color: Colors.transparent, // Make container transparent
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'First Name',
                            fillColor: Colors
                                .lightGreen[100], // Text field background color
                            filled: true,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your First Name';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            firstName = value!;
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Surname',
                            fillColor: Colors
                                .lightGreen[100], // Text field background color
                            filled: true,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Surname';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            surname = value!;
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            fillColor: Colors
                                .lightGreen[100], // Text field background color
                            filled: true,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Email';
                            }
                            if (!value.contains('@') ||
                                !value.contains('.com')) {
                              return 'Please check your Email format';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            email = value!;
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            fillColor: Colors
                                .lightGreen[100], // Text field background color
                            filled: true,
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Phone Number';
                            }
                            // You can add more specific phone number validation here if needed.
                            return null;
                          },
                          onSaved: (value) {
                            phoneNumber = value!;
                          },
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  fillColor: Colors.lightGreen[
                                      100], // Text field background color
                                  filled: true,
                                ),
                                obscureText: !passwordVisible,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a Password';
                                  }
                                  if (value != confirmPassword) {
                                    setState(() {
                                      passwordMatch = false;
                                    });
                                    return 'Passwords do not match';
                                  } else {
                                    setState(() {
                                      passwordMatch = true;
                                    });
                                    return null;
                                  }
                                },
                                onSaved: (value) {
                                  password = value!;
                                },
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Confirm Password',
                                  fillColor: Colors.lightGreen[
                                      100], // Text field background color
                                  filled: true,
                                ),
                                obscureText: !passwordVisible,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please confirm your Password';
                                  }
                                  if (value != password) {
                                    setState(() {
                                      passwordMatch = false;
                                    });
                                    return 'Passwords do not match';
                                  } else {
                                    setState(() {
                                      passwordMatch = true;
                                    });
                                    return null;
                                  }
                                },
                                onSaved: (value) {
                                  confirmPassword = value!;
                                },
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        DropdownButtonFormField(
                          value: selectedRole,
                          items: ['Farmer', 'Customer', 'Supplier']
                              .map<DropdownMenuItem<String>>(
                                (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                ),
                              )
                              .toList(),
                          onChanged: (String? value) {
                            setState(() {
                              selectedRole = value!;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'Role',
                            fillColor: Colors
                                .lightGreen[100], // Text field background color
                            filled: true,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Checkbox(
                              value: agreedToTerms,
                              onChanged: (value) {
                                setState(() {
                                  agreedToTerms = value!;
                                });
                              },
                            ),
                            Text('I agree to the terms and conditions'),
                          ],
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () async {
                            // Validate the form
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, save the data to shared_preferences.
                              _formKey.currentState!.save();
                              await _saveUserDataToSharedPreferences();

                              // Navigate to the login page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors
                                .lightGreen, // Set button color to light green
                          ),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white),
                          ), // Set button text color to white
                        ),
                      ],
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

  Future<void> _saveUserDataToSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
    prefs.setString('password', password);
    prefs.setString('role', selectedRole);
  }
}
