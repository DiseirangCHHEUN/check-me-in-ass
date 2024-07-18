class UserModel {
  String? uid;
  String? fullName;
  String? email;
  // String? address;
  // String? phone;
  String? imageUrl;

  UserModel({
    this.uid,
    this.fullName,
    this.email,
    // this.address,
    // this.phone,
    this.imageUrl,
  });

  // Convert a UserModel object into a map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'email': email,
      // 'address': address,
      // 'phone': phone,
      'imageUrl': imageUrl,
    };
  }

  // Create a UserModel object from a map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      fullName: map['fullName'],
      email: map['email'],
      // address: map['address'],
      // phone: map['phone'],
      imageUrl: map['imageUrl'],
    );
  }
}
