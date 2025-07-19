import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Map Rates;
  const DetailsPage({super.key, required this.Rates});
  
  @override
  Widget build(BuildContext context) {
    List _currencies = Rates.keys.toList();
    List _exchangeRates = Rates.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Currency Exchange Rates',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.indigo.shade900, Colors.indigo.shade300],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: ListView.builder(
            itemBuilder: (_context, _index) {
              String _currency = _currencies[_index].toString();
              String _exchangeRate = _exchangeRates[_index].toString();

              return Card(
                color: Colors.white.withOpacity(0.8),
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.indigo,
                    child: Text(
                      _currency[0], // First letter of the currency
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  title: Text(
                    _currency,
                    style: TextStyle(
                      color: Colors.indigo.shade900,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "Rate: $_exchangeRate",
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              );
            },
            itemCount: _currencies.length,
          ),
        ),
      ),
    );
  }
}