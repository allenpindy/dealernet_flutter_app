import 'package:flutter/material.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _submitted = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _submit() {
    final valid = _formKey.currentState?.validate() ?? false;
    if (!valid) return;

    setState(() => _submitted = true);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Password reset'),
      content: _submitted
          ? const Text(
              'If you have a DealerNET account, you will receive password reset instructions shortly.',
            )
          : Form(
              key: _formKey,
              child: TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'name@example.com',
                ),
                keyboardType: TextInputType.emailAddress,
                autofocus: true,
                validator: (value) {
                  final v = (value ?? '').trim();
                  if (v.isEmpty) return 'Email is required.';
                  // Simple email-ish check (simulation-friendly)
                  if (!v.contains('@') || !v.contains('.')) {
                    return 'Enter a valid email address.';
                  }
                  return null;
                },
                onFieldSubmitted: (_) => _submit(),
              ),
            ),
      actions: _submitted
          ? [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Close'),
              ),
            ]
          : [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: _submit,
                child: const Text('Send reset link'),
              ),
            ],
    );
  }
}