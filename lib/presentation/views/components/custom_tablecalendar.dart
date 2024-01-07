// import 'package:flutter/material.dart';
// import 'package:four_points/core/statemanagement/hotel_availability.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:table_calendar/table_calendar.dart';

// import '../enums/availability.dart';
// import 'constants.dart';

// // ignore: must_be_immutable
// class MyCalendarWidget extends StatefulWidget {
//   MyCalendarWidget(
//       {Key? key,
//       this.selectedDay,
//       this.focusedDay,
//       this.calendarFormat,
//       this.selectedDayPredicate,
//       this.onPageChanged,
//       this.onDaySelected,
//       this.defaultDayBuilder,
//       this.dayOfWeekBuilder,
//       this.rangeEndDay,
//       this.rangeStartDay,
//       this.firstDay,
//       this.lastDay,
//       this.onDayLongPressed,
//       this.onRangeSelected,
//       this.formatChanged})
//       : super(key: key);
//   DateTime? selectedDay;
//   DateTime? focusedDay;
//   final void Function(CalendarFormat)? formatChanged;
//   final bool Function(DateTime)? selectedDayPredicate;
//   final void Function(DateTime, DateTime)? onDaySelected;
//   void Function(DateTime?, DateTime?, DateTime)? onRangeSelected;
//   final void Function(DateTime)? onPageChanged;
//   final Widget? Function(BuildContext, DateTime, DateTime)? defaultDayBuilder;
//   final Widget? Function(BuildContext, DateTime)? dayOfWeekBuilder;
//   void Function(DateTime, DateTime)? onDayLongPressed;
//   DateTime? firstDay, rangeStartDay, rangeEndDay;
//   DateTime? lastDay;
//   CalendarFormat? calendarFormat;
//   @override
//   State<MyCalendarWidget> createState() => _MyCalendarWidgetState();
// }

