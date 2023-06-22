import 'package:flutter/material.dart';
import 'package:school/entities/to_do_entity.dart';

import '../../../../components/icon_button_component.dart';
import '../../../../components/spacer_component.dart';

class ItemWidget extends StatelessWidget {
  final ToDoEntity item;
  final Function() onPressed;

  const ItemWidget({
    super.key,
    required this.item,
    required this.onPressed,
  });

  Widget status() {
    final icon = item.isDone == true ? Icons.done_all : Icons.done;
    final color = item.isDone == true ? Colors.green : Colors.grey[400];
    return Icon(icon, color: color);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(children: [
            status(),
            const SpacerComponent(isHorizontal: true),
            Text(
              item.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SpacerComponent(isFull: true),
            IconButtonComponent(
              icon: Icons.arrow_forward_ios,
              onPressed: onPressed,
            )
          ]),
        ),
      ),
    );
  }
}
