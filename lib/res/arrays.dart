import 'package:flutter/cupertino.dart';

import '../model/profile.dart';
import '../screen/booking/booking_screen.dart';
import '../screen/chat/chat_screen.dart';
import '../screen/home/home_screen.dart';
import '../screen/profile/profile_screen.dart';

class Arrays {
  final mainScreens = const [
    HomeScreen(),
    BookingScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  final listProfile = [
    Profile(title: 'Personal Information', destination: Container()),
    Profile(title: 'Transaction history', destination: Container()),
    Profile(title: 'Privacy', destination: Container()),
    Profile(title: 'Setting', destination: Container()),
  ];
}