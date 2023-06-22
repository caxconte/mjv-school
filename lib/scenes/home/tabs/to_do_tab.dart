import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/spacer_component.dart';
import '../../../providers/to_do_provider.dart';
import 'components/item_widget.dart';
import 'components/new_item_widget.dart';

class ToDoTab extends StatefulWidget {
  const ToDoTab({
    super.key,
  });

  @override
  State createState() => _ToDoTab();
}

class _ToDoTab extends State<ToDoTab> {
  late ToDoProvider store;

  void handleAdd() {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          contentPadding: const EdgeInsets.all(16),
          children: [
            NewItemWidget(callback: (item) {
              store.toDoList = [...store.toDoList, item];
            }),
          ],
        );
      },
    );
  }

  void handleDelete(int index) {
    // _toDoList.removeAt(index);
    // setState(() {
    //   _toDoList = _toDoList;
    // });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    store = Provider.of<ToDoProvider>(context);

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
            itemCount: store.toDoList.length,
            itemBuilder: (context, index) {
              final item = store.toDoList.elementAt(index);
              return Dismissible(
                key: Key(item.uuid),
                onDismissed: (direction) {
                  if (direction == DismissDirection.startToEnd) {
                    handleDelete(index);
                  }
                },
                child: ItemWidget(
                  item: item,
                  onPressed: () {
                    handleAdd();
                  },
                ),
              );
            },
          ),
        ),
        const SpacerComponent(),
      ],
    );
  }
}
