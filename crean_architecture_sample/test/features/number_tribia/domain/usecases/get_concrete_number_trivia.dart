import 'package:crean_architecture_sample/features/number_tribia/domain/entities/number_trivia.dart';
import 'package:crean_architecture_sample/features/number_tribia/domain/repositories/number_trivia_repository.dart';
import 'package:crean_architecture_sample/features/number_tribia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetConcreteNumberTrivia usecase;
  MockNumberTriviaRepository mockNumberTriviaRepository;

  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(text: 'test', number: 1);

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  test('should get trivia for the number from the repository', () async {
    // arrange
    // mocなので、getConcreteNumberTriviaにいれる数字はなんでもいい（any）
    // EitherのRight(成功)を返却したいので、Right(tNumberTrivia)を返却する
    when(mockNumberTriviaRepository.getConcreteNumberTrivia(any))
        .thenAnswer((_) async => Right(tNumberTrivia));

    // act
    final result = await usecase(Params(number: tNumber));

    // assert
    expect(result, Right(tNumberTrivia));
    verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
