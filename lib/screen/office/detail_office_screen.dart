import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kanbo/screen/office/components/header_office_section.dart';
import 'package:kanbo/screen/office/components/location_office_section.dart';
import 'package:kanbo/screen/office/components/room_office_section.dart';
import 'package:kanbo/export_custom_widgets.dart';
import 'package:kanbo/export_package.dart';

import '../../model/office.dart';

class DetailOfficeScreen extends StatelessWidget {
  final Office office;
  const DetailOfficeScreen({Key? key, required this.office}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) => [
            SliverAppBar(
              pinned: true,
              expandedHeight: 200,
              elevation: 0,
              backgroundColor: Colors.white,
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.dark),
              title: Text(
                innerBoxIsScrolled ? office.title : '',
                style: const TextStyle(color: Colors.black),
              ),
              iconTheme: const IconThemeData(color: Colors.black),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  office.image,
                  fit: BoxFit.fill,
                ),
              ),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.share))
              ],
            )
          ],
          body: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) =>
                _getListWidget()[index],
            itemCount: _getListWidget().length,
            separatorBuilder: (BuildContext context, int index) => Container(
              height: 4,
              color: context.resources.color.white2,
            ),
          ),
        ));
  }

  List<Widget> _getListWidget() => [
        HeaderOfficeSection(
          office: office,
        ),
        LocationOfficeSection(
          office: office,
        ),
        RoomOfficeSection(
          title: office.title,
          listRoom: office.listRoom,
        ),
        const RecomendOfficeSection(),
        const SpaceWidget(
          space: 5,
        )
      ];
}
