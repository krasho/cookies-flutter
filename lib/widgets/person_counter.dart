import 'package:flutter/material.dart';
import 'package:utip/services/counter_service.dart';

class PersonCounter extends StatefulWidget {
  const PersonCounter({
    super.key,
    required this.theme    
  });

  final ThemeData theme;  
  @override
  _PersonCounterState createState() => _PersonCounterState();
}

class _PersonCounterState extends State<PersonCounter> {
  final CounterService _counterService = CounterService();  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Split",
          style: widget.theme.textTheme.titleMedium,
        ),
        Row(
          children: [
            IconButton(
              color: widget.theme.colorScheme.primary,
              onPressed: () {
                setState(() {
                  _counterService.decrement();
                });
              },
              icon: const Icon(Icons.remove),
            ),
            Text(
              "${_counterService.personCount}",
              style: widget.theme.textTheme.titleMedium,
            ),
            IconButton(
              color: widget.theme.colorScheme.primary,
              onPressed: () {
                setState(() {
                  _counterService.increment();
                });
              },
              icon: const Icon(Icons.add),
            ),
          ],
        )
      ],
    );
  }
}
