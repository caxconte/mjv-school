import 'package:flutter/material.dart';
import 'package:school/entities/to_do_entity.dart';
import 'package:school/entities/todo_checklist_entity.dart';
import 'package:uuid/uuid.dart';

import '../../../../components/icon_button_component.dart';
import '../../../../components/spacer_component.dart';

class NewItemWidget extends StatefulWidget {
  final void Function(ToDoEntity item) callback;

  const NewItemWidget({
    super.key,
    required this.callback,
  });

  @override
  State<NewItemWidget> createState() => _NewItemWidgetState();
}

enum TypeList {
  lembrete,
  tarefa,
}

class _NewItemWidgetState extends State<NewItemWidget> {
  final _formKey = GlobalKey<FormState>();
  final _formKeyTasks = GlobalKey<FormState>();
  final _titleController = TextEditingController();

  List<TextEditingController> items = [];
  TypeList dropdownValue = TypeList.lembrete;

  Widget defaultCheckItem(TextEditingController controller) {
    return CheckboxListTile(
      title: TextFormField(
        controller: controller,
        decoration:
            const InputDecoration(hintText: 'Digite um nome para a tarefa'),
        validator: (value) {
          return (value == null || value.isEmpty)
              ? 'Por favor, digite um nome'
              : null;
        },
      ),
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: const EdgeInsets.all(0),
      value: false,
      onChanged: null,
    );
  }

  void handleSubmit() {
    final isValido = _formKey.currentState!.validate();
    if (isValido) {
      final item = ToDoEntity(
        uuid: const Uuid().v4(),
        title: _titleController.text,
        initialDate: DateTime.now(),
        finalDate: DateTime.now(),
        content: [],
      );

      bool valid = false;
      if (dropdownValue == TypeList.tarefa) {
        final isTarefasValidas = _formKeyTasks.currentState!.validate();
        if (isTarefasValidas) {
          valid = true;
          for (final value in items) {
            item.content!.add(ToDoChecklistEntity(title: value.text));
          }
        }
      } else {
        valid = true;
      }

      if (valid) {
        widget.callback(item);
        Navigator.pop(context);
      }
    }
  }

  void addItem() {
    if (dropdownValue == TypeList.tarefa) {
      items.add(TextEditingController());
      setState(() {
        items = items;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _titleController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        Row(
          children: [
            const Text('Tipo de lista', style: TextStyle(fontSize: 18)),
            const SpacerComponent(isFull: true),
            DropdownButton(
              value: dropdownValue,
              items: const [
                DropdownMenuItem(
                  value: TypeList.lembrete,
                  child: Text('Lembrete'),
                ),
                DropdownMenuItem(
                  value: TypeList.tarefa,
                  child: Text('Tarefas'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
            ),
          ],
        ),
        TextFormField(
          controller: _titleController,
          decoration: const InputDecoration(hintText: 'Digi um nome'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor, digite um nome.';
            }
            return null;
          },
        ),
        const SpacerComponent(),
        if (dropdownValue == TypeList.tarefa)
          Row(
            children: [
              const Text('Lista: '),
              const SpacerComponent(isFull: true),
              IconButtonComponent(
                onPressed: addItem,
                size: 16,
                icon: Icons.add,
              )
            ],
          ),
        if (dropdownValue == TypeList.tarefa)
          Form(
            key: _formKeyTasks,
            child: Column(children: items.map(defaultCheckItem).toList()),
          ),
        const SpacerComponent(),
        ElevatedButton(
          onPressed: handleSubmit,
          child: const Text('Cadastrar'),
        ),
      ]),
    );
  }
}
