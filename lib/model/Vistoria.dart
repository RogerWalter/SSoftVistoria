import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import '../firebase_options.dart';

class Vistoria{
  String _identificacao = "";
  String _data = "";
  String _condutor = "";
  String _vistoriador = "";
  String _veiculo = "";
  String _placa = "";
  String _link = "";

  Vistoria();

  Vistoria.fromJson(Map <dynamic, dynamic> json)
  {
    _identificacao = json['identificacao'];
    _data = json['data'];
    _condutor = json['condutor'];
    _vistoriador = json['vistoriador'];
    _veiculo = json['veiculo'];
    _placa = json['placa'];
    _link = json['link'];
  }

  Map<String, dynamic> toJson()
  {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['identificacao'] = this._identificacao;
    data['data'] = this._data;
    data['condutor'] = this._condutor;
    data['vistoriador'] = this._vistoriador;
    data['veiculo'] = this._veiculo;
    data['placa'] = this._placa;
    data['link'] = this._link;
    return data;
  }

  String get identificacao => _identificacao;

  set identificacao(String value) {
    _identificacao = value;
  }

  String get data => _data;

  set data(String value) {
    _data = value;
  }

  String get condutor => _condutor;

  String get link => _link;

  set link(String value) {
    _link = value;
  }

  String get placa => _placa;

  set placa(String value) {
    _placa = value;
  }

  String get veiculo => _veiculo;

  set veiculo(String value) {
    _veiculo = value;
  }

  String get vistoriador => _vistoriador;

  set vistoriador(String value) {
    _vistoriador = value;
  }

  set condutor(String value) {
    _condutor = value;
  }

  recuperar_vistorias(String filial) async{
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    List<Vistoria> _listaItens = [];
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child(filial).child("vistoria").get();
    if (snapshot.exists) {
      final json = snapshot.value as Map<dynamic, dynamic>;
      for(DataSnapshot ds in snapshot.children)
      {
        Vistoria _itemLista = Vistoria();
        final json = ds.value as Map<dynamic, dynamic>;
        _itemLista = Vistoria.fromJson(json);
        _listaItens.add(_itemLista);
      }
    }
    return _listaItens;
  }
}