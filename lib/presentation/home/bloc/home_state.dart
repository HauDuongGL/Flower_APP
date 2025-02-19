part of 'home_bloc.dart';

@freezed
class HomeState extends BaseState with _$HomeState {
  const factory HomeState({
    @Default(PageType.spring) PageType currentPageType,
  }) = _HomeState;
}
