import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paldex/configs/durations.dart';
import 'package:paldex/configs/images.dart';
import 'package:paldex/core/extensions/animation.dart';
import 'package:paldex/states/item/item_bloc.dart';
import 'package:paldex/states/item/item_event.dart';
import 'package:paldex/states/item/item_selector.dart';
import 'package:paldex/states/item/item_state.dart';
import 'package:paldex/ui/modals/generation_modal.dart';
import 'package:paldex/ui/modals/search_modal.dart';
import 'package:paldex/ui/widgets/animated_overlay.dart';
import 'package:paldex/ui/widgets/fab.dart';
import 'package:paldex/ui/widgets/main_app_bar.dart';
import 'package:paldex/ui/widgets/pal_refresh_control.dart';
import 'package:paldex/ui/widgets/palball_background.dart';

import 'widgets/item_card.dart';

part 'sections/fab_menu.dart';
part 'sections/items_grid.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  ItemsScreenState createState() => ItemsScreenState();
}

class ItemsScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return const PalballBackground(
      child: Stack(
        children: [
          _ItemGrid(),
        ],
      ),
    );
  }
}
