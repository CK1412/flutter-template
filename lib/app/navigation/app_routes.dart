enum AppRoutes {
  root(name: 'root', path: '/'),
  home(name: 'home', path: '/home'),
  login(name: 'login', path: '/login'),
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
