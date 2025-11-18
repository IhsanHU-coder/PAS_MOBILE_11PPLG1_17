class ClientNetwork {
  static const String baseUrl = 'https://mediadwi.com/api/';
  static const String loginEndpoint = 'latihan/login';
  static const String registerEndpoint = 'latihan/register-user';
  
  static String get login => baseUrl + loginEndpoint;
  static String get register => baseUrl + registerEndpoint;
}
