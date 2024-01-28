import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paldex/ui/screens/types/type_grid.dart';
import 'package:paldex/ui/widgets/main_app_bar.dart';
import 'package:paldex/ui/widgets/palball_background.dart';

// Class that is related to creating the whole type-effects page
class TypeEffectScreen extends StatelessWidget {
  const TypeEffectScreen({super.key});

  List<Widget> _buildHeader(BuildContext context, bool innerBoxIsScrolled) {
    return [
      MainSliverAppBar(
        title: 'Type Effects',
        context: context,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PalballBackground(
      child: NestedScrollView(
        headerSliverBuilder: _buildHeader,
        body: const TypeEffectGrid(),
      ),
    );
  }
}
