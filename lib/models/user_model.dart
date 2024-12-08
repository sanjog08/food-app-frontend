class User {
  String? id; // For MongoDB's _id field (if used)
  String name;
  String email;
  String password;
  String role;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    this.role = 'user', // Default value
    this.createdAt,
    this.updatedAt,
  });

  // Factory method to create a User object from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      role: json['role'] ?? 'user',
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  // Method to convert User object to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'password': password,
      'role': role,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
