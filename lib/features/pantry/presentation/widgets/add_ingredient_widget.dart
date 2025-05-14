import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class AddIngredientWidget extends StatefulWidget {
  final void Function(String) onAdd;
  const AddIngredientWidget({Key? key, required this.onAdd}) : super(key: key);

  @override
  State<AddIngredientWidget> createState() => _AddIngredientWidgetState();
}

class _AddIngredientWidgetState extends State<AddIngredientWidget> {
  final TextEditingController _controller = TextEditingController();
  bool _scanning = false;
  String? _scanError;
  MobileScannerController? _scannerController;

  @override
  void dispose() {
    _scannerController?.dispose();
    super.dispose();
  }

  void _startScan() async {
    setState(() {
      _scanning = true;
      _scanError = null;
      _scannerController = MobileScannerController();
    });

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Scanner un code-barres'),
        content: SizedBox(
          width: 300,
          height: 300,
          child: MobileScanner(
            controller: _scannerController!,
            onDetect: (capture) {
              final barcode = capture.barcodes.first;
              if (barcode.rawValue != null) {
                setState(() {
                  _controller.text = barcode.rawValue!;
                  _scanning = false;
                });
                Navigator.of(context).pop();
              }
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _scanning = false;
                _scannerController?.dispose();
                _scannerController = null;
              });
              Navigator.of(context).pop();
            },
            child: const Text('Annuler'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _controller,
          decoration: const InputDecoration(
            labelText: 'Nom ou code-barres de l\'ingrédient',
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            ElevatedButton.icon(
              onPressed: _scanning ? null : _startScan,
              icon: const Icon(Icons.qr_code_scanner),
              label: const Text('Scanner'),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  widget.onAdd(_controller.text);
                  _controller.clear();
                }
              },
              child: const Text('Ajouter'),
            ),
          ],
        ),
        if (_scanError != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Erreur de scan : $_scanError',
              style: const TextStyle(color: Colors.red),
            ),
          ),
      ],
    );
  }
} 