// //! TODO: WORK ON THE LISTS FOR THE DEFAULT BUILDERS
// class _MyCalendarWidgetState extends State<MyCalendarWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return TableCalendar(
//       firstDay: widget.firstDay ?? DateTime.utc(2020),
//       lastDay: widget.lastDay ?? DateTime.utc(2024, 3, 14),
//       rowHeight: 60,
//       focusedDay: widget.focusedDay ?? widget.selectedDay!,
//       calendarFormat: widget.calendarFormat ?? CalendarFormat.month,
//       rangeStartDay: widget.rangeStartDay,
//       rangeEndDay: widget.rangeEndDay,
//       onRangeSelected: widget.onRangeSelected,
//       onDayLongPressed: widget.onDayLongPressed,
//       headerStyle: HeaderStyle(
//           titleCentered: true,
//           formatButtonVisible: false,
//           formatButtonShowsNext: false,
//           leftChevronIcon: Image.asset(
//             "assets/icons/icon_back.png",
//             height: 12,
//             width: 12,
//           ),
//           rightChevronIcon: Image.asset(
//             "assets/icons/icon_arrow_right.png",
//             height: 12,
//             width: 12,
//           ),
//           leftChevronVisible: true,
//           headerMargin: const EdgeInsets.symmetric(vertical: 10),
//           rightChevronVisible: true,
//           titleTextStyle:
//               const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
//       onFormatChanged: widget.formatChanged,
//       selectedDayPredicate: widget.selectedDayPredicate,
//       onDaySelected: widget.onDaySelected,
//       onPageChanged: widget.onPageChanged,
//       daysOfWeekStyle: DaysOfWeekStyle(
//         dowTextFormatter: (date, locale) =>
//             DateFormat.E(locale).format(date)[0],
//       ),
//       calendarStyle: CalendarStyle(
//           // rangeHighlightScale: 4,
//           rangeHighlightColor: Colors.transparent,
//           // rangeEndDecoration: const BoxDecoration(
//           //     // border: Border.all(
//           //     //     color: const Color.fromRGBO(217, 217, 217, 0.6), width: 2),
//           //     // color: Constants.primaryDeepBlue,
//           //     // borderRadius: const BorderRadius.only(
//           //     //     bottomRight: Radius.circular(10),
//           //     //     topRight: Radius.circular(10),
//           //     //     topLeft: Radius.circular(0),
//           //     //     bottomLeft: Radius.circular(0)),
//           //     ),
//           // rangeStartDecoration: const BoxDecoration(
//           //     // border: Border.all(
//           //     //     color: const Color.fromRGBO(217, 217, 217, 0.6), width: 2),
//           //     // color: Constants.primaryDeepBlue,
//           //     // borderRadius: const BorderRadius.only(
//           //     //     bottomLeft: Radius.circular(10),
//           //     //     topLeft: Radius.circular(10),
//           //     //     topRight: Radius.circular(0),
//           //     //     bottomRight: Radius.circular(0)),
//           //     ),
//           // withinRangeDecoration: BoxDecoration(
//           //   border: Border.all(
//           //       color: const Color.fromRGBO(217, 217, 217, 0.6), width: 2),
//           //   color: const Color(0xFFD3E2EE),
//           // ),
//           isTodayHighlighted: true,
//           selectedDecoration: BoxDecoration(
//             border: Border.all(
//               color: Constants.primaryDeepBlue,
//               width: 2,
//             ),
//             borderRadius: BorderRadius.circular(5),
//             color: Colors.transparent,
//           ),
//           selectedTextStyle: const TextStyle(color: Constants.primaryGray3),
//           todayDecoration: BoxDecoration(
//             border: Border.all(
//               color: Constants.primaryGreen,
//               width: 2,
//             ),
//             borderRadius: BorderRadius.circular(5),
//             color: Colors.transparent,
//           ),
//           tableBorder: const TableBorder(),
//           cellMargin: const EdgeInsets.symmetric(horizontal: 1, vertical: 10)),
//       calendarBuilders: CalendarBuilders(
//         rangeStartBuilder: (context, day, focusedDay) {
//           return Center(
//             child: Container(
//               height: 50,
//               width: 50,
//               margin: const EdgeInsets.symmetric(vertical: 5),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Constants.primaryDeepBlue,
//                   width: 2,
//                 ),
//                 borderRadius:
//                     const BorderRadius.horizontal(left: Radius.circular(22)),
//                 color: Constants.primaryDeepBlue,
//               ),
//               child: Center(
//                 child: Text(
//                   day.day.toString(),
//                   style: const TextStyle(color: Constants.prmaryWhite),
//                 ),
//               ),
//             ),
//           );
//         },
//         withinRangeBuilder: (context, day, focusedDay) {
//           return Center(
//             child: Container(
//               height: 50,
//               width: 50,
//               margin: const EdgeInsets.symmetric(vertical: 5),
//               decoration: BoxDecoration(
//                 border: Border.all(color: const Color(0xFFD3E2EE), width: 2),
//                 color: const Color(0xFFD3E2EE),
//               ),
//               child: Center(
//                 child: Text(
//                   day.day.toString(),
//                   style: const TextStyle(color: Constants.primaryBlack),
//                 ),
//               ),
//             ),
//           );
//         },
//         rangeEndBuilder: (context, day, focusedDay) {
//           return Center(
//             child: Container(
//               height: 50,
//               width: 50,
//               margin: const EdgeInsets.symmetric(vertical: 5),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Constants.primaryDeepBlue,
//                   width: 2,
//                 ),
//                 borderRadius:
//                     const BorderRadius.horizontal(right: Radius.circular(22)),
//                 color: Constants.primaryDeepBlue,
//               ),
//               child: Center(
//                 child: Text(
//                   day.day.toString(),
//                   style: const TextStyle(color: Constants.prmaryWhite),
//                 ),
//               ),
//             ),
//           );
//         },
//         selectedBuilder: (context, day, focusedDay) {
//           if (day == widget.rangeStartDay) {
//             return Center(
//               child: Container(
//                 height: 50,
//                 width: 50,
//                 margin: const EdgeInsets.symmetric(vertical: 5),
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Constants.primaryDeepBlue,
//                     width: 2,
//                   ),
//                   borderRadius:
//                       const BorderRadius.horizontal(left: Radius.circular(22)),
//                   color: Constants.primaryDeepBlue,
//                 ),
//                 child: Center(
//                   child: Text(
//                     day.day.toString(),
//                     style: const TextStyle(color: Constants.prmaryWhite),
//                   ),
//                 ),
//               ),
//             );
//           }
//           return Center(
//             child: Container(
//               height: 50,
//               width: 50,
//               margin: const EdgeInsets.symmetric(vertical: 5),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Constants.primaryDeepBlue,
//                   width: 2,
//                 ),
//                 borderRadius: BorderRadius.circular(5),
//                 color: Colors.transparent,
//               ),
//               child: Center(
//                 child: Text(
//                   day.day.toString(),
//                   style: const TextStyle(color: Constants.primaryGray3),
//                 ),
//               ),
//             ),
//           );
//         },
//         todayBuilder: (context, day, focusedDay) {
//           return Center(
//             child: Container(
//               height: 50,
//               width: 50,
//               margin: const EdgeInsets.symmetric(vertical: 5),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Constants.primaryGreen,
//                   width: 2,
//                 ),
//                 borderRadius: BorderRadius.circular(5),
//                 color: Colors.transparent,
//               ),
//               child: Center(
//                 child: Text(
//                   day.day.toString(),
//                   style: const TextStyle(color: Constants.primaryGray3),
//                 ),
//               ),
//             ),
//           );
//         },
//         defaultBuilder: widget.defaultDayBuilder ??
//             (context, day, focusedDay) {
//               //!booked days
//               if (context
//                   .watch<HotelAvailabilityState>()
//                   .schedule[Availability.Booked]!
//                   .contains(day)) {
//                 return Center(
//                   child: Container(
//                     height: 50,
//                     width: 50,
//                     margin: const EdgeInsets.symmetric(vertical: 5),
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                           color: const Color.fromRGBO(217, 217, 217, 0.6),
//                           width: 2),
//                       color: Colors.transparent,
//                     ),
//                     child: Center(
//                       child: Text(
//                         day.day.toString(),
//                         style: const TextStyle(color: Constants.primaryRed),
//                       ),
//                     ),
//                   ),
//                 );
//               }
//               //!Selected Days in between
//               if (context
//                   .read<HotelAvailabilityState>()
//                   .schedule[Availability.Selected]!
//                   .contains(day)) {
//                 return Center(
//                   child: Container(
//                     height: 50,
//                     width: 50,
//                     margin: const EdgeInsets.symmetric(vertical: 5),
//                     decoration: BoxDecoration(
//                       border:
//                           Border.all(color: const Color(0xFFD3E2EE), width: 2),
//                       color: const Color(0xFFD3E2EE),
//                     ),
//                     child: Center(
//                       child: Text(
//                         day.day.toString(),
//                         style: const TextStyle(color: Constants.primaryBlack),
//                       ),
//                     ),
//                   ),
//                 );
//               }
//               //     //! Start of selected days

