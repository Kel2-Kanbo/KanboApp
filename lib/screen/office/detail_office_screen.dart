import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:kanbo/screen/office/components/header_office_section.dart';
import 'package:kanbo/screen/office/components/location_office_section.dart';
import 'package:kanbo/screen/office/components/room_office_section.dart';
import 'package:kanbo/widgets/recomend_office_section.dart';
import 'package:kanbo/widgets/space_widget.dart';

class DetailOfficeScreen extends StatelessWidget {
  final String text;
  const DetailOfficeScreen({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> listWidget = [
      HeaderOfficeSection(
        text: text,
      ),
      const LocationOfficeSection(),
      RoomOfficeSection(
        text: text,
      ),
      const RecomendOfficeSection(),
      const SpaceWidget(
        space: 5,
      )
    ];
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
                innerBoxIsScrolled ? 'Office $text' : '',
                style: const TextStyle(color: Colors.black),
              ),
              iconTheme: const IconThemeData(color: Colors.black),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  'https://images.unsplash.com/photo-1479839672679-a46483c0e7c8',
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
            itemBuilder: (BuildContext context, int index) => listWidget[index],
            itemCount: listWidget.length,
            separatorBuilder: (BuildContext context, int index) => Container(
              height: 4,
              color: context.resources.color.white2,
            ),
          ),
        ));
  }
}
