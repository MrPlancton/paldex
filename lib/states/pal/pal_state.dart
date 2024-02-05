import 'package:paldex/domain/entities/pal/pal.dart';
import 'package:paldex/domain/entities/utils/max_stats.dart';

enum PalStateStatus {
  initial,
  loading,
  loadSuccess,
  loadFailure,
  loadingMore,
  loadMoreSuccess,
  loadMoreFailure,
}

class PalState {
  final PalStateStatus status;
  final List<Pal> pals;
  final int selectedPalIndex;
  final int page;
  final Exception? error;
  final bool canLoadMore;
  final MaxStats? maxStats;

  Pal get selectedPal => pals[selectedPalIndex];

  const PalState._(
      {this.status = PalStateStatus.initial,
      this.pals = const [],
      this.selectedPalIndex = 0,
      this.page = 1,
      this.canLoadMore = true,
      this.error,
      this.maxStats});

  const PalState.initial() : this._();

  PalState asLoading() {
    return copyWith(
      status: PalStateStatus.loading,
    );
  }

  PalState asLoadSuccess({List<Pal>? pals, MaxStats? maxStats, bool canLoadMore = true}) {
    return copyWith(
      status: PalStateStatus.loadSuccess,
      pals: pals ?? pals,
      page: 1,
      canLoadMore: canLoadMore,
      maxStats: maxStats ?? maxStats,
    );
  }

  PalState asLoadFailure(Exception e) {
    return copyWith(
      status: PalStateStatus.loadFailure,
      error: e,
    );
  }

  PalState asLoadingMore() {
    return copyWith(status: PalStateStatus.loadingMore);
  }

  PalState asLoadMoreSuccess(List<Pal> newPals, {bool canLoadMore = true}) {
    return copyWith(
      status: PalStateStatus.loadMoreSuccess,
      pals: [...pals, ...newPals],
      page: canLoadMore ? page + 1 : page,
      canLoadMore: canLoadMore,
    );
  }

  PalState asLoadMoreFailure(Exception e) {
    return copyWith(
      status: PalStateStatus.loadMoreFailure,
      error: e,
    );
  }

  PalState copyWith(
      {PalStateStatus? status, List<Pal>? pals, int? selectedPalIndex, int? page, bool? canLoadMore, Exception? error, MaxStats? maxStats}) {
    return PalState._(
      status: status ?? this.status,
      pals: pals ?? this.pals,
      selectedPalIndex: selectedPalIndex ?? this.selectedPalIndex,
      page: page ?? this.page,
      canLoadMore: canLoadMore ?? this.canLoadMore,
      error: error ?? this.error,
      maxStats: maxStats ?? this.maxStats,
    );
  }
}
