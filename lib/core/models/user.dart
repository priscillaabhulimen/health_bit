class UserModel {
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  dynamic about;
  dynamic profilePic;
  dynamic emailVerifiedAt;

  UserModel({
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.about,
    this.profilePic,
    this.emailVerifiedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => new UserModel(
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    phoneNumber: json["phone_number"],
    about: json["about"],
    profilePic: json["profile_pic"],
    emailVerifiedAt: json["email_verified_at"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "phone_number": phoneNumber,
    "about": about,
    "profile_pic": profilePic,
    "email_verified_at": emailVerifiedAt,
  };
}
