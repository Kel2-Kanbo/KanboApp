import 'package:flutter/material.dart';
import 'package:kanbo/screen/chat/components/item_chat.dart';
import 'package:kanbo/export_custom_widgets.dart';
import 'package:kanbo/export_package.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = context.mediaSize;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Chat',
            style: TextStyle(color: Colors.black),
          )),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 24, right: 16, left: 16),
            child: SearchWidget(),
          ),
          SizedBox(
            height: size.height - 215,
            child: ListView.separated(
            padding: const EdgeInsets.only(top: 24),
              physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) => ItemChat(
                      text: "$index",
                    ),
                separatorBuilder: (BuildContext context, int index) =>
                    const SpaceWidget(space: 16,)),
          )
        ],
      ),
    );
  }
}
