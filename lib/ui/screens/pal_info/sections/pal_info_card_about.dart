part of '../pal_info.dart';

class _Label extends Text {
  _Label(super.text, bool isDark)
      : super(
          style: TextStyle(
            color: isDark ? AppColors.whiteGrey.withOpacity(0.6) : AppColors.black.withOpacity(0.6),
            height: 0.8,
          ),
        );
}

class _ContentSection extends StatelessWidget {
  final String label;
  final List<Widget>? children;

  const _ContentSection({
    super.key,
    required this.label,
    this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(height: 0.8, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 22),
        if (children != null) ...children!
      ],
    );
  }
}

class _TextIcon extends StatelessWidget {
  final ImageProvider icon;
  final String text;

  const _TextIcon(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(image: icon, width: 12, height: 12),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(height: 0.8)),
      ],
    );
  }
}

class _PalAbout extends StatelessWidget {
  final Pal pal;

  const _PalAbout(this.pal);

  @override
  Widget build(BuildContext context) {
    final slideController = PalInfoStateProvider.of(context).slideController;

    var themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    var isDark = themeCubit.isDark;

    return AnimatedBuilder(
      animation: slideController,
      builder: (context, child) {
        final scrollable = slideController.value.floor() == 1;

        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 27),
          physics: scrollable ? const BouncingScrollPhysics() : const NeverScrollableScrollPhysics(),
          child: child,
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildDescription(pal.description),
          const SizedBox(height: 16),
          const Text(
            'Strengths and weaknesses',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              height: 0.8,
            ),
          ),
          const SizedBox(height: 15),
          _buildEffectivenesses(pal.effectiveness),
          //TODO>?????
          //_buildHeightWeight(pal.height, pal.weight, context, isDark),
          //const SizedBox(height: 31),
          //_buildBreeding(pal.gender, pal.eggGroups, isDark),
          //const SizedBox(height: 35),
          //_buildLocation(),
          // const SizedBox(height: 26),
          //_buildTraining(pal.baseExp, isDark),
        ],
      ),
    );
  }

  Widget _buildDescription(String description) {
    return Text(
      description,
      style: const TextStyle(height: 1.3),
    );
  }

  Widget _buildEffectivenesses(Map<PalTypes, PalEffectiveness> typeEffectiveness) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: typeEffectiveness.keys
          .map(
            (type) => PalType(
          type,
          large: true,
          extra: _getIconFromEffectiveness(typeEffectiveness[type]),
        ),
      )
          .toList(),
    );
  }

  StatelessWidget _getIconFromEffectiveness(PalEffectiveness? effectiveness) {
    switch (effectiveness) {
      case PalEffectiveness.strong:
        return const Icon(Icons.keyboard_arrow_up_sharp, color: AppColors.lightGreen);
      case PalEffectiveness.weak:
        return const Icon(Icons.keyboard_arrow_down_sharp, color: AppColors.red);
      default:
        return Container();
    }
  }

  Widget _buildHeightWeight(String height, String weight, BuildContext context, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.background,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            offset: const Offset(0, 8),
            blurRadius: 23,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _Label('Height', isDark),
                const SizedBox(height: 11),
                Text(
                  height,
                  style: const TextStyle(
                    height: 0.8,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _Label('Weight', isDark),
                const SizedBox(height: 11),
                Text(weight,
                    style: const TextStyle(
                      height: 0.8,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildBreeding(PalGender gender, List<String> eggGroups, bool isDark) {
  //   return _ContentSection(
  //     label: 'Breeding',
  //     children: [
  //       Row(
  //         children: <Widget>[
  //           Expanded(child: _Label('Gender', isDark)),
  //           if (gender.genderless)
  //             const Expanded(
  //               flex: 3,
  //               child: Text('Genderless', style: TextStyle(height: 0.8)),
  //             )
  //           else ...[
  //             Expanded(
  //               child: _TextIcon(AppImages.male, '${gender.male}%'),
  //             ),
  //             Expanded(
  //               flex: 2,
  //               child: _TextIcon(AppImages.female, '${gender.female}%'),
  //             ),
  //           ],
  //         ],
  //       ),
  //       const SizedBox(height: 18),
  //       Row(
  //         children: <Widget>[
  //           Expanded(child: _Label('Egg Groups', isDark)),
  //           Expanded(
  //             flex: 2,
  //             child: Text(eggGroups.join(', '), style: const TextStyle(height: 0.8)),
  //           ),
  //           const Expanded(flex: 1, child: SizedBox()),
  //         ],
  //       ),
  //     ],
  //   );
  // }

  Widget _buildLocation() {
    return _ContentSection(
      label: 'Location',
      children: [
        AspectRatio(
          aspectRatio: 2.2,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.teal,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTraining(double baseExp, bool isDark) {
    return _ContentSection(
      label: 'Training',
      children: [
        Row(
          children: <Widget>[
            Expanded(flex: 1, child: _Label('Base EXP', isDark)),
            Expanded(flex: 3, child: Text('$baseExp')),
          ],
        ),
      ],
    );
  }
}