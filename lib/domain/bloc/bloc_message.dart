import 'package:equatable/equatable.dart';

class BlocMessage extends Equatable {
  final String content;
  final DateTime? createAt;

  BlocMessage(this.content) : createAt = DateTime.now();

  @override
  List<Object?> get props => [content, createAt];
}
