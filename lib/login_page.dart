import 'package:dart_app/home_page.dart';
import 'package:flutter/material.dart';
import 'signup_page.dart'; // Import the SignupPage where you navigate when clicking the "Sign Up" button.

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
              'assets/farm.jpeg', // Replace with your image asset
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
                        _buildOtherLogin(),
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
          // You can navigate to the signup page like this:
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

  Widget _buildOtherLogin() {
    return Center(
      child: Column(
        children: [
          _buildGreyText('Or Login with'),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Tab(icon: Image.asset('assets/google.jpeg')),
            ],
          )
        ],
      ),
    );
  }
}
