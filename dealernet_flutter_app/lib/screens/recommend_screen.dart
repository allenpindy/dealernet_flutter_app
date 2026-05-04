import 'package:flutter/material.dart';
import 'package:dealernet_flutter_app/data/db.dart';

class RecommendScreen extends StatefulWidget {
  const RecommendScreen({super.key});

  @override
  State<RecommendScreen> createState() => _RecommendScreenState();
}

class _RecommendScreenState extends State<RecommendScreen> {
  final String _activeJobBusinessId = 'JOB-0001';

  late Future<List<RecommendedItem>> _itemsFuture;

  @override
  void initState() {
    super.initState();
    _itemsFuture = _load();
  }

  Future<List<RecommendedItem>> _load() async {
    final job = await appDb.getJobByJobId(_activeJobBusinessId);
    if (job == null) {
      throw Exception('No job found for $_activeJobBusinessId');
    }
    return appDb.getRecommendedItemsForJob(job.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recommend')),
      body: FutureBuilder<List<RecommendedItem>>(
        future: _itemsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          final items = snapshot.data!;
          if (items.isEmpty) {
            return const Center(
              child: Text('No equipment selected during Walk‑Thru.'),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: items.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, i) {
              final item = items[i];
              return ListTile(
                leading: CircleAvatar(
                  child: Text(item.quantity.toString()),
                ),
                title: Text(item.equipmentName),
                subtitle: Text(item.category),
                trailing: Text(
                  'Qty ${item.quantity}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            },
          );
        },
      ),
    );
  }
}