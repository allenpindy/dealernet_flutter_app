import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:dealernet_flutter_app/data/db.dart';
import 'package:dealernet_flutter_app/data/session.dart';

import 'package:dealernet_flutter_app/screens/install_screen.dart';



class HomeScreen extends StatelessWidget {
  final VoidCallback onOpenInstall;

  const HomeScreen({super.key, required this.onOpenInstall});

  @override
  Widget _userWelcome() {
    final username = Session.username ?? 'jqinstaller';

    return FutureBuilder(
      future: appDb.getUserByUsername(username),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Text('Loading user...');
        }

        final user = snapshot.data;
        if (user == null) {
          return Text('Unknown user: $username');
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome ${user.fullName}!',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              user.companyName,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ],
        );
      },
    );
  }
  Widget build(BuildContext context) {
    return Row(
      children: [
        // LEFT SIDE (20%)
        Expanded(
          flex: 2, // 2 / (2 + 8) = 20%
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(2),
                  padding: const EdgeInsets.all(6),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Day (${DateFormat.yMMMMd().format(DateTime.now())})',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: const Text(
                          '8:00-12:00p (Install)',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: const Icon(Icons.chevron_right, size: 16),
                        onTap: onOpenInstall,
                      ),
                      Text('12:00-12:30p (lunch)'),
                      Text('12:30-2:00p (Support)'),
                      Text('2:00-6:00p (Install)'),
                      Text('6:00-7:30p (Assist)'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(6),
                  color: Colors.white,
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Knowledge Base',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('• Installation Guides'),
                      Text('• Troubleshooting'),
                      Text('• FAQs'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const VerticalDivider(width: 1),
        // RIGHT SIDE (80%)
        Expanded(
          flex: 8, // 8 / (2 + 8) = 80%
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            alignment: Alignment.topCenter,
            child: _userWelcome(),
          ),
        ),
      ],
    );
  }
}