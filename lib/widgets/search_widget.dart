import 'package:flutter/material.dart';
import 'package:kanbo/utils/app_context_ext.dart';

class SearchWidget extends StatelessWidget {
  final String title;
  final Function()? onClick;
  const SearchWidget({Key? key, this.title = "Search", this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = context.mediaSize;
    return SizedBox(
      width: size.width,
      height: 50,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          onTap: onClick,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Icon(
                  Icons.search,
                  color: context.resources.color.textColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(title),
              )
            ],
          ),
        ),
      ),
    );
  }
}
