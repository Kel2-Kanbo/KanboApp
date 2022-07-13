import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kanbo/screen/confirm/components/contact_section.dart';
import 'package:kanbo/screen/confirm/components/header_confirm_section.dart';
import 'package:kanbo/screen/confirm/components/payment_section.dart';
import 'package:kanbo/utils/app_context_ext.dart';
import 'package:kanbo/utils/app_route.dart';
import 'package:kanbo/widgets/space_widget.dart';

import '../payment/payment_screen.dart';

class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = context.mediaSize;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Confirmation',
          style: TextStyle(color: Colors.black),
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
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => getListWidgetConfirm()[index],
                separatorBuilder: (context, index) => Container(
                      height: 4,
                      color: context.resources.color.white2,
                    ),
                itemCount: getListWidgetConfirm().length),
          ),
          Container(
            width: size.width,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, blurRadius: 2, offset: Offset(0, -2))
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text('Total'),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text('BANK'),
                          SpaceWidget(
                            space: 2,
                          ),
                          Text('NOMINAL')
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    width: size.width,
                    height: 53,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ))),
                        onPressed: () => AppRoute.to(const PaymentScreen()),
                        child: const Text('Pay')),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> getListWidgetConfirm() =>
      const [HeaderConfirmSection(), ContactSection(), PaymentSection()];
}
