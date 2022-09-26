import 'package:crean_architecture_sample/core/usecase/usecase.dart';
import 'package:crean_architecture_sample/features/number_tribia/domain/entities/number_trivia.dart';
import 'package:crean_architecture_sample/features/number_tribia/domain/repositories/number_trivia_repository.dart';
import 'package:crean_architecture_sample/features/number_tribia/domain/usecases/get_random_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  late GetRandomNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;

  final tNumberTrivia = NumberTrivia(text: 'test', number: 1);

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(mockNumberTriviaRepository);
  });

  test('should get trivia from the repository', () async {
    // arrange
    when(mockNumberTriviaRepository.getRandomNumberTrivia())
        .thenAnswer((_) async => Right(tNumberTrivia));

    // act
    final result = await usecase(NoParams());

    // assert
    expect(result, Right(tNumberTrivia));
    verify(mockNumberTriviaRepository.getRandomNumberTrivia());
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
