// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paldex/configs/colors.dart';
import 'package:paldex/configs/images.dart';
import 'package:paldex/data/categories.dart';
import 'package:paldex/domain/entities/category.dart';
import 'package:paldex/routes.dart';
import 'package:paldex/ui/widgets/palball_background.dart';
import 'package:paldex/ui/widgets/search_bar.dart';

import '../../../states/theme/theme_cubit.dart';
import 'widgets/category_card.dart';
import 'widgets/news_card.dart';

part 'sections/header_card_content.dart';
part 'sections/pal_news.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  bool showTitle = false;

  @override
  void initState() {
    _scrollController.addListener(_onScroll);

    super.initState();
  }

  @override
  void dispose() {
    if (_scrollController != null) {
      _scrollController.dispose();
    }

    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final offset = _scrollController.offset;
    final showTitle = offset > _HeaderCardContent.height - kToolbarHeight;

    // Prevent unneccesary rebuild
    if (this.showTitle == showTitle) return;

    setState(() {
      this.showTitle = showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (_, __) => [
          SliverAppBar(
            expandedHeight: _HeaderCardContent.height,
            floating: true,
            pinned: true,
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            backgroundColor: AppColors.red,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              centerTitle: true,
              title: Visibility(
                visible: showTitle,
                child: Text(
                  'Paldex',
                  style: Theme.of(context)
                      .appBarTheme
                      .toolbarTextStyle
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              background: _HeaderCardContent(),
            ),
          ),
        ],
        body: const _PalNews(),
      ),
    );
  }
}
