import 'package:flutter/material.dart';
import 'package:paldex/configs/images.dart';
import 'package:paldex/domain/entities/pal.dart';
import 'package:paldex/ui/widgets/pal_image.dart';
import 'package:paldex/ui/widgets/pal_type.dart';

class PalCard extends StatelessWidget {
  static const double _palballFraction = 0.75;
  static const double _palFraction = 0.76;

  final Pal pal;
  final void Function()? onPress;

  const PalCard(
    this.pal, {super.key, 
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        final itemHeight = constrains.maxHeight;

        return Container(
          decoration: BoxDecoration(
            color: pal.color,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: pal.color.withOpacity(0.4),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Material(
              color: pal.color,
              child: InkWell(
                onTap: onPress,
                splashColor: Colors.white10,
                highlightColor: Colors.white10,
                child: Stack(
                  children: [
                    _buildPalballDecoration(height: itemHeight),
                    _buildPal(height: itemHeight),
                    _buildPalNumber(),
                    _CardContent(pal),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPalballDecoration({required double height}) {
    final palballSize = height * _palballFraction;

    return Positioned(
      bottom: -height * 0.13,
      right: -height * 0.03,
      child: Image(
        image: AppImages.palball,
        width: palballSize,
        height: palballSize,
        color: Colors.white.withOpacity(0.14),
      ),
    );
  }

  Widget _buildPal({required double height}) {
    final palSize = height * _palFraction;

    return Positioned(
      bottom: -2,
      right: 2,
      child: PalImage(
        size: Size.square(palSize),
        pal: pal,
      ),
    );
  }

  Widget _buildPalNumber() {
    return Positioned(
      top: 10,
      right: 14,
      child: Text(
        '#${pal.number}',
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black38,
        ),
      ),
    );
  }
}

class _CardContent extends StatelessWidget {
  final Pal pal;

  const _CardContent(this.pal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Hero(
              tag: pal.number + pal.name,
              child: Text(
                pal.name,
                style: TextStyle(
                  fontSize: 14,
                  height: 0.7,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ..._buildTypes(context),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildTypes(BuildContext context) {
    return pal.types
        .take(2)
        .map(
          (type) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: PalType(type),
          ),
        )
        .toList();
  }
}
