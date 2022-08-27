part of 'crud_bloc.dart';

abstract class CrudEvent extends Equatable {
  const CrudEvent();
}

class AddTodo extends CrudEvent {
  final String title;
  final bool isImportant;
  final int number;
  final String description;
  final DateTime createdTime;

  const AddTodo(
      {required this.title,
      required this.isImportant,
      required this.number,
      required this.description,
      required this.createdTime});

  @override
  List<Object?> get props =>
      [title, isImportant, number, description, createdTime];
}

class UpdateTodo extends CrudEvent {
  final Todo todo;
  const UpdateTodo({required this.todo});
  @override
  List<Object?> get props => [todo];
}

class FetchTodos extends CrudEvent {
  const FetchTodos();

  @override
  List<Object?> get props => [];
}

class FetchSpecificTodo extends CrudEvent {
  final int id;
  const FetchSpecificTodo({required this.id});

  @override
  List<Object?> get props => [id];
}

class DeleteTodo extends CrudEvent {
  final int id;
  const DeleteTodo({required this.id});
  @override
  List<Object?> get props => [id];
}
