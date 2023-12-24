class User {
  final String fullName;
  final String email;
  final String phoneNumber;

  User({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      fullName: map['fullName'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
    );
  }
}