class Counter {
  final String userId;
  final int clickCount;
  final String updatedAt;

  const Counter({
    required this.userId,
    required this.clickCount,
    required this.updatedAt,
  });

  factory Counter.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'USER_ID': String userId,
        'CLICK_COUNT': int clickCount,
        'UPDATED_AT': String updatedAt,
      } =>
        Counter(
          userId: userId,
          clickCount: clickCount,
          updatedAt: updatedAt,
        ),
      _ => throw const FormatException('Failed to load counter.'),
    };
  }
}