
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pick_park/app/app_pref.dart';
import 'package:pick_park/presentations/payment_screens/payment1.dart';
import 'package:pick_park/shared/components/component.dart';
import 'package:pick_park/shared/styles/colors.dart';
import 'package:table_calendar/table_calendar.dart';
import '../payment_screens/payment2.dart';
import '../resources/string_manager.dart';
import '../resources/styles_manager.dart';

class booking_details extends StatefulWidget {
  const booking_details({Key? key}) : super(key: key);

  @override
  State<booking_details> createState() => _booking_detailsState();
}

class _booking_detailsState extends State<booking_details> {
   double ?price;
  Future<void> initAppServices() async {
   PriceCache priceCache = PriceCache();
   await priceCache.loadPrice();
   price = await  priceCache.price!;
  }
  // late Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  double current_value = 0;

  @override
  Widget build(BuildContext context) {
    final format2 = DateFormat("HH:mm");
    final format3 = DateFormat("HH:mm");
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          AppStrings.bookingDetails.tr(),
          style: getBoldStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
        child: Column(
          children: [
            TableCalendar(
              focusedDay: selectedDay,
              firstDay: DateTime(1990),
              lastDay: DateTime(2050),
              calendarFormat: format,
              onFormatChanged: (CalendarFormat _format) {
                setState(() {
                  format = _format;
                });
              },
              startingDayOfWeek: StartingDayOfWeek.sunday,
              daysOfWeekVisible: true,
              //Day Changed
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                setState(() {
                  selectedDay = selectDay;
                  focusedDay = focusDay;
                });
                print(focusedDay);
              },
              selectedDayPredicate: (DateTime date) {
                return isSameDay(selectedDay, date);
              },
              //To style the Calendar
              calendarStyle: CalendarStyle(
                isTodayHighlighted: false,
                selectedDecoration: BoxDecoration(
                  color: defaultColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                selectedTextStyle: TextStyle(color: Colors.white),
                todayDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                defaultDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                weekendDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: true,
                titleCentered: true,
                formatButtonShowsNext: false,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                formatButtonTextStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            // Slider(value: current_value, onChanged: ( value) { setState(() {
            //   current_value=value;
            // }); },
            //   label:current_value.toString() +" "+ "hr"  ,
            //   min: 0,
            //   divisions: 20,
            //   max: 20,
            //   activeColor: defaultColor,
            // ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        AppStrings.firstTime.tr(),
                        style:
                            getRegularStyle(color: Colors.black, fontSize: 15),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          height: 25,
                          child: DateTimeField(
                            format: format2,
                            onShowPicker: (context, currentValue) async {
                              final time = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.fromDateTime(
                                    currentValue ?? DateTime.now()),
                              );
                              if (time != null) {
                                final dateTime = DateTime(
                                    DateTime.now().year,
                                    DateTime.now().month,
                                    DateTime.now().day,
                                    time.hour,
                                    time.minute);
                                return dateTime;
                              } else {
                                return currentValue;
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        AppStrings.lastTime.tr(),
                        style:
                            getRegularStyle(color: Colors.black, fontSize: 15),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          height: 25,
                          child: DateTimeField(
                            format: format3,
                            decoration: InputDecoration(),
                            onShowPicker: (context, currentValue) async {
                              final time = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.fromDateTime(
                                    currentValue ?? DateTime.now()),
                              );
                              if (time != null) {
                                final dateTime = DateTime(
                                    DateTime.now().year,
                                    DateTime.now().month,
                                    DateTime.now().day,
                                    time.hour,
                                    time.minute);
                                return dateTime;
                              } else {
                                return currentValue;
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Text(
                    AppStrings.price.tr(),
                    style: getRegularStyle(color: Colors.black, fontSize: 15),
                  ),
                  Spacer(),
                  Text(
                    "$price",
                    style:
                        getRegularStyle(color: Color(0xff4B4EB0), fontSize: 15),
                  )
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
              child: defaultButton(
                  function: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddPaymentCard()));
                  },
                  text: AppStrings.containue.tr(),
                  color: Color(0xff4B4EB0)),
            )
          ],
        ),
      ),
    );
  }
}
