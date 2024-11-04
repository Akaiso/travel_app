// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../utils/font.dart';
//
// class CurrencyConverter extends StatefulWidget {
//   const CurrencyConverter({super.key});
//
//   @override
//   State<CurrencyConverter> createState() => _CurrencyConverterState();
// }
//
// class _CurrencyConverterState extends State<CurrencyConverter> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Currency Converter",
//           style: kBoldNormal(),
//         ),
//         centerTitle: true,
//       ),
//       body: const Column(),
//     ));
//   }
// }

import 'package:flutter/material.dart';

import '../utils/font.dart';

class CurrencyConverterScreen extends StatefulWidget {
  const CurrencyConverterScreen({super.key});

  @override
  CurrencyConverterScreenState createState() => CurrencyConverterScreenState();
}

class CurrencyConverterScreenState extends State<CurrencyConverterScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _amountController = TextEditingController();
  String _fromCurrency = 'USD';
  String _toCurrency = 'EUR';
  String _result = "";
  bool _isLoading = false;

  // Animation Controller
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _convertCurrency() {
    setState(() {
      _isLoading = true;
      _animationController.reset();
      _animationController.forward();
    });

    // Mock conversion for illustration
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _result = (_fromCurrency == 'USD' && _toCurrency == 'EUR')
            ? (double.parse(_amountController.text) * 0.85).toStringAsFixed(2)
            : "Invalid";
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Currency Converter', style: kBoldNormal()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter amount to convert',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton<String>(
                  value: _fromCurrency,
                  items: <String>['USD', 'EUR', 'GBP'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _fromCurrency = value!;
                    });
                  },
                ),
                const SizedBox(width: 20),
                const Icon(Icons.arrow_forward, size: 24, color: Colors.blue),
                const SizedBox(width: 20),
                DropdownButton<String>(
                  value: _toCurrency,
                  items: <String>['USD', 'EUR', 'GBP'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _toCurrency = value!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : _convertCurrency,
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Convert'),
            ),
            const SizedBox(height: 20),
            FadeTransition(
              opacity: _animationController,
              child: Text(
                _result.isNotEmpty
                    ? 'Converted Amount: $_result $_toCurrency'
                    : '',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
