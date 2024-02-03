part of '../pal_info.dart';

class Stat extends StatelessWidget {
  final Animation animation;
  final String label;
  final double? progress;
  final num value;

  const Stat({
    super.key,
    required this.animation,
    required this.label,
    required this.value,
    this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: TextStyle(color: Theme.of(context).textTheme.bodySmall!.color!.withOpacity(0.6)),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text('$value'),
        ),
        Expanded(
          flex: 5,
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, widget) {
              final currentProgress = progress ?? value / 100;

              return ProgressBar(
                progress: animation.value * currentProgress,
                color: currentProgress < 0.5 ? AppColors.red : AppColors.teal,
                enableAnimation: animation.value == 1,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _PalBaseStats extends StatefulWidget {
  final Pal pal;

  const _PalBaseStats(this.pal);

  @override
  State<_PalBaseStats> createState() => _PalBaseStatsState();
}

class _PalBaseStatsState extends State<_PalBaseStats> with SingleTickerProviderStateMixin {
  late Animation<double> _progressAnimation;
  late AnimationController _progressController;

  Pal get pal => widget.pal;

  AnimationController get slideController => PalInfoStateProvider.of(context).slideController;

  @override
  void initState() {
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      curve: Curves.easeInOut,
      parent: _progressController,
    ));

    _progressController.forward();

    super.initState();
  }

  @override
  void dispose() {
    _progressController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slideController,
      builder: (context, child) {
        final scrollable = slideController.value.floor() == 1;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          physics: scrollable ? const BouncingScrollPhysics() : const NeverScrollableScrollPhysics(),
          child: child,
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          buildStats(pal.stats),
          const SizedBox(height: 27),
          const Text(
            'Type defenses',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              height: 0.8,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            'The effectiveness of each type on ${pal.name}.',
            style: TextStyle(color: AppColors.black.withOpacity(0.6)),
          ),
          const SizedBox(height: 15),
          _buildEffectivenesses(pal.effectiveness),
        ],
      ),
    );
  }

  Widget buildStats(PalStats stats) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stat(animation: _progressAnimation, label: 'Hp', value: stats.hp),
        const SizedBox(height: 14),
        Stat(animation: _progressAnimation, label: 'Melee attack', value: stats.meleeAttack),
        const SizedBox(height: 14),
        Stat(animation: _progressAnimation, label: 'Shot attack', value: stats.shotAttack),
        const SizedBox(height: 14),
        Stat(animation: _progressAnimation, label: 'Defense', value: stats.defense),
        const SizedBox(height: 14),
        Stat(animation: _progressAnimation, label: 'Support', value: stats.support),
        const SizedBox(height: 14),
        Stat(animation: _progressAnimation, label: 'Stamina', value: stats.stamina),
        const SizedBox(height: 14),
        Stat(animation: _progressAnimation, label: 'Craft speed', value: stats.craftSpeed),
        const SizedBox(height: 14),
        Stat(animation: _progressAnimation, label: 'Slow walk speed', value: stats.slowWalkSpeed),
        const SizedBox(height: 14),
        Stat(animation: _progressAnimation, label: 'Walk speed', value: stats.walkSpeed),
        const SizedBox(height: 14),
        Stat(animation: _progressAnimation, label: 'Run speed', value: stats.runSpeed),
        const SizedBox(height: 14),
        Stat(animation: _progressAnimation, label: 'Ride sprint speed', value: stats.rideSprintSpeed),
        const SizedBox(height: 14),
        Stat(animation: _progressAnimation, label: 'Transport speed', value: stats.transportSpeed),
        const SizedBox(height: 14),

        // Stat(
        //   animation: _progressAnimation,
        //   label: 'Total',
        //   value: stats.total,
        //   progress: stats.total / 600,
        // ),
      ],
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
              colored: true,
              extra: '${typeEffectiveness[type]}',
            ),
          )
          .toList(),
    );
  }
}
