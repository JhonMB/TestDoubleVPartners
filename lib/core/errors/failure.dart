abstract class Failure {}

class CreateUserFailure extends Failure {
  final String message;

  CreateUserFailure({required this.message});
}
