import 'package:flutter/material.dart';
import '../data/db.dart'; // appDb

class UpdateInfoScreen extends StatefulWidget {
  const UpdateInfoScreen({super.key});

  @override
  State<UpdateInfoScreen> createState() => _UpdateInfoScreenState();
}

class _UpdateInfoScreenState extends State<UpdateInfoScreen> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController(text: 'jqinstaller');
  final _fullNameController = TextEditingController();
  final _companyController = TextEditingController();

  bool _loading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _fullNameController.dispose();
    _companyController.dispose();
    super.dispose();
  }

  Future<void> _loadUser() async {
    final username = _usernameController.text.trim();
    if (username.isEmpty) {
      _snack('Username is required.');
      return;
    }

    setState(() => _loading = true);

    try {
      final user = await appDb.getUserByUsername(username);

      if (user == null) {
        _fullNameController.text = '';
        _companyController.text = '';
        _snack('No user found for "$username". Enter values and press Save to create.');
      } else {
        _fullNameController.text = user.fullName;
        _companyController.text = user.companyName;
        _snack('Loaded "$username".');
      }
    } catch (e) {
      _snack('Load failed: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  Future<void> _saveUser() async {
    final valid = _formKey.currentState?.validate() ?? false;
    if (!valid) return;

    final username = _usernameController.text.trim();
    final fullName = _fullNameController.text.trim();
    final company = _companyController.text.trim();

    setState(() => _loading = true);

    try {
      await appDb.upsertUser(
        username: username,
        fullName: fullName,
        companyName: company,
      );
      _snack('Saved "$username".');
    } catch (e) {
      _snack('Save failed: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  Future<void> _deleteUser() async {
    final username = _usernameController.text.trim();
    if (username.isEmpty) {
      _snack('Username is required.');
      return;
    }

    setState(() => _loading = true);

    try {
      await appDb.deleteUserByUsername(username);
      _fullNameController.clear();
      _companyController.clear();
      _snack('Deleted "$username" (if it existed).');
    } catch (e) {
      _snack('Delete failed: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  void _snack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update User Info (Prototype Utility)'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                    validator: (v) =>
                        (v == null || v.trim().isEmpty) ? 'Username required' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _fullNameController,
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (v) =>
                        (v == null || v.trim().isEmpty) ? 'Full name required' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _companyController,
                    decoration: const InputDecoration(
                      labelText: 'Company Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (v) =>
                        (v == null || v.trim().isEmpty) ? 'Company required' : null,
                  ),
                  const SizedBox(height: 16),

                  if (_loading) const LinearProgressIndicator(),
                  const SizedBox(height: 8),

                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: _loading ? null : _loadUser,
                          child: const Text('Load'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _loading ? null : _saveUser,
                          child: const Text('Save'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: _loading ? null : _deleteUser,
                      child: const Text('Delete User'),
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