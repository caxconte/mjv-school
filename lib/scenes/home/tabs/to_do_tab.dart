// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import '../../../components/spacer_component.dart';

class ToDoTab extends StatefulWidget {
  final int initialValue;
  const ToDoTab({
    super.key,
    required this.initialValue,
  });

  @override
  State createState() => _ToDoTab();
}

class _ToDoTab extends State<ToDoTab> {
  late int count;

  sum() {
    setState(() {
      count++;
    });
  }

  @override
  void initState() {
    count = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$count'),
        const SpacerComponent(),
        ElevatedButton(
          onPressed: () {
            sum();
            print(count.toString());
          },
          child: const Text('+1'),
        )
      ],
    );
  }
}
