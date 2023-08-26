class UserState {
  final String name;
  final int age;

  UserState({required this.age, required this.name});

  UserState copyWith({String? name, int? age}) =>
      UserState(age: age ?? this.age, name: name ?? this.name);

  factory UserState.fromJSON(Map<String, dynamic> json) => UserState(
        age: json['age'] as int? ?? 0,
        name: json['name'] as String? ?? '',
      );
}
