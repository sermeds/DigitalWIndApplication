import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker(
      {super.key, required this.textEditingController, required this.text});
  final TextEditingController textEditingController;
  final String text;

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime selectedDate = DateTime.now();

  late TextEditingController textEditingController;
  late String text;

  @override
  void initState() {
    super.initState();

    textEditingController = widget.textEditingController;
    text = widget.text;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).colorScheme.onPrimary,
              surface: Theme.of(context).colorScheme.primary,
              onPrimary: Theme.of(context).colorScheme.primary,
              onSurface: Theme.of(context).colorScheme.tertiary,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.tertiary,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(
        () {
          selectedDate = picked;
        },
      );
    }
    textEditingController.text = DateFormat('dd/MM/yyyy').format(selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.onPrimary),
        ),
        labelText: text,
        labelStyle: Theme.of(context).textTheme.labelMedium,
      ),
      onTap: () {
        _selectDate(context);
      },
      readOnly: true,
      controller: textEditingController,
      keyboardType: TextInputType.datetime,
      style: Theme.of(context).textTheme.labelMedium,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Введите дату!';
        }
        return null;
      },
    );
  }
}