//               // if (context.watch<HotelAvailabilityState>().firstDay == day) {
//               //   return Center(
//               //     child: Container(
//               //       height: 50,
//               //       width: 50,
//               //       margin: const EdgeInsets.symmetric(vertical: 5),
//               //       decoration: BoxDecoration(
//               //         borderRadius: const BorderRadius.only(
//               //             bottomLeft: Radius.circular(15),
//               //             topLeft: Radius.circular(15),
//               //             topRight: Radius.circular(0),
//               //             bottomRight: Radius.circular(0)),
//               //         border: Border.all(
//               //             color: Constants.primaryDeepBlue, width: 2),
//               //         color: Constants.primaryDeepBlue,
//               //       ),
//               //       child: Center(
//               //         child: Text(
//               //           day.day.toString(),
//               //           style: const TextStyle(color: Constants.prmaryWhite),
//               //         ),
//               //       ),
//               //     ),
//               //   );
//               // }
//               // //! End of Selected Days
//               // if (context.watch<HotelAvailabilityState>().lastDay == day) {
//               //   return Center(
//               //     child: Container(
//               //       height: 50,
//               //       width: 50,
//               //       margin: const EdgeInsets.symmetric(vertical: 5),
//               //       decoration: BoxDecoration(
//               //         borderRadius: const BorderRadius.only(
//               //             bottomRight: Radius.circular(15),
//               //             topRight: Radius.circular(15),
//               //             topLeft: Radius.circular(0),
//               //             bottomLeft: Radius.circular(0)),
//               //         border: Border.all(
//               //             color: Constants.primaryDeepBlue, width: 2),
//               //         color: Constants.primaryDeepBlue,
//               //       ),
//               //       child: Center(
//               //         child: Text(
//               //           day.day.toString(),
//               //           style: const TextStyle(color: Constants.prmaryWhite),
//               //         ),
//               //       ),
//               //     ),
//               //   );
//               // }

//               return Center(
//                 child: Container(
//                   height: 50,
//                   width: 50,
//                   margin: const EdgeInsets.symmetric(vertical: 5),
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                         color: Constants.primaryGray2.withOpacity(0.6),
//                         width: 2),
//                     color: Colors.transparent,
//                   ),
//                   child: Center(
//                     child: Text(
//                       day.day.toString(),
//                       style: const TextStyle(color: Constants.primaryGray3),
//                     ),
//                   ),
//                 ),
//               );
//             },
//         dowBuilder: widget.dayOfWeekBuilder ??
//             (context, day) {
//               // if (day.weekday == DateTime.sunday) {
//               //   final text = DateFormat.E().format(day);
//               //   return Center(
//               //     child: Text(
//               //       text,
//               //       style: const TextStyle(
//               //           color: Colors.red, fontWeight: FontWeight.normal),
//               //     ),
//               //   );
//               // }
//               var text = DateFormat.E().format(day);
//               return Center(
//                 child: Text(
//                   text,
//                   style: const TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.normal),
//                 ),
//               );
//             },
//       ),
//     );
//   }
// }
