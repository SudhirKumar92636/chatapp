class UserModles {
  String? id;
  String? name;
  String? email;
  String? profileImage;
  String? phoneNumber;
  String? about;
  String? createdAt;
  String? lastOnlineStatus;
  String? status;
  String? password; // Make password nullable

  UserModles({
    this.id,
    this.name,
    this.email,
    this.profileImage,
    this.phoneNumber,
    this.about,
    this.createdAt,
    this.lastOnlineStatus,
    this.status,
    this.password,
  });

  UserModles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    profileImage = json['profileImage'];
    phoneNumber = json['phoneNumber'];
    about = json['About'];
    createdAt = json['createdAt'];
    lastOnlineStatus = json['LastOnlineStatus'];
    status = json['Status'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['profileImage'] = profileImage;
    data['phoneNumber'] = phoneNumber;
    data['About'] = about;
    data['createdAt'] = createdAt;
    data['LastOnlineStatus'] = lastOnlineStatus;
    data['Status'] = status;
    data['password'] = password;

    return data;
  }
}
