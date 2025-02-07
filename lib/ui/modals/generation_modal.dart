// import 'package:flutter/material.dart';
// import 'package:paldex/data/generations.dart';
// import 'package:paldex/domain/entities/generation.dart';
// import 'package:paldex/ui/screens/paldex/widgets/generation_card.dart';
// import 'package:paldex/ui/widgets/modal.dart';
//
// class GenerationModal extends StatelessWidget {
//   const GenerationModal({super.key});
//
//   Widget _buildGenerationCard(Generation generation) {
//     return GenerationCard(generation);
//   }
//
//   Widget _buildGenerations(BuildContext context, ScrollController scrollController) {
//     final safeAreaBottom = MediaQuery.of(context).padding.bottom;
//
//     return Expanded(
//       child: GridView.builder(
//         padding: EdgeInsets.fromLTRB(26, 26, 26, 26 + safeAreaBottom),
//         controller: scrollController,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 1.55,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//         ),
//         itemCount: generations.length,
//         itemBuilder: (_, index) => _buildGenerationCard(generations[index]),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return DraggableScrollableSheet(
//       expand: true,
//       initialChildSize: 0.7,
//       maxChildSize: 1,
//       minChildSize: 0.5,
//       builder: (_, scrollController) {
//         return Modal(
//           title: 'Generation',
//           child: _buildGenerations(context, scrollController),
//         );
//       },
//     );
//   }
// }
