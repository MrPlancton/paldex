import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paldex/domain/entities/pal.dart';
import 'package:paldex/states/pal/pal_bloc.dart';
import 'package:paldex/states/pal/pal_state.dart';

class PalStateSelector<T> extends BlocSelector<PalBloc, PalState, T> {
  PalStateSelector({super.key, 
    required T Function(PalState) selector,
    required Widget Function(T) builder,
  }) : super(
          selector: selector,
          builder: (_, value) => builder(value),
        );
}

class PalStateStatusSelector extends PalStateSelector<PalStateStatus> {
  PalStateStatusSelector(Widget Function(PalStateStatus) builder, {super.key})
      : super(
          selector: (state) => state.status,
          builder: builder,
        );
}

class PalCanLoadMoreSelector extends PalStateSelector<bool> {
  PalCanLoadMoreSelector(Widget Function(bool) builder, {super.key})
      : super(
          selector: (state) => state.canLoadMore,
          builder: builder,
        );
}

class NumberOfPalsSelector extends PalStateSelector<int> {
  NumberOfPalsSelector(Widget Function(int) builder, {super.key})
      : super(
          selector: (state) => state.pals.length,
          builder: builder,
        );
}

class CurrentPalSelector extends PalStateSelector<Pal> {
  CurrentPalSelector(Widget Function(Pal) builder, {super.key})
      : super(
          selector: (state) => state.selectedPal,
          builder: builder,
        );
}

class PalSelector extends PalStateSelector<PalSelectorState> {
  PalSelector(int index, Widget Function(Pal, bool) builder, {super.key})
      : super(
          selector: (state) => PalSelectorState(
            state.pals[index],
            state.selectedPalIndex == index,
          ),
          builder: (value) => builder(value.pal, value.selected),
        );
}

class PalSelectorState {
  final Pal pal;
  final bool selected;

  const PalSelectorState(this.pal, this.selected);

  @override
  bool operator ==(Object other) =>
      other is PalSelectorState && pal == other.pal && selected == other.selected;
}
