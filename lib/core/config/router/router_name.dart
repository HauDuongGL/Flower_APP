class RoutesName {
  static RoutesGen get login => const RoutesGen('login');
  static RoutesGen get register => const RoutesGen('register');
  static RoutesGen get forgotPassword => const RoutesGen('forgotPassword');
  static RoutesGen get welcome => const RoutesGen('welcome', '');
  static RoutesGen get main => const RoutesGen('main');
  static RoutesGen get newsDetail => const RoutesGen('newsDetail');
  static RoutesGen get home => const RoutesGen('home', '');
  static RoutesGen get screenOne => const RoutesGen('screenOne');
  static RoutesGen get bottomSheet =>
      const RoutesGen('bottomSheet', 'bottomSheet');
}

class RoutesGen {
  final String value;
  final String? pathValue;
  const RoutesGen(this.value, [this.pathValue]);

  String get name => value;
  String get path => '/${pathValue ?? value}';
}
