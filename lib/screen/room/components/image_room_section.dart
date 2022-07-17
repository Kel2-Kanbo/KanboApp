import 'package:flutter/material.dart';
import 'package:kanbo/export_package.dart';

class ImageRoomSection extends StatefulWidget {
  final List<String> listImages;
  const ImageRoomSection({Key? key, required this.listImages})
      : super(key: key);

  @override
  State<ImageRoomSection> createState() => _ImageRoomSectionState();
}

class _ImageRoomSectionState extends State<ImageRoomSection> {
  int page = 0;
  @override
  Widget build(BuildContext context) {
    final Size size = context.mediaSize;
    final List<String> listImage = widget.listImages;
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
