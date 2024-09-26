import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list/generated/l10n.dart';

import '../../../repositories/repositories.dart';
import '../bloc/edit_todo_page_bloc.dart';

///Record change page
class EditTodoPage extends StatefulWidget {
  const EditTodoPage({super.key});

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

///Basic state of the record change screen
class _EditTodoPageState extends State<EditTodoPage> {
  final EditTodoPageBloc editTodoPageBloc = EditTodoPageBloc(ToDoRepositories());
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final DateTime _date = DateTime.now();
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  ToDo? record;

  ///parsing passed arguments
  ///[_title.text] - title in the record
  ///[_description.text] - description in the record,
  ///[_focusedDay] - displayed day,
  ///[_selectedDay] - selected day.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null, "Route args error");
    record = args as ToDo;

    _title.text = record?.title ?? '';
    _description.text = record?.description ?? '';
    _focusedDay = record!.finishDate;
    _selectedDay = record!.finishDate;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditTodoPageBloc, EditTodoPageState>(
      bloc: editTodoPageBloc,
      listener: (context, state) {
        //Action on completion of loading
        if (state is EditTodoPageLoaded) {
          Navigator.pushNamedAndRemoveUntil(context, '/home_page_screen', (route) => false);
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 40),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth > 600) {
                // Web layout
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildForm(),
                      ),
                      Expanded(
                        child: _buildCalendar(),
                      ),
                    ],
                  ),
                );
              } else {
                // Mobile layout
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      _buildForm(),
                      const SizedBox(height: 20),
                      _buildCalendar(),
                    ],
                  ),
                );
              }
            },
          ),
        ),

        // Submit
        floatingActionButton: BlocBuilder<EditTodoPageBloc, EditTodoPageState>(
          bloc: editTodoPageBloc,
          builder: (context, state) {
            if (state is EditTodoPageLoading) {
              return ElevatedButton(
                onPressed: null,
                child: Text(
                  S.of(context).save,
                  style: const TextStyle(fontSize: 20),
                ),
              );
            }
            return ElevatedButton(
              child: Text(
                S.of(context).save,
                style: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  editTodoPageBloc.add(EditTodo(
                    id: record!.id,
                    title: _title.text,
                    description: _description.text,
                    finishDate: _selectedDay ?? _date,
                  ));
                }
              },
            );
          },
        ),
      ),
    );
  }

  /// Form for entering record values
  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title
          TextFormField(
            controller: _title,
            decoration: const InputDecoration(
              labelText: 'Title',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter text';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),

          // Description
          TextFormField(
            controller: _description,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: 'Description',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter text';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  /// Calendar display form
  Widget _buildCalendar() {
    return TableCalendar(
      headerStyle: const HeaderStyle(formatButtonVisible: false, titleCentered: true),
      firstDay: DateTime.now().isBefore(record!.finishDate) ? DateTime.now() : record!.finishDate,
      rowHeight: 45,
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: _focusedDay,
      calendarFormat: _calendarFormat,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
    );
  }
}
