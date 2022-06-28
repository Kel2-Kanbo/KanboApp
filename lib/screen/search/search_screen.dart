import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kanbo/screen/search/components/item_search.dart';
import 'package:kanbo/utils/app_route.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            titleSpacing: 0,
            elevation: 0,
            backgroundColor: Colors.white,
            leading: GestureDetector(
              onTap: () => AppRoute.back(),
              child: const Icon(
                Icons.chevron_left,
                color: Colors.black,
              ),
            ),
            title: SizedBox(
              height: 50,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 3,
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                      hintText: 'Search....',
                      border: InputBorder.none,
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                          onPressed: () => searchController.clear(),
                          icon: const Icon(Icons.clear))),
                ),
              ),
            ),
          ),
          body: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return ItemSearch(text: index.toString());
              }),
        ),
      ),
    );
  }
}
