import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paldex/configs/durations.dart';
import 'package:paldex/configs/images.dart';
import 'package:paldex/core/extensions/animation.dart';
import 'package:paldex/domain/entities/pal.dart';
import 'package:paldex/routes.dart';
import 'package:paldex/states/pal/pal_bloc.dart';
import 'package:paldex/states/pal/pal_event.dart';
import 'package:paldex/states/pal/pal_selector.dart';
import 'package:paldex/states/pal/pal_state.dart';
import 'package:paldex/ui/modals/generation_modal.dart';
import 'package:paldex/ui/modals/search_modal.dart';
import 'package:paldex/ui/widgets/pal_card.dart';
import 'package:paldex/ui/widgets/animated_overlay.dart';
import 'package:paldex/ui/widgets/fab.dart';
import 'package:paldex/ui/widgets/main_app_bar.dart';
import 'package:paldex/ui/widgets/palball_background.dart';
import 'package:paldex/ui/widgets/pal_refresh_control.dart';

part 'sections/fab_menu.dart';
part 'sections/pal_grid.dart';

class PaldexScreen extends StatefulWidget {
  const PaldexScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PaldexScreenState();
}

class _PaldexScreenState extends State<PaldexScreen> {
  @override
  Widget build(BuildContext context) {
    return const PalballBackground(
      child: Stack(
        children: [
          _PalGrid(),
          _FabMenu(),
        ],
      ),
    );
  }
}
