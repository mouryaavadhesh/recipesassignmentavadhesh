import 'package:flutter/material.dart';

abstract class BlocWrapper {
  Widget wrappedBloc(BuildContext context);
}

class WrappedWidget<T extends BlocWrapper> extends StatelessWidget {
  const WrappedWidget({Key? key, required this.child}) : super(key: key);
  final T child;
  @override
  Widget build(BuildContext context) {
    return child.wrappedBloc(context);
  }
}
