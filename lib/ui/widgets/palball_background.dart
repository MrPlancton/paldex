import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paldex/configs/colors.dart';
import 'package:paldex/configs/images.dart';
import 'package:paldex/ui/widgets/main_app_bar.dart';

import '../../states/theme/theme_cubit.dart';

class PalballBackground extends StatelessWidget {
  static const double _palballWidthFraction = 0.664;

  final Widget child;
  final Widget? floatingActionButton;

  const PalballBackground({
    Key? key,
    required this.child,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final safeAreaTop = MediaQuery.of(context).padding.top;
    final palballSize = MediaQuery.of(context).size.width * _palballWidthFraction;
    final appBarHeight = AppBar().preferredSize.height;
    const iconButtonPadding = mainAppbarPadding;
    final iconSize = IconTheme.of(context).size ?? 0;

    final palballTopMargin = -(palballSize / 2 - safeAreaTop - appBarHeight / 2);
    final palballRightMargin = -(palballSize / 2 - iconButtonPadding - iconSize / 2);

    var themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    var isDark = themeCubit.isDark;
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: palballTopMargin,
            right: palballRightMargin,
            child: Image(
              image: AppImages.palball,
              width: palballSize,
              height: palballSize,
              color: !isDark ? AppColors.whiteGrey : Colors.black.withOpacity(0.05),
            ),
          ),
          child,
        ],
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
