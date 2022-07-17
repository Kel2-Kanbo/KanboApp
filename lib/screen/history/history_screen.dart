import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kanbo/export_package.dart';

import 'active_booking_screen.dart';
import 'history_booking_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
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
              'My Order',
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
