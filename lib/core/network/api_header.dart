class ApiHeader {
  ApiHeader._();

  static Map<String, dynamic> header() {
    return {'Content-Type': 'application/json', 'Accept': 'application/json'};
  }
}
