import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:kanbo/screen/search/search_screen.dart';
import 'package:kanbo/utils/app_route.dart';
import 'package:sizer/sizer.dart';

class HeaderHomeSection extends StatelessWidget {
  const HeaderHomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: 180,
            color: context.resources.color.colorPrimary,
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Positioned(
                    bottom: 60,
                    child: SvgPicture.asset(context.resources.asset.ellipse)),
              ],
            ),
          ),
          Positioned(
            right: 0,
            bottom: 17,
            child: SizedBox(
                width: 200,
                height: 100,
                child: SvgPicture.asset(
                    context.resources.asset.backgroundOffice2)),
          ),
          Positioned(
              left: 0,
              bottom: 17,
              child: SvgPicture.asset(context.resources.asset.ellipse2)),
          Positioned(
              left: 16,
              top: 30,
              child: Text(
                'Let\'s find your place\nfor work',
                style: TextStyle(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.w500),
              )),
          Positioned(
            bottom: 0,
            left: 16,
            right: 16,
            child: SizedBox(
              width: size.width,
              height: 50,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: InkWell(
                  onTap: () => AppRoute.to(const SearchScreen()),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Icon(
                          Icons.search,
                          color: context.resources.color.textColor,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text('Search for building'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
