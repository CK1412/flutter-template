enum AppRoutes {
  root(name: 'root', path: '/'),
  home(name: 'home', path: '/home/:tab'),
  login(name: 'login', path: '/accounts/login'),
  signUp(name: 'signUp', path: '/accounts/signup'),
  details(name: 'details', path: 'details');

  /// Represents the route name
  ///
  /// Example: `AppRoutes.home.name`
  /// Returns: 'home'
  final String name;

  /// Represents the route path
  ///
  /// Example: `AppRoutes.home.path`
  /// Returns: '/home'
  final String path;

  const AppRoutes({required this.name, required this.path});

  @override
  String toString() => name;
}

extension AppRoutesEx on AppRoutes {
  String get initPath {
    return switch (this) {
      AppRoutes.home => '/home/0',
      _ => '/',
    };
  }
}
