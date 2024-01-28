import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paldex/data/repositories/item_repository.dart';
import 'package:paldex/states/item/item_event.dart';
import 'package:paldex/states/item/item_state.dart';
import 'package:stream_transform/stream_transform.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  static const int itemsPerPage = 20;

  final ItemRepository _itemRepository;

  ItemBloc(this._itemRepository) : super(const ItemState.initial()) {
    on<ItemLoadStarted>(
      _onLoadStarted,
      transformer: (events, mapper) => events.switchMap(mapper),
    );
    on<ItemLoadMoreStarted>(
      _onLoadMoreStarted,
      transformer: (events, mapper) => events.switchMap(mapper),
    );
    // on<ItemSelectChanged>(_onSelectChanged);
  }

  void _onLoadStarted(ItemLoadStarted event, Emitter<ItemState> emit) async {
    try {
      emit(state.asLoading());

      final items = event.loadAll
          ? await _itemRepository.getAllItems()
          : await _itemRepository.getItems(page: 1, limit: itemsPerPage);

      final canLoadMore = items.length >= itemsPerPage;

      emit(state.asLoadSuccess(items, canLoadMore: canLoadMore));
    } on Exception catch (e) {
      emit(state.asLoadFailure(e));
    }
  }

  void _onLoadMoreStarted(ItemLoadMoreStarted event, Emitter<ItemState> emit) async {
    try {
      if (!state.canLoadMore) return;

      emit(state.asLoadingMore());

      final pals = await _itemRepository.getItems(
        page: state.page + 1,
        limit: itemsPerPage,
      );

      final canLoadMore = pals.length >= itemsPerPage;

      emit(state.asLoadMoreSuccess(pals, canLoadMore: canLoadMore));
    } on Exception catch (e) {
      emit(state.asLoadMoreFailure(e));
    }
  }

  // void _onSelectChanged(ItemSelectChanged event, Emitter<ItemState> emit) async {
  //   try {
  //     final itemIndex = state.items.indexWhere(
  //       (item) => item.number == event.palId,
  //     );

  //     if (itemIndex < 0 || itemIndex >= state.pals.length) return;

  //     final item = await _itemRepository.getPal(event.palId);

  //     if (pal == null) return;

  //     emit(state.copyWith(
  //       pals: state.pals..setAll(itemIndex, [pal]),
  //       selectedPalIndex: itemIndex,
  //     ));
  //   } on Exception catch (e) {
  //     emit(state.asLoadMoreFailure(e));
  //   }
  // }
}
