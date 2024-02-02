import 'package:flutter/material.dart';
import 'package:paldex/domain/entities/pal_types.dart';
import 'package:paldex/ui/widgets/spacer.dart';

class PalType extends StatelessWidget {
  const PalType(
    this.type, {
    Key? key,
    this.large = false,
    this.colored = false,
    this.extra = '',
  }) : super(key: key);

  final PalTypes type;
  final String extra;
  final bool large;
  final bool colored;

  @override
  Widget build(BuildContext context) {
    var bgColor = Theme.of(context).colorScheme.onSurfaceVariant;
    var textColor = Theme.of(context).colorScheme.onPrimary;
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: large ? 19 : 12,
          vertical: large ? 6 : 4,
        ),
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          color: (colored ? type.color : bgColor).withOpacity(0.2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              type.value,
              textScaler: TextScaler.noScaling,
              style: TextStyle(
                  fontSize: large ? 12 : 8,
                  height: 0.8,
                  fontWeight: large ? FontWeight.bold : FontWeight.normal,
                  color: colored ? type.color : textColor),
              textAlign: TextAlign.center,
            ),
            const HSpacer(5),
            Text(
              extra,
              textScaleFactor: 1,
              style: TextStyle(
                fontSize: large ? 12 : 8,
                height: 0.8,
                fontWeight: large ? FontWeight.bold : FontWeight.normal,
                color: colored ? type.color : bgColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
