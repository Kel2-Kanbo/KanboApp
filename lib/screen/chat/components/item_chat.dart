import 'package:flutter/material.dart';
import 'package:kanbo/screen/chat/direct_message_screen.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:kanbo/utils/app_route.dart';
import 'package:kanbo/widgets/space_widget.dart';

class ItemChat extends StatelessWidget {
  final String text;
  const ItemChat({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AppRoute.to(DirectMessageScreen(title: 'USER $text',)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            const Expanded(
                child: CircleAvatar(
                  radius: 24,
                backgroundImage: NetworkImage('https://images.unsplash.com/photo-1479839672679-a46483c0e7c8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx'),
            )),
            Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'USER $text',
                        style:
                            TextStyle(color: context.resources.color.textBoldColor, fontWeight: FontWeight.bold),
                      ),
                      const SpaceWidget(space: 4,),
                      const Text('Isi chatnya blalbalbf albl alablbalab lalblab', maxLines: 1, overflow: TextOverflow.ellipsis,)
                    ], 
                  ),
                )),
            const Expanded(child: Text('DATE'))
          ],
        ),
      ),
    );
  }
}
