part of 'common_bloc.dart';

class CommonState extends BaseBlocState {
  final bool isLoading;
  final int loadingCount;
  final AppExceptionWrapper? appExceptionWrapper;
  final BlocMessage? blocMessage;

  const CommonState({
    this.isLoading = false,
    this.loadingCount = 0,
    this.appExceptionWrapper,
    this.blocMessage,
  });

  @override
  List<Object?> get props => [
        isLoading,
        loadingCount,
        appExceptionWrapper,
        blocMessage,
      ];

  CommonState copyWith({
    bool? isLoading,
    int? loadingCount,
    AppExceptionWrapper? appExceptionWrapper,
    BlocMessage? blocMessage,
  }) {
    return CommonState(
      isLoading: isLoading ?? this.isLoading,
      loadingCount: loadingCount ?? this.loadingCount,
      appExceptionWrapper: appExceptionWrapper ?? this.appExceptionWrapper,
      blocMessage: blocMessage ?? this.blocMessage,
    );
  }
}
