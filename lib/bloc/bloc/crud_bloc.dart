import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/todo.dart';
import '../../services/database_service.dart';
part 'crud_event.dart';
part 'crud_state.dart';

class CrudBloc extends Bloc<CrudEvent, CrudState> {
  CrudBloc() : super(CrudInitial()) {
    List<Todo> todos = [];
    on<AddTodo>((event, emit) async {
      await DatabaseService.instance.create(
        Todo(
          createdTime: event.createdTime,
          description: event.description,
          isImportant: event.isImportant,
          number: event.number,
          title: event.title,
        ),
      );
    });

    on<UpdateTodo>((event, emit) async {
      await DatabaseService.instance.update(
        todo: event.todo,
      );
    });

    on<FetchTodos>((event, emit) async {
      todos = await DatabaseService.instance.readAllTodos();
      emit(DisplayTodos(todo: todos));
    });

    on<FetchSpecificTodo>((event, emit) async {
      Todo todo = await DatabaseService.instance.readTodo(id: event.id);
      emit(DisplaySpecificTodo(todo: todo));
    });

    on<DeleteTodo>((event, emit) async {
      await DatabaseService.instance.delete(id: event.id);
      add(const FetchTodos());
    });
  }
}
