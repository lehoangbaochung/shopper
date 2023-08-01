part of 'main_page.dart';

class MainState {
  final Iterable<Color> items;

  const MainState._({
    required this.items,
  });

  factory MainState.initial() {
    return const MainState._(
      items: [],
    );
  }

  MainState copyWith({
    Iterable<Color>? items,
  }) {
    return MainState._(
      items: items ?? this.items,
    );
  }
}
