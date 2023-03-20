/// {@template dependency}
/// A dependency is injected as a part of the [Injector]
/// and will be lazily loaded when it is requested.
/// {@endtemplate}
class Dependency<T> {
  /// Responsible for returning an instance of the provided type, 'T'.
  final T Function() builder;
  T? _instance;

  /// Returns an instance of the provided type 'T'.
  /// It will either return an existing instance or
  /// build a new one if it does not exist.
  T get instance {
    _instance ??= builder();
    return _instance!;
  }

  Dependency({required this.builder});

  factory Dependency.value(T value) => Dependency(builder: () => value);
}

/// A container for [Dependencies] wich exposes APIs
/// to [inject] and [resolve] individual entries.
class Injector<T> {
  final _injection = <Type, Dependency<T>>{};

  /// [inject] adds the provided [dependency] to the [Injector].
  void inject<S extends T>(Dependency<S> dependency) => _injection.addAll({S: dependency});

  /// [resolve] retrieves the instance of the requested entry by type.
  /// Throws an ArgumentError if no instance is injected for the type.
  S resolve<S extends T>() {
    final value = _injection[S]?.instance;
    if (value == null) {
      throw ArgumentError("Nothing injected for type $S");
    }

    return value as S;
  }

  /// [resolveOrNull] retrieves the instance of the requested entry by
  /// type or null when not injected.
  S? resolveOrNull<S extends T>() => _injection[S]?.instance as S?;

  /// [close] removes all dependencies from the injector.
  void close() => _injection.clear();

  /// [items] returns all injected entries within the injector.
  List<T> get items => _injection.values.map((e) => e.instance).toList();
}
