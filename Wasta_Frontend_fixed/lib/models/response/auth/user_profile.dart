class UserProfile {
  final String userType;
  final String id;
  final String username;
  final String email;
  final bool isAdmin;
  final bool isAgent;
  final List<String> skills;
  final String profile;
  final bool isActive;
  final bool isEmailVerified;

  UserProfile({
    required this.userType,
    required this.id,
    required this.username,
    required this.email,
    required this.isAdmin,
    required this.isAgent,
    required this.skills,
    required this.profile,
    required this.isActive,
    required this.isEmailVerified,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      userType: json['userType'],
      id: json['_id'],
      username: json['username'],
      email: json['email'],
      isAdmin: json['isAdmin'],
      isAgent: json['isAgent'],
      skills: List<String>.from(json['skills']),
      profile: json['profile'],
      isActive: json['isActive'],
      isEmailVerified: json['isEmailVerified'],
    );
  }
}
