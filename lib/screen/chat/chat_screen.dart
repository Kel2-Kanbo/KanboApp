import 'package:flutter/material.dart';
import 'package:kanbo/screen/chat/components/item_chat.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:kanbo/widgets/search_widget.dart';

import '../../widgets/space_widget.dart';

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
