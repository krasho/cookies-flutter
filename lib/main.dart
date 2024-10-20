import 'package:flutter/material.dart';
import 'package:utip/services/counter_service.dart';
import 'package:utip/widgets/bill_amount_field.dart';
import 'package:utip/widgets/person_counter.dart';

import 'widgets/tip_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTIP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UTip(),
    );
  }
}

class UTip extends StatefulWidget {
  const UTip({super.key});

  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {
  double _tipPercentage = 0;
  double _billTotal = 100;

  final CounterService _counterService = CounterService();  // Instancia del servicio


  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final style = theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimary, fontWeight: FontWeight.bold);

    // Actualizar el porcentaje de propina en el servicio cuando cambie
    _counterService.setTipPercentage(_tipPercentage);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/cookies_logo_white.png',
                fit: BoxFit.contain,
                height: 32,
              )
            ],
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: theme.colorScheme.inversePrimary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text("Total per Person", style: style),
                    Text("\$${_counterService.totalPerPerson().toStringAsFixed(2)}",
                        style: style.copyWith(
                            color: theme.colorScheme.onPrimary,
                            fontSize: theme.textTheme.displaySmall?.fontSize)),
                  ],
                )),
          ),
          // Form
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: theme.colorScheme.primary,
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  BillAmountField(
                     billAmount: _billTotal.toString(),
                    onChanged: (value) {
                        setState(() {
                          _billTotal = double.tryParse(value) ?? 0;
                          _counterService.setBillTotal(_billTotal);
                        });                      
                    },
                  ),
                  // Split Bill Area
                  PersonCounter(
                    theme: theme,
                    counterService: _counterService,
                    billTotal: _billTotal,
                    tipPercentage: _tipPercentage,
                    onChanged: (newPersonCount) {
                        setState((){});
                    },

                  ),
                
                  // === Tip Section ===
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tip", 
                      style: theme.textTheme.titleMedium,),
                      Text("\$${_counterService.totalTip().toStringAsFixed(2)}", 
                      style: theme.textTheme.titleMedium,)
                
                  ],), 
                
                  //  === Slider Text ===
                  Text('${(_tipPercentage * 100).round()} %'),
                
                  // === Tip Slider ===
                  TipSlider(
                    tipPercentage: _tipPercentage,
                    onChanged: (double value) {
                      setState(() {
                        _tipPercentage = value;
                        _counterService.setTipPercentage(_tipPercentage);
                      });
                    },
                    )
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}


