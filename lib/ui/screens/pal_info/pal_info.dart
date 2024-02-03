import 'dart:math';

import 'package:flutter/material.dart' hide AnimatedSlide;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paldex/configs/colors.dart';
import 'package:paldex/configs/images.dart';
import 'package:paldex/domain/entities/pal/pal.dart';
import 'package:paldex/domain/entities/pal/pal_effectiveness.dart';
import 'package:paldex/domain/entities/pal/pal_stats.dart';
import 'package:paldex/domain/entities/type/pal_types.dart';
import 'package:paldex/states/pal/pal_bloc.dart';
import 'package:paldex/states/pal/pal_event.dart';
import 'package:paldex/states/pal/pal_selector.dart';
import 'package:paldex/states/theme/theme_cubit.dart';
import 'package:paldex/ui/screens/pal_info/state_provider.dart';
import 'package:paldex/ui/widgets/animated_fade.dart';
import 'package:paldex/ui/widgets/animated_slide.dart';
import 'package:paldex/ui/widgets/auto_slideup_panel.dart';
import 'package:paldex/ui/widgets/hero.dart';
import 'package:paldex/ui/widgets/main_app_bar.dart';
import 'package:paldex/ui/widgets/main_tab_view.dart';
import 'package:paldex/ui/widgets/pal_image.dart';
import 'package:paldex/ui/widgets/pal_type.dart';
import 'package:paldex/ui/widgets/progress.dart';

part 'sections/background_decoration.dart';
part 'sections/pal_info_card.dart';
part 'sections/pal_info_card_about.dart';
part 'sections/pal_info_card_basestats.dart';
part 'sections/pal_overall_info.dart';

class PalInfo extends StatefulWidget {
  const PalInfo({super.key});

  @override
  PalInfoState createState() => PalInfoState();
}

class PalInfoState extends State<PalInfo> with TickerProviderStateMixin {
  late AnimationController _slideController;
  late AnimationController _rotateController;

  @override
  void initState() {
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _rotateController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    )..repeat();

    super.initState();
  }

  @override
  void dispose() {
    _slideController.dispose();
    _rotateController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PalInfoStateProvider(
      slideController: _slideController,
      rotateController: _rotateController,
      child: const Scaffold(
        body: Stack(
          children: <Widget>[
            _BackgroundDecoration(),
            _PalInfoCard(),
            _PalOverallInfo(),
          ],
        ),
      ),
    );
  }
}
