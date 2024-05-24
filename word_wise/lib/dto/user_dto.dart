class UserDto {
  final String email;
  final String userId;

  UserDto({required this.email, required this.userId});
}

extension UserDtoExt on UserDto? {
  bool get isNull => this == null;
  bool get isNotNull => this != null;
}
