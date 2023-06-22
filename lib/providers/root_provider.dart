import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:school/providers/to_do_provider.dart';

class RootProvider {
  static List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider(create: (_) => ToDoProvider()),
    ];
  }
}
