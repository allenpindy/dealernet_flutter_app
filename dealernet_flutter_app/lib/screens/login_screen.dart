import 'package:flutter/material.dart';
//import 'package:dealernet_flutter_app/screens/reminder_screen.dart';
import 'package:dealernet_flutter_app/data/session.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>(); // Form validation key [1](https://docs.flutter.dev/cookbook/forms/validation)
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _hidePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    // Validate all fields in the form [1](https://docs.flutter.dev/cookbook/forms/validation)
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    final username = _usernameController.text.trim();
    final password = _passwordController.text; // keep spaces if user typed them

    // Prototype: This will eventually be wired to the database
    final usernameOk = username == 'jqinstaller';
    final passwordOk = password.trim().isNotEmpty;

    if (usernameOk && passwordOk) {
      // Replace login screen so user can't navigate back to it
      Session.username = username;
      Navigator.of(context).pushReplacementNamed('/app');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid credentials. Try again.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DealerNET Login')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey, // [1](https://docs.flutter.dev/cookbook/forms/validation)
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Username is required.';
                      }
                      if (value.trim() != 'jqinstaller') {
                        return 'Invalid Username.';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _hidePassword, // masked input
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () => setState(() => _hidePassword = !_hidePassword),
                        icon: Icon(_hidePassword ? Icons.visibility : Icons.visibility_off),
                      ),
                    ),
                    onFieldSubmitted: (_) => _submit(),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Password cannot be blank.';
                      }
                      return null;
                    },
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                  
                      onPressed: _submit,

                      child: const Text('Forgot password?'),
                    ),
                  ),

                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _submit,
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}