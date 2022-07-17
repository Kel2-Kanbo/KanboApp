import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kanbo/export_custom_widgets.dart';
import 'package:kanbo/export_package.dart';
import 'package:kanbo/model/chat.dart';
import 'package:kanbo/model/room.dart';
import 'package:kanbo/screen/chat/components/item_dm.dart';

class DirectMessageScreen extends StatefulWidget {
  final String title;
  final Room? room;
  const DirectMessageScreen({Key? key, this.title = '-', this.room})
      : super(key: key);

  @override
  State<DirectMessageScreen> createState() => _DirectMessageScreenState();
}

class _DirectMessageScreenState extends State<DirectMessageScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _controller = ScrollController();
  List<Chat> listChat = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          widget.title,
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
          widget.room != null
              ? Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: CardRoomWidget(room: widget.room as Room),
                )
              : Container(),
          Expanded(
            flex: 2,
            child: listChat.isEmpty
                ? const NoDataWidget(title: 'No Conversation Here',)
                : ListView.builder(
                    controller: _controller,
                    physics: const BouncingScrollPhysics(),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    itemCount: listChat.length,
                    itemBuilder: (context, index) {
                      final Chat chat = listChat[index];
                      return ItemDm(
                        chat: chat,
                      );
                    }),
          ),
          Container(
            height: 60,
            padding:
                const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 8),
            decoration: BoxDecoration(
                border: Border.symmetric(
                    horizontal:
                        BorderSide(color: context.resources.color.grey3))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _messageController,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    maxLines: null,
                    decoration: const InputDecoration.collapsed(
                      hintText: 'Message....',
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    final message = _messageController.value.text;
                    final timeNow = DateTime.now();
                    if (message.isNotEmpty) {
                      setState(() {
                        listChat.add(Chat(
                            message: message, time: timeNow, isUser: true));
                      });
                      _messageController.clear();
                      if (listChat.length > 1) {
                        _controller
                            .jumpTo(_controller.position.maxScrollExtent);
                      }
                    }
                  },
                  onDoubleTap: () {
                    final message = _messageController.value.text;
                    final timeNow = DateTime.now();
                    if (message.isNotEmpty) {
                      setState(() {
                        listChat.add(Chat(
                            message: message, time: timeNow, isUser: false));
                      });
                      _messageController.clear();
                      if (listChat.length > 1) {
                        _controller
                            .jumpTo(_controller.position.maxScrollExtent);
                      }
                    }
                  },
                  child: Icon(
                    Icons.send_outlined,
                    color: context.resources.color.grey2,
                  ),
                ),
                // IconButton(
                //     onPressed: () {},
                //     padding: EdgeInsets.zero,
                //     icon: Icon(
                //       Icons.send_outlined,
                //       color: context.resources.color.grey2,
                //     ))
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    _controller.dispose();
    super.dispose();
  }
}
