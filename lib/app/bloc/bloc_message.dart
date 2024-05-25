class BlocMessage {
  final String? message;
  final int timestamp;

  BlocMessage(this.message) : timestamp = DateTime.now().millisecond;

  const BlocMessage.pure()
      : message = null,
        timestamp = 0;
}
