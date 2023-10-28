import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_task/main.dart';

class DateInputForm extends StatefulWidget {
  final String headline;
  final String path;
  final String restorationId;
  const DateInputForm(
      {super.key,
      required this.headline,
      required this.path,
      required this.restorationId});

  @override
  State<DateInputForm> createState() => _InputFormState();
}

class _InputFormState extends State<DateInputForm> with RestorationMixin {
  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(2023, 9, 12));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2019),
          lastDate: DateTime(2024),
        );
      },
    );
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final String _dateValue = DateFormat.yMMMd().format(_selectedDate.value);

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      child: Column(children: [
        Row(
          children: [
            Expanded(
                child: Text(
              widget.headline,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ))
          ],
        ),
        const SizedBox(height: 5),
        InkWell(
          child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  border: Border.all(color: borderColor),
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  Image(
                    image: AssetImage(widget.path),
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(_dateValue)
                ],
              )),
          onTap: () => _restorableDatePickerRouteFuture.present(),
        )
      ]),
    );
  }

  @override
  String? get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }
}
