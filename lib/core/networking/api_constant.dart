class ApiConstant {
  static const String baseUrl = 'https://opentdb.com';
  static const String endPoint = '/api.php';
  static const Map<String, String> queryParameters = {
    "amount": "15",
    "category": "18",
    "difficulty": "medium",
    "type": "multiple",
  };
  static const Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "User-Agent": "Mozilla/5.0",
  };
  static const int timeOut = 20000;
}
