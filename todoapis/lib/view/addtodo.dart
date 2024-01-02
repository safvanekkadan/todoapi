import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapis/controller/todo_provider.dart';
import 'package:todoapis/view/todohome.dart';

// class AddPage extends StatefulWidget {
//   final todoModel;

//   const AddPage({super.key, this.todoModel});

//   @override
//   State<AddPage> createState() => _AddPageState();
// }

// class _AddPageState extends State<AddPage> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     final todo = widget.todoModel;
//     final todoProvider = Provider.of<TodoProvider>(context, listen: false);

//     if (todo != null) {
//       todoProvider.isEditValueChange(true);
//       final title = todo.title;
//       final descriptio = todo.description;
//       todoProvider.titleController.text = title;
//       todoProvider.DescriptionController.text = descriptio;
//     } else {
//       todoProvider.isEditValueChange(false);
//       todoProvider.titleController.text = '';
//       todoProvider.DescriptionController.text = '';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(Provider.of<TodoProvider>(context).isEdit
//             ? 'Edit Todo'
//             : 'ADD TODO'),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(20),
//         children: [
//           TextField(
//             controller: Provider.of<TodoProvider>(context, listen: false)
//                 .titleController,
//             decoration: const InputDecoration(hintText: 'title'),
//           ),
//           TextField(
//             controller: Provider.of<TodoProvider>(context, listen: false)
//                 .DescriptionController,
//             decoration: const InputDecoration(
//               hintText: 'Description',
//             ),
//             keyboardType: TextInputType.multiline,
//             minLines: 5,
//             maxLines: 8,
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           ElevatedButton(
//             onPressed: () {
//               final todoProvider =
//                   Provider.of<TodoProvider>(context, listen: false);
//               todoProvider.isEdit
//                   ? todoProvider.updateData(widget.todoModel)
//                   : todoProvider.SubmitData();
//               Navigator.of(context).pushReplacement(
//                   MaterialPageRoute(builder: (context) => TodoHome()));
//             },
//             child: Text(
//               Provider.of<TodoProvider>(context).isEdit ? 'Update' : 'Submit',
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

// ... other imports

class AddPage extends StatefulWidget {
  final todoModel;

  const AddPage({super.key, this.todoModel});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  void initState() {
    super.initState();
    final todo = widget.todoModel;
    final todoProvider = Provider.of<TodoProvider>(context, listen: false);

    if (todo != null) {
      todoProvider.isEditValueChange(true);
      final title = todo.title;
      final descriptio = todo.description;
      todoProvider.titleController.text = title;
      todoProvider.DescriptionController.text = descriptio;
    } else {
      todoProvider.isEditValueChange(false);
      todoProvider.titleController.text = '';
      todoProvider.DescriptionController.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(Provider.of<TodoProvider>(context).isEdit
            ? 'Edit Todo'
            : 'Add Todo'),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            CupertinoTextField(
              controller: Provider.of<TodoProvider>(context, listen: false)
                  .titleController,
              placeholder: 'Title',
            ),
            CupertinoTextField(
              controller: Provider.of<TodoProvider>(context, listen: false)
                  .DescriptionController,
              placeholder: 'Description',
              keyboardType: TextInputType.multiline,
              minLines: 5,
              maxLines: 8,
            ),
            SizedBox(height: 20),
            CupertinoButton.filled(
              onPressed: () {
                final todoProvider =
                    Provider.of<TodoProvider>(context, listen: false);
                todoProvider.isEdit
                    ? todoProvider.updateData(widget.todoModel)
                    : todoProvider.SubmitData();
                Navigator.of(context).pushReplacement(
                  CupertinoPageRoute(builder: (context) => TodoHome()),
                );
              },
              child: Text(
                Provider.of<TodoProvider>(context).isEdit ? 'Update' : 'Submit',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
