abstract class PalEvent {
  const PalEvent();
}

class PalLoadStarted extends PalEvent {
  final bool loadAll;

  const PalLoadStarted({this.loadAll = false});
}

class PalLoadMoreStarted extends PalEvent {}

class PalSelectChanged extends PalEvent {
  final String palId;

  const PalSelectChanged({required this.palId});
}
