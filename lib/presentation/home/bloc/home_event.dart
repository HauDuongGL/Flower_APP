part of 'home_bloc.dart';

@freezed
class HomeEvent extends BaseEvent with _$HomeEvent {
  const factory HomeEvent.started() = _Started;
  const factory HomeEvent.changePage(PageType type) = _OnChangedPage;
}
