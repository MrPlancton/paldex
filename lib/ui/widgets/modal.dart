import 'package:flutter/material.dart';
import 'package:paldex/configs/colors.dart';

class Modal extends StatelessWidget {
  static const Radius _borderRadius = Radius.circular(30.0);

  const Modal({super.key, 
    this.title,
    required this.child,
  });

  final String? title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.only(
          topLeft: _borderRadius,
          topRight: _borderRadius,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _DragLine(),
          _Title(title),
          child,
        ],
      ),
    );
  }
}

class _DragLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.2;

    return Container(
      width: width,
      height: 3,
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
        color: AppColors.lighterGrey,
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title(this.text);

  final String? text;

  @override
  Widget build(BuildContext context) {
    if (text == null) {
      return const SizedBox();
    }

    return Padding(
      padding: const EdgeInsets.only(
        top: 18,
        bottom: 8,
      ),
      child: Text(
        text ?? '',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
