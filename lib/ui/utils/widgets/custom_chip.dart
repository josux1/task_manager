import 'package:flutter/material.dart';
import 'package:tsk_mg/ui/utils/utils.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({super.key, required this.title, required this.enebled});
  final String title;
  final int enebled;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        color: enebled == 1
            ? c.primary.withOpacity(0.2)
            : Colors.grey.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child:
              Text(title, style: enebled == 1 ? t.textPrimary : t.textDisabled),
        ),
      ),
    );
  }
}
