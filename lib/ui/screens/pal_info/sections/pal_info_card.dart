part of '../pal_info.dart';

class _PalInfoCard extends StatefulWidget {
  static const double minCardHeightFraction = 0.54;

  const _PalInfoCard();

  @override
  State<_PalInfoCard> createState() => _PalInfoCardState();
}

class _PalInfoCardState extends State<_PalInfoCard> {
  AnimationController get slideController => PalInfoStateProvider.of(context).slideController;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final safeArea = MediaQuery.of(context).padding;
    final appBarHeight = AppBar().preferredSize.height;

    final cardMinHeight = screenHeight * _PalInfoCard.minCardHeightFraction;
    final cardMaxHeight = screenHeight - appBarHeight - safeArea.top;

    return AutoSlideUpPanel(
      minHeight: cardMinHeight,
      maxHeight: cardMaxHeight,
      onPanelSlide: (position) => slideController.value = position,
      child: CurrentPalSelector((pal) {
        return MainTabView(
          paddingAnimation: slideController,
          tabs: [
            MainTabData(
              label: 'About',
              child: _PalAbout(pal),
            ),
            MainTabData(
              label: 'Base Stats',
              child: _PalBaseStats(pal),
            ),
            // MainTabData(
            //   label: 'Evolution',
            //   child: _PalEvolution(pal),
            // ),
            const MainTabData(
              label: 'Moves',
              child: Align(
                alignment: Alignment.topCenter,
                child: Text('Under development'),
              ),
            ),
          ],
        );
      }),
    );
  }
}
