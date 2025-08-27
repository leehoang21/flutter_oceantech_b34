import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_oceantech/models/todolist_model.dart';
import 'package:flutter_oceantech/presentation/todolist/bloc/todolist_cubit.dart';
import 'package:flutter_oceantech/presentation/widgets/card_custom.dart';

class EditDialog extends StatefulWidget {
  const EditDialog({
    super.key,
    required this.onPressed,
    required this.title,
    this.model,
  });
  final Function(String title, String content) onPressed;
  final String title;
  final TodolistModel? model;

  @override
  State<EditDialog> createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  final TextEditingController _controller = TextEditingController();

  final TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    if (widget.model != null) {
      _controller.text = widget.model!.title;
      _contentController.text = widget.model!.content;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(hintText: 'Enter item title'),
            controller: _controller,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'Enter item content'),
            controller: _contentController,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            widget.onPressed(_controller.text, _contentController.text);
            Navigator.of(context).pop();
          },
          child: Text(widget.title.toUpperCase()),
        ),
      ],
    );
  }
}

class TodoListItem extends StatelessWidget {
  const TodoListItem({
    super.key,
    required this.model,
  });
  final TodolistModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: CardCustom(
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(model.content),
              ],
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.edit),
              color: Colors.blue,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext _) {
                    return EditDialog(
                      model: model,
                      onPressed: (title, content) {
                        context.read<TodoListCubit>().edit(model.copyWith(
                              title: title,
                              content: content,
                            ));
                      },
                      title: 'Edit',
                    );
                  },
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                context.read<TodoListCubit>().delete(model.uid);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TodoList"),
        centerTitle: true,
      ),
      body: BlocBuilder<TodoListCubit, TodoListState>(
        builder: (context, state) {
          if (state is TodoListInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: ListView.builder(
              itemCount: state.list.length,
              itemBuilder: (BuildContext context, int index) {
                return TodoListItem(
                  model: state.list[index],
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext _) {
              return EditDialog(
                onPressed: (title, content) {
                  context.read<TodoListCubit>().add(title, content);
                },
                title: 'Add',
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
