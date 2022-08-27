import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite_practice/bloc/bloc/crud_bloc.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({Key? key}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  bool toggleSwitch = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(8),
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Text(
                'title'.toUpperCase(),
                style: const TextStyle(fontSize: 21),
              ),
              TextFormField(controller: _title),
              Text(
                'description'.toUpperCase(),
                style: const TextStyle(fontSize: 21),
              ),
              TextFormField(controller: _description),
              Text(
                'important'.toUpperCase(),
                style: const TextStyle(fontSize: 21),
              ),
              Switch(
                value: toggleSwitch,
                onChanged: (newVal) {
                  setState(() {
                    toggleSwitch = !toggleSwitch;
                  });
                },
              ),
              BlocBuilder<CrudBloc, CrudState>(
                builder: (context, state) {
                  return ElevatedButton(
                      onPressed: () {
                        if (_title.text.isNotEmpty &&
                            _description.text.isNotEmpty) {
                          context.read<CrudBloc>().add(
                                AddTodo(
                                  title: _title.text,
                                  isImportant: toggleSwitch,
                                  number: 0,
                                  description: _description.text,
                                  createdTime: DateTime.now(),
                                ),
                              );
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            duration: Duration(seconds: 1),
                            content: Text("todo added successfully"),
                          ));
                          context.read<CrudBloc>().add(const FetchTodos());
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                "title and description fields must not be blank"
                                    .toUpperCase()),
                          ));
                        }
                      },
                      child: const Text('Add Todo'));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
