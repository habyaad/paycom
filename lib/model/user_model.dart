class UserModel {
  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.defaultCountry,
    required this.carrierCode,
    required this.type,
    required this.formattedPhone,
  });

  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? defaultCountry;
  final String? carrierCode;
  final String? type;
  final String? formattedPhone;

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      firstName: json["first_name"],
      lastName: json["last_name"],
      email: json["email"],
      password: json["password"],
      defaultCountry: json["defaultCountry"],
      carrierCode: json["carrierCode"],
      type: json["type"],
      formattedPhone: json["formattedPhone"],
    );
  }

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "password": password,
    "defaultCountry": defaultCountry,
    "carrierCode": carrierCode,
    "type": type,
    "formattedPhone": formattedPhone,
  };

}
