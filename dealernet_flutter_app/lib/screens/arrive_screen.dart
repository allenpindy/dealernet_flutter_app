import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dealernet_flutter_app/data/db.dart';

class ArriveScreen extends StatelessWidget {
  const ArriveScreen({super.key});

  static const String _address = '638 Maple Ct, Brownsburg, IN 46112';

  Future<void> _launchGoogleMaps(BuildContext context) async {
    // Encode the address so spaces/special chars are safe in a URL
    final query = Uri.encodeComponent(_address);

    // Google Maps search URL (works on Android/iOS; opens Maps app or browser)
    final uri = Uri.parse('https://www.google.com/maps/search/?api=1&query=$query');

    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open Google Maps.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Customer: John Smith',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            const Text(
              'Customer Address: 638 Maple Ct, Brownsburg, IN 46112',
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(height: 12),

            // Get Directions button 
            ElevatedButton.icon(
              icon: const Icon(Icons.punch_clock),
              label: const Text('Mark Arrived'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                textStyle: const TextStyle(fontSize: 16),
              ),
              onPressed: () async {
                final now = DateTime.now();

                await appDb.markArrived(
                  jobId: 'JOB-0001',
                  arrivedAt: now,
                  customerName: 'John Smith',
                  address: _address,
                );

                if (!context.mounted) return;

                final timeStr = TimeOfDay.fromDateTime(now).format(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Arrival recorded at $timeStr')),
                );
              },
            ),

            const SizedBox(height: 16),

            const Text(
              'System Discussed at Schedule: Alarm + Cameras',
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(height: 12),
            const Text(
              'NOTES: Please arrive between 8:15-8:30 and knock hard on front door.',
              style: TextStyle(fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}