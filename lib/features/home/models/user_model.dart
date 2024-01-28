// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? about;
  final String? image;
  final String? lastActive;
  final bool? isOnline;
  final String? pushToken;
  final String? createdAt;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.about,
    this.image,
    this.lastActive,
    this.isOnline,
    this.pushToken,
    this.createdAt,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        about: json["about"],
        image: json["image"],
        lastActive: json["last_active"],
        isOnline: json["is_online"],
        pushToken: json["push_token"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "about": about,
        "image": image,
        "last_active": lastActive,
        "is_online": isOnline,
        "push_token": pushToken,
        "created_at": createdAt,
      };

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? about,
    String? image,
    String? lastActive,
    bool? isOnline,
    String? pushToken,
    String? createdAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      about: about ?? this.about,
      image: image ?? this.image,
      lastActive: lastActive ?? this.lastActive,
      isOnline: isOnline ?? this.isOnline,
      pushToken: pushToken ?? this.pushToken,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, about: $about, image: $image, lastActive: $lastActive, isOnline: $isOnline, pushToken: $pushToken, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.about == about &&
        other.image == image &&
        other.lastActive == lastActive &&
        other.isOnline == isOnline &&
        other.pushToken == pushToken &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ email.hashCode ^ about.hashCode ^ image.hashCode ^ lastActive.hashCode ^ isOnline.hashCode ^ pushToken.hashCode ^ createdAt.hashCode;
  }
}
