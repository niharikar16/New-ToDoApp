import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';

class Monthly extends StatefulWidget {
  const Monthly({Key? key}) : super(key: key);

  @override
  State<Monthly> createState() => _MonthlyState();
}

class _MonthlyState extends State<Monthly> {
  //-----------------------------------array of months----------------------------------------------------------
  DateTime today = new DateTime.now();
  var MonthNames = [
    'Jan',
    'Feb',
    ' Mar',
    'Apr',
    'May',
    'June',
    'July',
    'Aug',
    'Sept',
    'Oct',
    'Nov',
    'Dec'
  ];

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            //------------------------------Calendar---------------------------------------
            TableCalendar(
              rowHeight: 30,
              headerStyle:
                  HeaderStyle(formatButtonVisible: false, titleCentered: true),
              startingDayOfWeek: StartingDayOfWeek.monday,
              // initialCalendarFormat: CalendarFormat.week,
              selectedDayPredicate: (day) => isSameDay(day, today),
              focusedDay: today,
              firstDay: DateTime.utc(2023, 1, 1),
              lastDay: DateTime.utc(2023, 5, 30),
              onDaySelected: _onDaySelected,
              calendarStyle: const CalendarStyle(
                  selectedDecoration: BoxDecoration(
                      color: Color(0xff283048), shape: BoxShape.circle),
                  todayDecoration: BoxDecoration(
                      color: Color(0xff283048), shape: BoxShape.circle),
                  cellMargin: EdgeInsets.all(1)),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Today: ${today.day} ${MonthNames[today.month - 1]} ${today.year}",
                          style: GoogleFonts.fredoka(
                              fontSize: 17, color: Colors.grey.shade500),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
