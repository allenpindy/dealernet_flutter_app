import 'package:flutter/material.dart';
import 'package:dealernet_flutter_app/data/db.dart';

class WalkthruScreen extends StatefulWidget {
  const WalkthruScreen({super.key});

  @override
  State<WalkthruScreen> createState() => _WalkthruScreenState();
}

class _WalkthruScreenState extends State<WalkthruScreen> {
  final String _activeJobBusinessId = 'JOB-0001';

  int? _jobDbId;
  List<EquipmentData> _equipment = [];
  final Map<int, int> _selectedQty = {};

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final job = await appDb.getJobByJobId(_activeJobBusinessId);
    if (job == null) {
      throw Exception('No job found for $_activeJobBusinessId');
    }

    final equipment = await appDb.getAllEquipment();
    final selectedIds =
        await appDb.getSelectedEquipmentIdsForJob(job.id);

    setState(() {
      _jobDbId = job.id;
      _equipment = equipment;
      for (final id in selectedIds) {
        _selectedQty[id] = 1;
      }
      _loading = false;
    });
  }

  void _toggle(int equipmentId, bool selected) {
    setState(() {
      if (selected) {
        _selectedQty[equipmentId] = _selectedQty[equipmentId] ?? 1;
      } else {
        _selectedQty.remove(equipmentId);
      }
    });
  }

  void _setQty(int equipmentId, int qty) {
    setState(() {
      if (qty <= 0) {
        _selectedQty.remove(equipmentId);
      } else {
        _selectedQty[equipmentId] = qty;
      }
    });
  }

  Future<void> _save() async {
    if (_jobDbId == null) return;

    await appDb.saveEquipmentSelections(
      jobDbId: _jobDbId!,
      equipmentQtyById: _selectedQty,
    );

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Walk‑Thru selections saved')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Walk‑Thru'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _selectedQty.isEmpty ? null : _save,
          ),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: _equipment.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final e = _equipment[index];
                final selected = _selectedQty.containsKey(e.id);
                final qty = _selectedQty[e.id] ?? 1;

                return Row(
                  children: [
                    Checkbox(
                      value: selected,
                      onChanged: (v) => _toggle(e.id, v ?? false),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(e.name),
                        subtitle: Text('${e.category} • ${e.sku}'),
                      ),
                    ),
                    if (selected)
                      SizedBox(
                        width: 60,
                        child: TextFormField(
                          initialValue: qty.toString(),
                          keyboardType: TextInputType.number,
                          decoration:
                              const InputDecoration(labelText: 'Qty'),
                          onChanged: (v) =>
                              _setQty(e.id, int.tryParse(v) ?? 1),
                        ),
                      ),
                  ],
                );
              },
            ),
    );
  }
}