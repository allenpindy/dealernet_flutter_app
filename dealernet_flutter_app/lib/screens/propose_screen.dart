import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:dealernet_flutter_app/data/db.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class ProposeScreen extends StatefulWidget {
  const ProposeScreen({
    super.key,
    required this.proposalId,
  });

  // Identifies which proposal/job this contract belongs to
  final int proposalId;

  @override
  State<ProposeScreen> createState() => _ProposeScreenState();
}

class _ProposeScreenState extends State<ProposeScreen> 
    with AutomaticKeepAliveClientMixin {
  final GlobalKey<SfSignaturePadState> _signatureKey = GlobalKey();

  Uint8List? _savedSignature;
  bool _hasSigned = false;

  @override
  bool get wantKeepAlive => true;

  @override
void initState() {
  super.initState();
  _loadSavedSignature();
}

Future<void> _loadSavedSignature() async {
  final record =
      await appDb.getSignatureForProposal(widget.proposalId);

  if (record != null && mounted) {
    setState(() {
      _savedSignature = record.signaturePng;
      _hasSigned = true;
    });
  }
}

  // Capture the signature,tie it to the proposalId
  Future<void> _saveSignature() async {
    final signature = _signatureKey.currentState;
    if (signature == null) return;

    final image = await signature.toImage();
    final byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData == null) return;

    final Uint8List pngBytes = byteData.buffer.asUint8List();

    await appDb.saveSignature(
      proposalId: widget.proposalId,
      signatureBytes: pngBytes,
    );

    setState(() {
      _savedSignature = pngBytes;
      _hasSigned = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Contract signed for proposal ${widget.proposalId}',
        ),
      ),
    );
  }

  Widget _buildSignatureArea() {
    if (_hasSigned && _savedSignature != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Signed',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Image.memory(
            _savedSignature!,
            height: 180,
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _hasSigned = false;
                _savedSignature = null;
              });
            },
            child: const Text('Re‑sign'),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 180,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
          child: SfSignaturePad(
            key: _signatureKey,
            backgroundColor: Colors.white,
            strokeColor: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            ElevatedButton(
              onPressed: () =>
                  _signatureKey.currentState?.clear(),
              child: const Text('Clear'),
            ),
            const SizedBox(width: 12),
            ElevatedButton.icon(
              onPressed: _saveSignature,
              icon: const Icon(Icons.check),
              label: const Text('Accept & Sign'),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Propose Contract'),
      ),
      body: Column(
        children: [
          /// ✅ Scrollable PDF contract
          Expanded(
            flex: 3,
            child: SfPdfViewer.asset(
              'assets/contracts/ADTcontract.pdf',
            ),
          ),

          /// ✅ Signature section
          Padding(
            padding: const EdgeInsets.all(12),
            child: _buildSignatureArea(),
          ),
        ],
      ),
    );
  }
}