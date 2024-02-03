// part of '../pal_info.dart';
//
// class _PalBall extends StatelessWidget {
//   final Pal pal;
//
//   const _PalBall(this.pal);
//
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final palballSize = screenHeight * 0.1;
//     final palSize = palballSize * 0.85;
//
//     return Column(
//       children: [
//         Stack(
//           alignment: Alignment.center,
//           children: <Widget>[
//             Image(
//               image: AppImages.palball,
//               width: palballSize,
//               height: palballSize,
//               color: AppColors.lightGrey,
//             ),
//             PalImage(
//               pal: pal,
//               size: Size.square(palSize),
//             ),
//           ],
//         ),
//         const SizedBox(height: 3),
//         Text(pal.name),
//       ],
//     );
//   }
// }
//
// class _PalEvolution extends StatefulWidget {
//   final Pal pal;
//
//   const _PalEvolution(this.pal);
//
//   @override
//   _PalEvolutionState createState() => _PalEvolutionState();
// }
//
// class _PalEvolutionState extends State<_PalEvolution> {
//   Pal get pal => widget.pal;
//
//   Widget _buildRow({
//     required Pal current,
//     required Pal next,
//     required String reason,
//   }) {
//     return Row(
//       children: <Widget>[
//         Expanded(child: _PalBall(current)),
//         Expanded(
//           child: Column(
//             children: <Widget>[
//               const Icon(Icons.arrow_forward, color: AppColors.lightGrey),
//               const SizedBox(height: 7),
//               Text(reason, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
//             ],
//           ),
//         ),
//         Expanded(child: _PalBall(next)),
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final slideController = PalInfoStateProvider.of(context).slideController;
//
//     return AnimatedBuilder(
//       animation: slideController,
//       builder: (context, child) {
//         final scrollable = slideController.value.floor() == 1;
//
//         return SingleChildScrollView(
//           physics: scrollable ? const BouncingScrollPhysics() : const NeverScrollableScrollPhysics(),
//           padding: const EdgeInsets.symmetric(vertical: 31, horizontal: 28),
//           child: child,
//         );
//       },
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           const Text(
//             'Evolution Chain',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 16,
//               height: 0.8,
//             ),
//           ),
//           const SizedBox(height: 28),
//           ListView.separated(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             separatorBuilder: (_, __) => const Divider(height: 58),
//             itemCount: pal.evolutions.length - 1,
//             itemBuilder: (_, index) => _buildRow(
//               current: pal.evolutions[index],
//               next: pal.evolutions[index + 1],
//               reason: pal.evolutions[index + 1].evolutionReason,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
