import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:paldex/configs/images.dart';
import 'package:paldex/domain/entities/pal.dart';

class PalImage extends StatelessWidget {
  static const Size _cacheMaxSize = Size(700, 700);

  final Pal pal;
  final EdgeInsets padding;
  final bool useHero;
  final Size size;
  final ImageProvider placeholder;
  final Color? tintColor;

  const PalImage({
    Key? key,
    required this.pal,
    required this.size,
    this.padding = EdgeInsets.zero,
    this.useHero = true,
    this.placeholder = AppImages.bulbasaur,
    this.tintColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HeroMode(
      enabled: useHero,
      child: Hero(
        tag: pal.image,
        child: AnimatedPadding(
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeOutQuint,
          padding: padding,
          child: CachedNetworkImage(
            imageUrl: pal.image,
            useOldImageOnUrlChange: true,
            maxWidthDiskCache: _cacheMaxSize.width.toInt(),
            maxHeightDiskCache: _cacheMaxSize.height.toInt(),
            fadeInDuration: const Duration(milliseconds: 120),
            fadeOutDuration: const Duration(milliseconds: 120),
            imageBuilder: (_, image) => Image(
              image: image,
              width: size.width,
              height: size.height,
              alignment: Alignment.bottomCenter,
              color: tintColor,
              fit: BoxFit.contain,
            ),
            placeholder: (_, __) => Image(
              image: placeholder,
              width: size.width,
              height: size.height,
              alignment: Alignment.bottomCenter,
              color: Colors.black12,
              fit: BoxFit.contain,
            ),
            errorWidget: (_, __, ___) => Stack(
              alignment: Alignment.center,
              children: [
                Image(
                  image: placeholder,
                  width: size.width,
                  height: size.height,
                  color: Colors.black12,
                ),
                Icon(
                  Icons.warning_amber_rounded,
                  size: size.width * 0.3,
                  color: Colors.black26,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
