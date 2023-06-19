import 'package:flutter/material.dart';
import 'package:school/scenes/home/tabs/components/item_widget.dart';

import '../../../components/spacer_component.dart';
import '../../../entities/to_do_entity.dart';

class ToDoTab extends StatefulWidget {
  const ToDoTab({
    super.key,
  });

  @override
  State createState() => _ToDoTab();
}

class _ToDoTab extends State<ToDoTab> {
  late List<ToDoEntity> _toDoList;

  void handleAdd() {
    final item = ToDoEntity(
      uuid: 'teste3',
      title: 'Teste 3',
      initialDate: DateTime.now(),
      finalDate: DateTime.now(),
      isDone: false,
    );

    _toDoList.add(item);

    setState(() {
      _toDoList = _toDoList;
    });
  }

  void handleRemove(int index) {
    _toDoList.removeAt(index);
    setState(() {
      _toDoList = _toDoList;
    });
  }

  @override
  void initState() {
    _toDoList = [
      ToDoEntity(
        uuid: 'teste1',
        title: 'Teste 1',
        initialDate: DateTime.now(),
        finalDate: DateTime.now(),
        isDone: false,
      ),
      ToDoEntity(
        uuid: 'teste2',
        title: 'Teste 2',
        initialDate: DateTime.now(),
        finalDate: DateTime.now(),
        isDone: true,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: handleAdd,
          child: const Text('Adicionar'),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 400,
          child: ListView.builder(
            itemCount: _toDoList.length,
            itemBuilder: (context, index) {
              final item = _toDoList.elementAt(index);
              return Dismissible(
                key: Key(item.uuid),
                onDismissed: (direction) {
                  if (direction == DismissDirection.startToEnd) {
                    handleRemove(index);
                  }
                },
                child: ItemWidget(
                    item: item,
                    onPressed: () {
                      handleAdd();
                    }),
              );
            },
          ),
        ),
        const SpacerComponent(),
      ],
    );
  }
}
