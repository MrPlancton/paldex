part of '../paldex.dart';

class _PalGrid extends StatefulWidget {
  const _PalGrid();

  @override
  _PalGridState createState() => _PalGridState();
}

class _PalGridState extends State<_PalGrid> {
  static const double _endReachedThreshold = 200;

  final GlobalKey<NestedScrollViewState> _scrollKey = GlobalKey();

  PalBloc get palBloc => context.read<PalBloc>();

  @override
  void initState() {
    super.initState();

    scheduleMicrotask(() {
      palBloc.add(const PalLoadStarted());
      _scrollKey.currentState?.innerController.addListener(_onScroll);
    });
  }

  @override
  void dispose() {
    _scrollKey.currentState?.innerController.dispose();
    _scrollKey.currentState?.dispose();

    super.dispose();
  }

  void _onScroll() {
    final innerController = _scrollKey.currentState?.innerController;

    if (innerController == null || !innerController.hasClients) return;

    final thresholdReached = innerController.position.extentAfter < _endReachedThreshold;

    if (thresholdReached) {
      // Load more!
      palBloc.add(PalLoadMoreStarted());
    }
  }

  Future _onRefresh() async {
    palBloc.add(const PalLoadStarted());

    return palBloc.stream.firstWhere((e) => e.status != PalStateStatus.loading);
  }

  void _onPalPress(Pal pal) {
    palBloc.add(PalSelectChanged(palId: pal.number));

    AppNavigator.push(Routes.palInfo, pal);
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      key: _scrollKey,
      headerSliverBuilder: (_, __) => [
        MainSliverAppBar(
          context: context,
        ),
      ],
      body: PalStateStatusSelector((status) {
        switch (status) {
          case PalStateStatus.loading:
            return _buildLoading();

          case PalStateStatus.loadSuccess:
          case PalStateStatus.loadMoreSuccess:
          case PalStateStatus.loadingMore:
            return _buildGrid();

          case PalStateStatus.loadFailure:
          case PalStateStatus.loadMoreFailure:
            return _buildError();

          default:
            return Container();
        }
      }),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: Image(image: AppImages.pikloader),
    );
  }

  Widget _buildGrid() {
    return CustomScrollView(
      slivers: [
        PalRefreshControl(onRefresh: _onRefresh),
        SliverPadding(
          padding: const EdgeInsets.all(28),
          sliver: NumberOfPalsSelector((numberOfPals) {
            return SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              delegate: SliverChildBuilderDelegate(
                (_, index) {
                  return PalSelector(index, (pal, _) {
                    return PalCard(
                      pal,
                      onPress: () => _onPalPress(pal),
                    );
                  });
                },
                childCount: numberOfPals,
              ),
            );
          }),
        ),
        SliverToBoxAdapter(
          child: PalCanLoadMoreSelector((canLoadMore) {
            if (!canLoadMore) {
              return const SizedBox.shrink();
            }

            return Container(
              padding: const EdgeInsets.only(bottom: 28),
              alignment: Alignment.center,
              child: const Image(image: AppImages.pikloader),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildError() {
    return CustomScrollView(
      slivers: [
        PalRefreshControl(onRefresh: _onRefresh),
        SliverFillRemaining(
          child: Container(
            padding: const EdgeInsets.only(bottom: 28),
            alignment: Alignment.center,
            child: const Icon(
              Icons.warning_amber_rounded,
              size: 60,
              color: Colors.black26,
            ),
          ),
        ),
      ],
    );
  }
}
