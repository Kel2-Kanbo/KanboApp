import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kanbo/export_package.dart';

class DateForm extends StatefulWidget {
  final Function(DateTimeRange)? onChangeDate;
  const DateForm({Key? key, this.onChangeDate}) : super(key: key);

  @override
  State<DateForm> createState() => _DateFormState();
}

class _DateFormState extends State<DateForm> {
  DateTimeRange? _selectedDateRange;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Date',
            style: TextStyle(
              fontSize: 16.sp,
              color: context.resources.color.textBoldColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 8),
            child: GestureDetector(
              onTap: () => _showDateRangePicker(),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    color: context.resources.color.white2,
                    borderRadius: const BorderRadius.all(Radius.circular(4))),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.calendar_month),
                      Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(getDateRangeString()),
                          )),
                      VerticalDivider(
                        thickness: 2,
                        color: context.resources.color.grey2,
                      ),
                      Text(getDurationDate())
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _showDateRangePicker() async {
    final dateTimeNow = DateTime.now();
    final DateTimeRange? result = await showDateRangePicker(
      context: context,
      firstDate: dateTimeNow,
      lastDate: DateTime(dateTimeNow.year + 1, dateTimeNow.month),
      currentDate: dateTimeNow,
      saveText: 'Save',
    );

    if (result != null) {
      setState(() {
        _selectedDateRange = result;
        if (widget.onChangeDate != null) {
          widget.onChangeDate!(result);
        }
      });
    }
  }

  String getDateRangeString() {
    final dateFormat = DateFormat('EEEE, dd MMMM yyyy');
    var result = 'Click here to choose date';
    if (_selectedDateRange != null) {
      final DateTime startDate = _selectedDateRange!.start;
      final DateTime endDate = _selectedDateRange!.end;
      final Duration duration = _selectedDateRange!.duration;
      final String start = dateFormat.format(startDate);
      final String end = dateFormat.format(endDate);
      setState(() {
        result = duration.inDays == 0 ? start : '$start - $end';
      });
    }
    return result;
  }

  String getDurationDate() {
    var result = '- days';
    if (_selectedDateRange != null) {
      final Duration duration = _selectedDateRange!.duration;
      setState(() {
        result = '${duration.inDays + 1} days';
      });
    }
    return result;
  }
}
