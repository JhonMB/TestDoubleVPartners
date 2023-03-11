class CreateUserException implements Exception {
  final String message;

  CreateUserException({required this.message});
}

class GetUsersException implements Exception {
  final String message;

  GetUsersException({required this.message});
}
