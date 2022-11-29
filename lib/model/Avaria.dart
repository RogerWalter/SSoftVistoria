class Avaria{
  String _local = "";
  String _tipo = "";
  var _foto;
  String _comentario = "";

  Avaria();

  String get comentario => _comentario;

  set comentario(String value) {
    _comentario = value;
  }

  get foto => _foto;

  set foto(value) {
    _foto = value;
  }

  String get tipo => _tipo;

  set tipo(String value) {
    _tipo = value;
  }

  String get local => _local;

  set local(String value) {
    _local = value;
  }
}