import 'package:flutter/material.dart';

class PalInfoStateProvider extends InheritedWidget {
  final AnimationController slideController;
  final AnimationController rotateController;

  const PalInfoStateProvider({
    super.key,
    required this.slideController,
    required this.rotateController,
    required Widget child,
  }) : super(child: child);

  static PalInfoStateProvider of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<PalInfoStateProvider>();

    return result!;
  }

  @override
  bool updateShouldNotify(covariant PalInfoStateProvider oldWidget) => false;
}
