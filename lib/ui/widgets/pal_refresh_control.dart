import 'package:flutter/cupertino.dart';
import 'package:paldex/configs/images.dart';

class PalRefreshControl extends StatelessWidget {
  final Future<void> Function() onRefresh;

  const PalRefreshControl({
    Key? key,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSliverRefreshControl(
      onRefresh: onRefresh,
      builder: (_, __, ___, ____, _____) => const Image(
        image: AppImages.pikloader,
      ),
    );
  }
}
