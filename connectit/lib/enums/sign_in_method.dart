// ignore_for_file: constant_identifier_names

enum SignInMethod {
  GOOGLE(domain: 'google.com'),
  APPLE(domain: 'apple.com');

  final String domain;

  const SignInMethod({
    required this.domain,
  });
}
