import 'package:provider/provider.dart';
import 'package:todoapis/controller/todo_provider.dart';
import 'package:todoapis/view/addtodo.dart';
import 'package:flutter/cupertino.dart';

class TodoHome extends StatelessWidget {
  const TodoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Todo List'),
        trailing: CupertinoButton(
          child: Icon(CupertinoIcons.add),
          onPressed: () {
            Navigator.of(context).push(
              CupertinoPageRoute(builder: (context) => AddPage()),
            );
          },
        ),
      ),
      child: SafeArea(
        child: Consumer<TodoProvider>(
          builder: (context, value, child) {
            return CupertinoScrollbar(
              child: ListView.builder(
                itemCount: value.items.length,
                itemBuilder: (context, index) {
                  final todoModel = value.items[index];
                  return CupertinoListTile(
                    leading: Text('${index + 1}'),
                    title: Text(todoModel.title),
                    subtitle: Text(todoModel.description),
                    trailing: CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: const Icon(CupertinoIcons.ellipsis),
                      onPressed: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) => CupertinoActionSheet(
                            actions: [
                              CupertinoActionSheetAction(
                                child: const Text('Edit'),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    CupertinoPageRoute(
                                      builder: (context) => AddPage(
                                        todoModel: todoModel,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              CupertinoActionSheetAction(
                                child: const Text('Delete'),
                                onPressed: () {
                                  Provider.of<TodoProvider>(context,
                                          listen: false)
                                      .deleteById(todoModel.id!);
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                            cancelButton: CupertinoActionSheetAction(
                              child: const Text('Cancel'),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
