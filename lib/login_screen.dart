import 'dart:ui';
import 'package:crypto_wallet/splash_screen2.dart';
import 'package:flutter/material.dart';
import 'package:crypto_wallet/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void _onLoginPressed() {
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/stars.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    _buildLogo(),
                    _buildLoginForm(),
                  ],
                ),
              ),
              _buildFooter(),
            ],
          ),
        ],
      ),
    );
  }

  // Header with Back Button and Title
  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80, left: 20),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SplashScreen2()),
              );
            },
            icon: const Icon(Icons.arrow_back_ios, size: 30, color: Colors.white),
          ),
          const Text(
            'Login',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  // App Logo
  Widget _buildLogo() {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 30),
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.orangeAccent,
              Colors.black.withOpacity(0.0),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Image.asset('assets/bitcoin.png'),
      ),
    );
  }

  // Login Form
  Widget _buildLoginForm() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              height: 280,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField('Enter your email', false),
              const SizedBox(height: 20),
              _buildTextField('Enter your password', true),
              const SizedBox(height: 10),
              _buildForgotPassword(),
              const SizedBox(height: 40),
              _buildLoginButton(),
            ],
          ),
        ),
      ],
    );
  }

  // Text Field (Reusable for Email & Password)
  Widget _buildTextField(String labelText, bool isPassword) {
    return TextFormField(
      maxLines: 1,
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        isDense: true, // Reduces internal padding
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white),
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }

  // Forgot Password Text
  Widget _buildForgotPassword() {
    return const Padding(
      padding: EdgeInsets.only(left: 10),
      child: Text(
        'Forgot Password!',
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: Colors.amberAccent,
        ),
      ),
    );
  }

  // Login Button
  Widget _buildLoginButton() {
    return InkWell(
      onTap: _onLoginPressed,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.amberAccent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            'Login',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }

  // Footer Section
  Widget _buildFooter() {
    return Container(
      height: 70,
      width: double.infinity,
      color: Colors.black54,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Explore Our Crypto World',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white38,
            ),
          ),
          Text(
            'You can buy and sell the NFTs of the',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: Colors.white38,
            ),
          ),
          Text(
            'best artists in the world.',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: Colors.white38,
            ),
          ),
        ],
      ),
    );
  }
}
