part of 'get_subscribers_cubit.dart';

class GetSubscribersState extends Equatable {
  const GetSubscribersState(
      {this.getSubscribersState = RequestStateEnum.loading,
      this.subscribers = const [],
      this.getSubscribersErrorMessage});

  final RequestStateEnum getSubscribersState;
  final List<Subscriber> subscribers;
  final String? getSubscribersErrorMessage;

  @override
  List<Object?> get props => [
        getSubscribersState,
        subscribers,
        getSubscribersErrorMessage,
      ];
}
