import 'package:blogger/core/common/widgets/custom_gradient_button.dart';
import 'package:blogger/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Signup", style: Theme.of(context).textTheme.headlineLarge),

              SizedBox(height: 16),
              CustomTextField(
                hintText: 'Name',
                controller: _nameController,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name";
                  }

                  return null;
                },
              ),
              SizedBox(height: 16),
              CustomTextField(
                hintText: 'Email',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }
                  if (!RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  ).hasMatch(value)) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              CustomTextField(
                hintText: 'Password',
                controller: _passwordController,
                keyboardType: TextInputType.text,
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              CustomGradientButton(text: 'Signup', onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
