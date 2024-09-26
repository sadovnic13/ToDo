import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list/generated/l10n.dart';

import '../../../repositories/repositories.dart';
import '../bloc/add_todo_page_bloc.dart';

///Add Record Page
class AddTodoPageScreen extends StatefulWidget {
  const AddTodoPageScreen({super.key});

  @override
  State<AddTodoPageScreen> createState() => _AddTodoPageScreenState();
}

///Basic state of the Add Record screen
class _AddTodoPageScreenState extends State<AddTodoPageScreen> {
  final AddTodoPageBloc addTodoPageBloc = AddTodoPageBloc(ToDoRepositories());
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final DateTime _date = DateTime.now();
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddTodoPageBloc, AddTodoPageState>(
      bloc: addTodoPageBloc,
      listener: (context, state) {
        if (state is AddTodoPageLoaded) {
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

        // Submit button
        floatingActionButton: ElevatedButton(
          child: Text(
            S.of(context).save,
            style: const TextStyle(fontSize: 20),
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              addTodoPageBloc.add(AddTodo(
                title: _title.text,
                description: _description.text,
                finishDate: _selectedDay ?? _date,
              ));
            }
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
            decoration: InputDecoration(
              labelText: S.of(context).title,
              border: const OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).pleaseEnterText;
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
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: S.of(context).description,
              border: const OutlineInputBorder(),
            ),
            maxLines: 3,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).pleaseEnterText;
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  ///Form for displaying calendar
  Widget _buildCalendar() {
    return TableCalendar(
      headerStyle: const HeaderStyle(formatButtonVisible: false, titleCentered: true),
      firstDay: DateTime.now(),
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
