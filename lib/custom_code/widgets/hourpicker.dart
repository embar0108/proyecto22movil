// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!

class HourSelectorWidget extends StatefulWidget {
  final Function(TimeOfDay)? onHourSelected;

  const HourSelectorWidget({Key? key, this.onHourSelected}) : super(key: key);

  @override
  _HourSelectorWidgetState createState() => _HourSelectorWidgetState();
}

class _HourSelectorWidgetState extends State<HourSelectorWidget> {
  TimeOfDay? _selectedHour;

  Future<void> _selectHour(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedHour ?? TimeOfDay.now(),
    );

    if (picked != null && picked != _selectedHour) {
      setState(() {
        _selectedHour = picked;
      });

      if (widget.onHourSelected != null) {
        widget.onHourSelected!(picked);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectHour(context),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _selectedHour != null
                  ? _selectedHour!.format(context)
                  : 'Select Hour',
              style: TextStyle(fontSize: 16),
            ),
            Icon(Icons.access_time),
          ],
        ),
      ),
    );
  }
}
