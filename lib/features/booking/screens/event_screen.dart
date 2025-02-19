import 'package:azman/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../core/generic_widgets/event_booking.dart';

class EventScreen extends StatelessWidget {
   EventScreen({super.key, required this.image, required this.text});
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<CustomColors>()!;
    return EventBooking(appColors: appColors,image:image,text:text);
  }
}

