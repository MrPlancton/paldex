import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paldex/configs/images.dart';
import 'package:paldex/configs/types.dart';
import 'package:paldex/core/utils.dart';
import 'package:paldex/domain/entities/pal.dart';
import 'package:paldex/routes.dart';
import 'package:paldex/states/pal/pal_bloc.dart';
import 'package:paldex/states/pal/pal_event.dart';
import 'package:paldex/states/pal/pal_state.dart';
import 'package:paldex/ui/screens/types/type_container.dart';
import 'package:paldex/ui/screens/types/type_entities/widget_list.dart';
import 'package:paldex/ui/widgets/pal_card.dart';

// Class responsible for creating the list present in the modal page consisting of various effects related to the selected type
class ModalContents extends StatefulWidget {
  const ModalContents({
    Key? key,
    required this.index,
    required this.width,
    required this.scroller,
  }) : super(key: key);

  final int index;
  final double width;
  final ScrollController scroller;

  @override
  ModalContentsState createState() => ModalContentsState();
}

class ModalContentsState extends State<ModalContents> {
  final List<bool> _isOpen = [false, false, false];

  @override
  void initState() {
    super.initState();

    scheduleMicrotask(() {
      context.read<PalBloc>().add(const PalLoadStarted(loadAll: true));
    });
  }

  void _onPalPress(int index, Pal pal) {
    context.read<PalBloc>().add(PalSelectChanged(palId: pal.number));

    AppNavigator.push(Routes.palInfo, pal);
  }

  PokeTypes get pokeType => types[widget.index];

  ExpansionPanel _buildTypePalPanel(List<Pal> pals) {
    final filteredPals =
        pals.where((pal) => pal.types.contains(pokeType.type)).toList();

    return ExpansionPanel(
      headerBuilder: (context, isOpen) {
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Image(
                image: AppImages.palball,
                width: 30,
                height: 30,
                color: pokeType.color.withOpacity(0.5),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                  "${getEnumValue(pokeType.type)[0].toUpperCase() + getEnumValue(pokeType.type).substring(1)} Type "
                  "Pals"),
            )
          ],
        );
      },
      canTapOnHeader: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: filteredPals.isNotEmpty
            ? GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 1.4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                physics: const NeverScrollableScrollPhysics(),
                children: filteredPals.map((pal) {
                  return PalCard(
                    pal,
                    onPress: () => _onPalPress(pals.indexOf(pal), pal),
                  );
                }).toList(),
              )
            : const Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child:
                    Text("No Pal found", style: TextStyle(fontSize: 16, color: Colors.black54)),
              ),
      ),
      isExpanded: _isOpen[0],
    );
  }

  ExpansionPanel _buildTypeItemsPanel() {
    return ExpansionPanel(
      headerBuilder: (context, isOpen) {
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Image(
                image: AppImages.palball,
                width: 30,
                height: 30,
                color: pokeType.color.withOpacity(0.5),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                  "${getEnumValue(pokeType.type)[0].toUpperCase() + getEnumValue(pokeType.type).substring(1)} Type "
                  "Items"),
            )
          ],
        );
      },
      canTapOnHeader: true,
      body: const Text("Under development"),
      isExpanded: _isOpen[1],
    );
  }

  Widget _buildTypePanelList(List<Pal> pals) => ExpansionPanelList(
        animationDuration: const Duration(milliseconds: 500),
        children: [
          _buildTypePalPanel(pals),
          _buildTypeItemsPanel(),
        ],
        expansionCallback: (i, isOpen) => setState(() => _isOpen[i] = !isOpen),
      );

  Widget _buildError() => Container(
        padding: const EdgeInsets.only(bottom: 28),
        alignment: Alignment.center,
        child: const Icon(
          Icons.warning_amber_rounded,
          size: 60,
          color: Colors.black26,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      controller: widget.scroller,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
              alignment: Alignment.center,
              child: TypeDisplayContainer(
                index: widget.index,
                path: "name",
                value: null,
                width: 200.0,
                j: null,
                height: 70,
                typeList: const [],
              )), //type_card
        ),
        Center(
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            height: 1,
            width: widget.width / 1.7,
            color: Colors.black12,
          ),
        ),
        if (pokeType.superEffective.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: lister(widget.index, 2, widget.width, "Effective Against".toUpperCase()),
          ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: lister(widget.index, 0.5, widget.width, "Weak Against".toUpperCase()),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: lister(widget.index, 1, widget.width, "Normal Against".toUpperCase()),
        ),
        if (pokeType.nilEffective.isNotEmpty)
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: lister(widget.index, 0, widget.width, "No Effect Against".toUpperCase()),
          ),
        BlocBuilder<PalBloc, PalState>(builder: (_, state) {
          if (state.error != null) {
            return _buildError();
          }

          return _buildTypePanelList(state.pals);
        }),
      ],
    );
  }
}
