part of '../pal_info.dart';

class _PalOverallInfo extends StatefulWidget {
  const _PalOverallInfo();

  @override
  _PalOverallInfoState createState() => _PalOverallInfoState();
}

class _PalOverallInfoState extends State<_PalOverallInfo> with TickerProviderStateMixin {
  static const double _palSliderViewportFraction = 0.56;
  static const int _endReachedThreshold = 4;

  final GlobalKey _currentTextKey = GlobalKey();
  final GlobalKey _targetTextKey = GlobalKey();

  double textDiffLeft = 0.0;
  double textDiffTop = 0.0;
  late PageController _pageController;
  late AnimationController _horizontalSlideController;

  PalBloc get palBloc => context.read<PalBloc>();
  AnimationController get slideController => PalInfoStateProvider.of(context).slideController;
  AnimationController get rotateController => PalInfoStateProvider.of(context).rotateController;

  Animation<double> get textFadeAnimation => Tween(begin: 1.0, end: 0.0).animate(slideController);
  Animation<double> get sliderFadeAnimation => Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: slideController,
        curve: const Interval(0.0, 0.5, curve: Curves.ease),
      ));

  @override
  void initState() {
    _horizontalSlideController = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 300),
    )..forward();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    final pageIndex = palBloc.state.selectedPalIndex;

    _pageController = PageController(
      viewportFraction: _palSliderViewportFraction,
      initialPage: pageIndex,
    );

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _horizontalSlideController.dispose();
    _pageController.dispose();

    super.dispose();
  }

  void _calculatePalNamePosition() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final targetTextBox = _targetTextKey.currentContext?.findRenderObject() as RenderBox?;
      final currentTextBox = _currentTextKey.currentContext?.findRenderObject() as RenderBox?;

      if (targetTextBox == null || currentTextBox == null) return;

      final targetTextPosition = targetTextBox.localToGlobal(Offset.zero);
      final currentTextPosition = currentTextBox.localToGlobal(Offset.zero);

      final newDiffLeft = targetTextPosition.dx - currentTextPosition.dx;
      final newDiffTop = targetTextPosition.dy - currentTextPosition.dy;

      if (newDiffLeft != textDiffLeft || newDiffTop != textDiffTop) {
        setState(() {
          textDiffLeft = newDiffLeft;
          textDiffTop = newDiffTop;
        });
      }
    });
  }

  void _onSelectedPalChanged(int index) {
    final pals = palBloc.state.pals;
    final selectedPal = pals[index];

    palBloc.add(PalSelectChanged(palId: selectedPal.id));

    final shouldLoadMore = index >= pals.length - _endReachedThreshold;

    if (shouldLoadMore) {
      palBloc.add(PalLoadMoreStarted());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildAppBar(),
        const SizedBox(height: 9),
        _buildPalName(),
        const SizedBox(height: 9),
        _buildPalTypes(),
        const SizedBox(height: 25),
        _buildPalSlider(),
      ],
    );
  }

  AppBar _buildAppBar() {
    return MainAppBar(
      // A placeholder for easily calculate the translate of the pal name
      title: CurrentPalSelector((pal) {
        _calculatePalNamePosition();

        return Text(
          pal.name,
          key: _targetTextKey,
          style: const TextStyle(
            color: Colors.transparent,
            fontWeight: FontWeight.w900,
            fontSize: 22,
          ),
        );
      }),
      rightIcon: Icons.favorite_border,
    );
  }

  Widget _buildPalName() {
    var bgColor = Theme.of(context).colorScheme.background;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AnimatedBuilder(
            animation: slideController,
            builder: (_, __) {
              final value = slideController.value;

              return Transform.translate(
                offset: Offset(textDiffLeft * value, textDiffTop * value),
                child: CurrentPalSelector((pal) {
                  return HeroText(
                    pal.name,
                    textKey: _currentTextKey,
                    style: TextStyle(
                      color: bgColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 36 - (36 - 22) * value,
                    ),
                  );
                }),
              );
            },
          ),
          AnimatedSlide(
            animation: _horizontalSlideController,
            child: AnimatedFade(
              animation: textFadeAnimation,
              child: CurrentPalSelector((pal) {
                return Column(
                  children: [
                    HeroText(
                      "#${pal.id}",
                      style: TextStyle(
                        color: bgColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPalTypes() {
    return AnimatedFade(
      animation: textFadeAnimation,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: CurrentPalSelector((pal) {
          return Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: pal.types.take(3).map((type) => PalType(type, large: true)).toList(),
                ),
              ),
              // AnimatedSlide(
              //   animation: _horizontalSlideController,
              //   child: Text(
              //     "GENERA ???",
              //     style: TextStyle(color: Theme.of(context).colorScheme.background),
              //   ),
              // ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildPalSlider() {
    final screenSize = MediaQuery.of(context).size;
    final sliderHeight = screenSize.height * 0.24;
    final palballSize = screenSize.height * 0.24;
    final palSize = screenSize.height * 0.3;

    return AnimatedFade(
      animation: sliderFadeAnimation,
      child: SizedBox(
        width: screenSize.width,
        height: sliderHeight,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: RotationTransition(
                turns: rotateController,
                child: Image(
                  image: AppImages.palball,
                  width: palballSize,
                  height: palballSize,
                  color: Colors.white12,
                ),
              ),
            ),
            NumberOfPalsSelector((numberOfPals) {
              return PageView.builder(
                allowImplicitScrolling: true,
                physics: const BouncingScrollPhysics(),
                controller: _pageController,
                itemCount: numberOfPals,
                onPageChanged: _onSelectedPalChanged,
                itemBuilder: (_, index) {
                  return PalSelector(index, (pal, selected) {
                    return PalImage(
                      pal: pal,
                      size: Size.square(palSize),
                      padding: EdgeInsets.symmetric(
                        vertical: selected ? 0 : screenSize.height * 0.04,
                      ),
                      tintColor: selected ? null : Colors.black26,
                      useHero: selected,
                    );
                  });
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
