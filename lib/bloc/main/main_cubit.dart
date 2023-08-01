part of 'main_page.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState.initial());

  void add(Color item) {
    emit(state.copyWith(items: state.items.toList()..add(item)));
  }

  void remove(Color item) {
    emit(state.copyWith(items: state.items.toList()..remove(item)));
  }
}
