import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kanbo/model/chat.dart';
import 'package:kanbo/export_package.dart';

class ItemDm extends StatelessWidget {
  final Chat chat;
  const ItemDm({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Align(
            alignment:
                chat.isUser ? Alignment.centerRight : Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => Clipboard.setData(ClipboardData(text: chat.message)),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                    color: context.resources.color.colorPrimary[50],
                    borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(16),
                        topRight: const Radius.circular(16),
                        bottomLeft: chat.isUser
                            ? const Radius.circular(16)
                            : Radius.zero,
                        bottomRight: chat.isUser
                            ? Radius.zero
                            : const Radius.circular(16))),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 35, bottom: 5),
                      child: Text(
                        chat.message,
                        style: TextStyle(fontSize: 12.sp, color: Colors.black),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Text(
                        chat.getMessageTime(),
                        style: TextStyle(fontSize: 10.sp),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
