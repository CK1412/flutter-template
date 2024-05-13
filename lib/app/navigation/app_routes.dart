enum AppRoute {
  root(name: 'root', path: '/'),
  home(name: 'home', path: '/home/:tab'),
  login(name: 'login', path: '/accounts/login'),
  signUp(name: 'signUp', path: '/accounts/signup'),
  details(name: 'details', path: 'details'),
  settings(name: 'settings', path: '/settings');

  /// Represents the route name
  ///
  /// Example: `AppRoute.home.name`
  /// Returns: 'home'
  final String name;

  /// Represents the route path
  ///
  /// Example: `AppRoute.home.path`
  /// Returns: '/home'
  final String path;

  const AppRoute({required this.name, required this.path});

  @override
  String toString() => name;
}

extension AppRouteEx on AppRoute {
  String get initPath {
    return switch (this) {
      AppRoute.home => '/home/0',
      _ => '/',
    };
  }
}
