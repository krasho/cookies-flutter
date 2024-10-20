import 'package:flutter/material.dart';
import 'package:utip/services/counter_service.dart';

class TotalPerPerson extends StatelessWidget {
  const TotalPerPerson({
    super.key,
    required this.theme,
    required this.style,
    required CounterService counterService,
  }) : _counterService = counterService;

  final ThemeData theme;
  final TextStyle style;
  final CounterService _counterService;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
