/// useCase which does not require parameters
abstract class CoreNoneParamUseCase<Result> {
  Result call();
}

/// useCase which takes parameters
abstract class CoreUseCase<Param, Result> {
  Result call(Param param);
}

/// useCase which takes parameters, and return Future
abstract class CoreFutureUseCase<Param, Result>
    extends CoreUseCase<Param, Future<Result>> {
  Future<Result> call(Param param);
}

/// useCase which does not require params, but return Future
abstract class CoreFutureNoneParamUseCase<Result>
    extends CoreNoneParamUseCase<Future<Result>> {
  Future<Result> call();
}
