import 'package:flutter/material.dart';
import 'package:kanbo/widgets/space_widget.dart';

import '../data/remote/viewstate.dart';

class StateWidget extends StatelessWidget {
  final ViewState state;
  final String? errorMsg;
  final Widget? child;
  final Function(Duration)? onError;
  final Function(Duration)? onSucces;
  final String? messageLoading;
  const StateWidget(
      {Key? key,
      required this.state,
      this.errorMsg,
      this.child,
      this.onError,
      this.onSucces,
      this.messageLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (state == ViewState.loading) {
      return Stack(
        children: [
          Center(
            child: Card(
              color: Colors.white,
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  direction: Axis.vertical,
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    const SpaceWidget(),
                    Text(messageLoading ?? 'Mohon tunggu'),
                  ],
                ),
              ),
            ),
          )
        ],
      );
    } else if (state == ViewState.error) {
      if (onError != null) {
        WidgetsBinding.instance.addPostFrameCallback(onError!);
      } else {
        return Container();
      }
    } else if (state == ViewState.success) {
      if (onSucces != null) {
        WidgetsBinding.instance.addPostFrameCallback(onSucces!);
      } else {
        return Container();
      }
    }
    return child ?? Container();
  }
}
