import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  // domainクラスと合わせる必要があるため、dynamicなlist型になっている
  Failure([List properties = const <dynamic>[]]);
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [props];
}

class CacheFailure extends Failure {
  @override
  List<Object?> get props => [props];
}
