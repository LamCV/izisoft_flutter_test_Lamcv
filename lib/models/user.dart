class User {
  final String? email;
  final String? name;
  final String? avatar;
  final String? gender;
  final String? describe;
  final String? job;
  final String? password;
  final String? id;

  User({
    this.email,
    this.name,
    this.avatar,
    this.gender,
    this.describe,
    this.job,
    this.password,
    this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'] as String?,
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      gender: json['gender'] as String?,
      describe: json['describe'] as String?,
      job: json['job'] as String?,
      password: json['password'] as String?,
      id: json['id'] as String?,
    );
  }
}