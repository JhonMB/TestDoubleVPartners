abstract class Failure {}

class CreateUserFailure extends Failure {
  final String message;

  CreateUserFailure({required this.message});
}

class GetUsersFailure extends Failure {
  final String message;

  GetUsersFailure({required this.message});
}
