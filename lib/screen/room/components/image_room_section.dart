import 'package:flutter/material.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:sizer/sizer.dart';

class ImageRoomSection extends StatefulWidget {
  const ImageRoomSection({Key? key}) : super(key: key);

  @override
  State<ImageRoomSection> createState() => _ImageRoomSectionState();
}

class _ImageRoomSectionState extends State<ImageRoomSection> {
  var listImage = [
    'https://images.unsplash.com/photo-1572025442811-aa5146a780fb',
    'https://images.unsplash.com/photo-1479839672679-a46483c0e7c8'
  ];
  int page = 0;
  @override
  Widget build(BuildContext context) {
    Size size = context.mediaSize;
    return SizedBox(
      width: size.width,
      height: 215,
      child: Stack(
        children: [
          PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listImage.length,
              onPageChanged: (index) => setState(() => page = index),
              itemBuilder: (context, index) => SizedBox(
                    width: size.width,
                    child: Image.network(
                      listImage[index],
                      fit: BoxFit.fill,
                    ),
                  )),
          Positioned(
              bottom: 8,
              right: 16,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                padding: const EdgeInsets.all(6),
                child: Text(
                  '${page + 1}/${listImage.length}',
                  style: TextStyle(fontSize: 10.sp),
                ),
              ))
        ],
      ),
    );
  }
}
