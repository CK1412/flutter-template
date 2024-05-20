import 'package:equatable/equatable.dart';

class BlocMessage extends Equatable {
  final String? message;
  final int timestamp;

  BlocMessage(this.message) : timestamp = DateTime.now().millisecond;

  const BlocMessage.pure()
      : message = null,
        timestamp = 0;

  @override
  List<Object?> get props => [message, timestamp];
}
