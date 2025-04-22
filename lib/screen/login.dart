import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailPattern = '^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}\$';
  final String _correctEmail = 'two@elective.com';
  final String correctPassword = '123456';
  String _errorMessage = '';
  bool _isSuccess = false;

  @override
  void dispose() {
    _emailController.dispose();

    _passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final isCorrect = RegExp(_emailPattern).hasMatch(value);
    if (!isCorrect) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (_emailController.text == _correctEmail &&
          _passwordController.text == correctPassword) {
        setState(() {
          _errorMessage = '';
          _isSuccess = true;
        });
      } else {
        setState(() {
          _errorMessage = 'Invalid email or password';
          _isSuccess = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: _validateEmail,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: _validatePassword,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Login'),
              ),
              SizedBox(height: 20),
              if (_errorMessage.isNotEmpty)
                Text(
                  _errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
              if (_isSuccess)
                Text(
                  'Login Successful!',
                  style: TextStyle(color: Colors.green),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
