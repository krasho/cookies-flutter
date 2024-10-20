import 'package:flutter/material.dart';
import 'package:utip/services/counter_service.dart';

class PersonCounter extends StatefulWidget {
  const PersonCounter({
    super.key,
    required this.theme,
    required this.counterService,  // Recibe el servicio
    required this.billTotal,       // Recibe el bill total
    required this.tipPercentage,   // Recibe el tip percentage    
    required this.onChanged,   // Nueva propiedad onChanged
  });

  final ThemeData theme;  
  final CounterService counterService;  // Recibe el servicio completo
  final double billTotal;               // Añadir billTotal
  final double tipPercentage;
  final ValueChanged<int> onChanged;

  @override
  _PersonCounterState createState() => _PersonCounterState();
}

class _PersonCounterState extends State<PersonCounter> {  
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
                  widget.counterService.decrement();
                  widget.counterService.setBillTotal(widget.billTotal);
                  widget.counterService.setTipPercentage(widget.tipPercentage);                  
                  widget.counterService.totalPerPerson();
                  widget.onChanged(widget.counterService.personCount);
                });
              },
              icon: const Icon(Icons.remove),
            ),
            Text(
              "${widget.counterService.personCount}",
              style: widget.theme.textTheme.titleMedium,
            ),
            IconButton(
              color: widget.theme.colorScheme.primary,
              onPressed: () {
                setState(() {
                  widget.counterService.increment();
                  widget.counterService.setBillTotal(widget.billTotal);
                  widget.counterService.setTipPercentage(widget.tipPercentage);                  
                  widget.counterService.totalPerPerson();
                  widget.onChanged(widget.counterService.personCount);
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
