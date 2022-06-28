import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kanbo/screen/booking/active_booking_screen.dart';
import 'package:kanbo/screen/booking/history_booking_screen.dart';
import 'package:kanbo/utils/app_context_ext.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = context.mediaSize;
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: const Text(
              'Booking',
              style: TextStyle(color: Colors.black),
            ),
            bottom: PreferredSize(
              preferredSize: Size(size.width, 40),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  width: size.width,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: context.resources.color.white2),
                  child: TabBar(
                    controller: _tabController,
                    unselectedLabelColor: Colors.black,
                    splashBorderRadius: BorderRadius.circular(50),
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: context.resources.color.colorPrimary),
                    tabs: const [
                      Tab(
                        text: 'Active Booking',
                      ),
                      Tab(
                        text: 'History',
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: TabBarView(
              physics: const BouncingScrollPhysics(),
              controller: _tabController,
              children: const [
                ActiveBookingScreen(),
                HistoryBookingScreen(),
              ]),
        ));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
