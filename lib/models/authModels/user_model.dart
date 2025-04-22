class UserModel {
  final int customerId;
  final String username;
  final String email;
  final String? img;
  final String phone;
  final String? birthdate;
  final String gender;

  UserModel({
    required this.customerId,
    required this.username,
    required this.email,
    this.img,
    required this.phone,
    this.birthdate,
    required this.gender,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      customerId: json['CustomerId'],
      username: json['Username'],
      email: json['Email'],
      img: json['img'],
      phone: json['phone'],
      birthdate: json['birthdate'],
      gender: json['gender'],
    );
  }
}
