import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kanbo/screen/chat/components/item_dm.dart';
import 'package:kanbo/utils/app_context_ext.dart';

class DirectMessageScreen extends StatelessWidget {
  final String title;
  const DirectMessageScreen({Key? key, this.title = '-'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: 10,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ItemDm(
                        text: 'Index $index',
                        isUser: index.isOdd,
                      ),
                    )),
          ),
          Container(
            height: 60,
            padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 8),
            decoration: BoxDecoration(
                border: Border.symmetric(
                    horizontal:
                        BorderSide(color: context.resources.color.grey3))),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    maxLines: null,
                    decoration: const InputDecoration.collapsed(
                      hintText: 'Message....',
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.send_outlined,
                      color: context.resources.color.grey2,
                    ))
                // GestureDetector(
                //   onTap: () {},
                //   child: Icon(
                //     Icons.send_outlined,
                //     color: context.resources.color.grey2,
                //   ),
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
