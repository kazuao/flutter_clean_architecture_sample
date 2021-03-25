import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  // domainクラスと合わせる必要があるため、dynamicなlist型になっている
  Failure([List properties = const <dynamic>[]]) : super(properties);
}
