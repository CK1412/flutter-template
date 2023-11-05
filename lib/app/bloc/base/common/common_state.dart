part of 'common_bloc.dart';

class CommonState extends BaseBlocState {
  final bool isLoading;
  final int loadingCount;
  final AppException? exception;

  const CommonState({
    this.isLoading = false,
    this.loadingCount = 0,
    this.exception,
  });

  @override
  List<Object?> get props => [isLoading, loadingCount, exception];

  CommonState copyWith({
    bool? isLoading,
    int? loadingCount,
    AppException? exception,
  }) {
    return CommonState(
      isLoading: isLoading ?? this.isLoading,
      loadingCount: loadingCount ?? this.loadingCount,
      exception: exception ?? this.exception,
    );
  }
}
