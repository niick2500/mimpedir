class Restaurante {

  int? _codigo;
  String? _latitude;
  String? _nome;
  String? _longitude;
  String? _proprietario;
  int? _tipoCulinaria;

  int? get codigo => _codigo;
  String? get nome => _nome;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get propietario => _proprietario;
  int? get tipoCulinaria => _tipoCulinaria;

  set codigo(int? valor) => _codigo = valor;
  set nome(String? valor) => _nome = valor;
  set latitude(String? valor) => _latitude = valor;
  set longitude(String? valor) => _longitude = valor;
  set proprietario(String? valor) => _proprietario = valor;
  set tipoCulinaria(int? valor) => _tipoCulinaria = valor;

  Restaurante({int? codigo, String? nome, String? latitude, String? longitude, String? proprietario, int? tipoCulinaria}) {
    _codigo = codigo;
    _nome = nome;
    _latitude = latitude;
    _longitude = longitude;
    _proprietario = proprietario;
    _tipoCulinaria = tipoCulinaria;
  }
}