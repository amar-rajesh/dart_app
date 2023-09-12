import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences
import 'home_page.dart';
import 'signup_page.dart';

void main() {
  runApp(LoginPage());
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;
  bool passwordVisible = false; // Track password visibility

  @override
  void initState() {
    super.initState();
    _loadSavedUserData(); // Load saved user data from SharedPreferences when the page initializes.
  }

  Future<void> _loadSavedUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      // Retrieve saved data and populate the fields
      emailController.text = prefs.getString('email') ?? '';
      rememberUser = prefs.getBool('rememberUser') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.lightGreen, // Set your desired primary color here
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: Text('Login', style: TextStyle(color: Colors.white)),
        ),
        body: Stack(
          children: [
            Image.asset(
              'assets/farm.jpeg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome',
                          style: TextStyle(
                            color: Colors.lightGreen,
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        _buildGreyText('Please login with your information'),
                        SizedBox(height: 60),
                        _buildGreyText('Email address'),
                        _buildInputField(emailController),
                        SizedBox(height: 40),
                        _buildGreyText('Password'),
                        _buildInputField(passwordController, isPassword: true),
                        SizedBox(height: 20),
                        _buildRememberForgot(),
                        SizedBox(height: 20),
                        _buildLoginButton(),
                        SizedBox(height: 20),
                        _buildSignUpButton(),
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

  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: TextStyle(color: Colors.black),
    );
  }

  Widget _buildInputField(TextEditingController controller,
      {isPassword = false}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          suffixIcon:
              isPassword ? Icon(Icons.remove_red_eye) : Icon(Icons.done),
          fillColor:
              Color.fromARGB(255, 0, 211, 53) // Text field background color

          ),
      obscureText: isPassword,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }

  Widget _buildRememberForgot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: rememberUser,
              onChanged: (value) {
                setState(() {
                  rememberUser = value!;
                });
              },
            ),
            _buildGreyText('Remember me'),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: _buildGreyText('I forgot my password'),
        )
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          debugPrint('Email : ${emailController.text}');
          debugPrint('Password : ${passwordController.text}');
          // You can navigate to the home page like this:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        elevation: 20,
        shadowColor: Colors.lightGreen,
        minimumSize: Size.fromHeight(60),
        primary: Colors.lightGreen, // Set button color to light green
      ),
      child: Text('LOGIN', style: TextStyle(color: Colors.white)),
    );
  }

  Widget _buildSignUpButton() {
    return Column(
      children: [
        Text("If you don't have an account, click here to"),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            // Navigate to the signup page when the "Sign Up" button is pressed.
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      SignupPage()), // Navigate to the SignupPage
            );
          },
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            elevation: 20,
            shadowColor: Colors.lightGreen,
            minimumSize: Size.fromHeight(60),
            primary: Colors.lightGreen, // Set button color to light green
          ),
          child: Text('SIGN UP', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
