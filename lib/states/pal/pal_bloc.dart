import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:paldex/data/repositories/pal_repository.dart';
import 'package:paldex/states/pal/pal_event.dart';
import 'package:paldex/states/pal/pal_state.dart';

class PalBloc extends Bloc<PalEvent, PalState> {
  static const int palsPerPage = 20;

  final PalRepository _palRepository;

  PalBloc(this._palRepository) : super(const PalState.initial()) {
    on<PalLoadStarted>(
      _onLoadStarted,
      transformer: (events, mapper) => events.switchMap(mapper),
    );
    on<PalLoadMoreStarted>(
      _onLoadMoreStarted,
      transformer: (events, mapper) => events.switchMap(mapper),
    );
    on<PalSelectChanged>(_onSelectChanged);
  }

  void _onLoadStarted(PalLoadStarted event, Emitter<PalState> emit) async {
    try {
      emit(state.asLoading());

      final pals = event.loadAll
          ? await _palRepository.getAllPals()
          : await _palRepository.getPals(page: 1, limit: palsPerPage);

      final canLoadMore = pals.length >= palsPerPage;

      emit(state.asLoadSuccess(pals, canLoadMore: canLoadMore));
    } on Exception catch (e) {
      emit(state.asLoadFailure(e));
    }
  }

  void _onLoadMoreStarted(PalLoadMoreStarted event, Emitter<PalState> emit) async {
    try {
      if (!state.canLoadMore) return;

      emit(state.asLoadingMore());

      final pals = await _palRepository.getPals(
        page: state.page + 1,
        limit: palsPerPage,
      );

      final canLoadMore = pals.length >= palsPerPage;

      emit(state.asLoadMoreSuccess(pals, canLoadMore: canLoadMore));
    } on Exception catch (e) {
      emit(state.asLoadMoreFailure(e));
    }
  }

  void _onSelectChanged(PalSelectChanged event, Emitter<PalState> emit) async {
    try {
      final palIndex = state.pals.indexWhere(
        (pal) => pal.number == event.palId,
      );

      if (palIndex < 0 || palIndex >= state.pals.length) return;

      final pal = await _palRepository.getPal(event.palId);

      if (pal == null) return;

      emit(state.copyWith(
        pals: state.pals..setAll(palIndex, [pal]),
        selectedPalIndex: palIndex,
      ));
    } on Exception catch (e) {
      emit(state.asLoadMoreFailure(e));
    }
  }
}
