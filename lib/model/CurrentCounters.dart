class CurrentCounters {
  final int userCounter;
  final int totalCounter;

  const CurrentCounters({
    required this.userCounter,
    required this.totalCounter,
  });

  CurrentCounters.fromJson(Map<String, dynamic> json)
      : userCounter = json['user_counter'] as int,
        totalCounter = json['total_counter'] as int;
}