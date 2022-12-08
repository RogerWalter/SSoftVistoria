import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:signature/signature.dart';
import 'package:ssoft_vistoria/model/Avaria.dart';
import 'package:ssoft_vistoria/tela/AbaAvarias.dart';
import 'package:ssoft_vistoria/tela/AbaConclusao.dart';
import 'package:ssoft_vistoria/tela/AbaDados.dart';
import 'package:ssoft_vistoria/tela/AbaExterior.dart';
import 'package:ssoft_vistoria/tela/AbaFim.dart';
import 'package:ssoft_vistoria/tela/AbaFreios.dart';
import 'package:ssoft_vistoria/tela/AbaInfosIniciais.dart';
import 'package:ssoft_vistoria/tela/AbaInterior.dart';
import 'package:ssoft_vistoria/tela/AbaLuzes.dart';
import 'package:ssoft_vistoria/tela/AbaMotor.dart';
import 'package:ssoft_vistoria/tela/AbaPneus.dart';

import '../model/Vistoria.dart';
import '../tela/AbaFerramentas.dart';
part 'Controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store{
  @observable
  String filial_atual = "SBS";

  @observable
  List<Widget> abas = <Widget>[
    AbaDados(),
    AbaInfosIniciais(),
    AbaFerramentas(),
    AbaLuzes(),
    AbaFreios(),
    AbaPneus(),
    AbaMotor(),
    AbaInterior(),
    AbaExterior(),
    AbaAvarias(),
    AbaConclusao(),
    AbaFim()
  ];
  @observable
  int indice_tela = 0;
  @action
  mudar_tela(int valor){
    indice_tela = indice_tela + valor;
  }
  @observable
  ObservableList<String> providencias_a_tomar = ObservableList();
  @action
  inserir_providencia(String nova){
    providencias_a_tomar.add(nova);
  }
  @action
  remover_providencia(String remover){
    providencias_a_tomar.remove(remover);
  }
  @action
  remover_providencia_indice(int indice){
    providencias_a_tomar.removeAt(indice);
  }

  //DADOS INICIAIS
  @observable
  String data = "";
  @observable
  String vistoriador = "";
  @observable
  String condutor = "";
  @observable
  String modelo_veiculo = "";
  @observable
  String placa = "";
  @action
  salvar_dados_iniciais(String dat, vis, con, mod, pla){
    data = dat;
    vistoriador = vis;
    condutor = con;
    modelo_veiculo = mod;
    placa = pla;
  }

  //INFORMAÇÕES INICIAIS
  @observable
  String infos_iniciais_doc_atualizado = "";
  @action
  infos_iniciais_altera_doc_atualizado(String novo){
    infos_iniciais_doc_atualizado = novo;
    String providencia = "ATUALIZAR DOCUMENTO DO VEÍCULO";
    if(novo == "SIM")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String infos_iniciais_multas = "";
  @action
  infos_iniciais_altera_multas(String novo){
    infos_iniciais_multas = novo;
    String providencia = "VERIFICAR MULTAS";
    if(novo == "NÃO")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String infos_iniciais_km_atual = "";
  @observable
  var infos_iniciais_foto_doc;
  @action
  infos_iniciais_salvar_foto_doc(var doc){
    infos_iniciais_foto_doc = doc;
  }
  @observable
  var infos_iniciais_foto_hod;
  @action
  infos_iniciais_salvar_foto_hod(var hod){
    infos_iniciais_foto_hod = hod;
  }
  @observable
  var infos_iniciais_foto_dianteira;
  @action
  infos_iniciais_salvar_foto_dia(var dia){
    infos_iniciais_foto_dianteira = dia;
  }
  @observable
  var infos_iniciais_foto_traseira;
  @action
  infos_iniciais_salvar_foto_tra(var tra){
    infos_iniciais_foto_traseira = tra;
  }
  @observable
  var infos_iniciais_foto_lat_dir;
  @action
  infos_iniciais_salvar_foto_latd(var latd){
    infos_iniciais_foto_lat_dir = latd;
  }
  @observable
  var infos_iniciais_foto_lat_esq;
  @action
  infos_iniciais_salvar_foto_late(var late){
    infos_iniciais_foto_lat_esq = late;
  }
  @observable
  var infos_iniciais_foto_interior;
  @action
  infos_iniciais_salvar_foto_inte(var inte){
    infos_iniciais_foto_interior = inte;
  }
  @observable
  var infos_iniciais_foto_porta_malas;
  @action
  infos_iniciais_salvar_foto_porma(var porma){
    infos_iniciais_foto_porta_malas = porma;
  }
  @action
  salvar_infos_iniciais(String km){
    infos_iniciais_km_atual = km;
  }

  //ABA LUZES
  @observable
  String luzes_lanterna = "";
  @action
  luzes_altera_lanterna(String novo){
    luzes_lanterna = novo;
    String providencia = "VERIFICAR LANTERNA";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String luzes_freio = "";
  @action
  luzes_altera_freio(String novo){
    luzes_freio = novo;
    String providencia = "VERIFICAR LUZ DE FREIO";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String luzes_placa = "";
  @action
  luzes_altera_placa(String novo){
    luzes_placa = novo;
    String providencia = "VERIFICAR LUZ DA PLACA";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String luzes_re = "";
  @action
  luzes_altera_re(String novo){
    luzes_re = novo;
    String providencia = "VERIFICAR LUZ DE RÉ";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String luzes_setas_dianteiras = "";
  @action
  luzes_altera_setas_dianteiras(String novo){
    luzes_setas_dianteiras = novo;
    String providencia = "VERIFICAR SETAS DIANTEIRAS";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String luzes_setas_traseiras = "";
  @action
  luzes_altera_setas_traseiras(String novo){
    luzes_setas_traseiras = novo;
    String providencia = "VERIFICAR SETAS TRASEIRAS";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String luzes_farol = "";
  @action
  luzes_altera_farol(String novo){
    luzes_farol = novo;
    String providencia = "VERIFICAR FAROL";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }

  //ABA FREIOS
  @observable
  String freios_de_mao = "";
  @action
  freios_altera_de_mao(String novo){
    freios_de_mao = novo;
    String providencia = "VERIFICAR FREIO DE MÃO";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String freios_pedal = "";
  @action
  freios_altera_pedal(String novo){
    freios_pedal = novo;
    String providencia = "VERIFICAR FREIOS DO PEDAL";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }

  //ABA PNEUS
  @observable
  String pneus_balanceamento = "";
  @action
  pneus_altera_balanceamento(String novo){
    pneus_balanceamento = novo;
    String providencia = "EFETUAR BALANCEAMENTO";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String pneus_frontal_direito = "";
  @action
  pneus_altera_frontal_direito(String novo){
    pneus_frontal_direito = novo;
    String providencia = "TROCAR PNEU FRONTAL DIREITO";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String pneus_frontal_esquerdo = "";
  @action
  pneus_altera_frontal_esquerdo(String novo){
    pneus_frontal_esquerdo= novo;
    String providencia = "TROCAR PNEU FRONTAL ESQUERDO";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String pneus_traseiro_direito = "";
  @action
  pneus_altera_traseiro_direito(String novo){
    pneus_traseiro_direito = novo;
    String providencia = "TROCAR PNEU TRASEIRO DIREITO";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String pneus_traseiro_esquerdo = "";
  @action
  pneus_altera_traseiro_esquerdo(String novo){
    pneus_traseiro_esquerdo = novo;
    String providencia = "TROCAR PNEU TRASEIRO ESQUERDO";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String pneus_step = "";
  @action
  pneus_altera_step(String novo){
    pneus_step = novo;
    String providencia = "TROCAR ESTEPE";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  var pneus_foto_fro_dir;
  @action
  pneus_salvar_foto_frod(var frod){
    pneus_foto_fro_dir = frod;
  }
  @observable
  var pneus_foto_fro_esq;
  @action
  pneus_salvar_foto_froe(var froe){
    pneus_foto_fro_esq = froe;
  }
  @observable
  var pneus_foto_tra_dir;
  @action
  pneus_salvar_foto_trad(var trad){
    pneus_foto_tra_dir = trad;
  }
  @observable
  var pneus_foto_tra_esq;
  @action
  pneus_salvar_foto_trae(var trae){
    pneus_foto_tra_esq = trae;
  }
  @observable
  var pneus_foto_step;
  @action
  pneus_salvar_foto_step(var step){
    pneus_foto_step = step;
  }

  //ABA MOTOR
  @observable
  String motor_aspecto = "";
  @action
  motor_altera_aspecto(String novo){
    motor_aspecto = novo;
    String providencia = "VERIFICAR E CORRIGIR ASPECTO DO MOTOR";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String motor_funcionamento = "";
  @action
  motor_altera_funcionamento(String novo){
    motor_funcionamento = novo;
    String providencia = "VERIFICAR O FUNCIONAMENTO DO MOTOR";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String motor_oleo = "";
  @action
  motor_altera_oleo(String novo){
    motor_oleo = novo;
    String providencia = "TROCAR O ÓLEO";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String motor_agua = "";
  @action
  motor_altera_agua(String novo){
    motor_agua = novo;
    String providencia = "COMPLETAR A ÁGUA";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String motor_fluido_freio = "";
  @action
  motor_altera_fluido_freio(String novo){
    motor_fluido_freio= novo;
    String providencia = "AJUSTAR O FLUÍDO DE FREIO";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String motor_bateria = "";
  @action
  motor_altera_bateria(String novo){
    motor_bateria= novo;
    String providencia = "TROCAR A BATERIA";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  var motor_foto_motor;
  @action
  motor_salvar_foto_motor(var moto){
    motor_foto_motor = moto;
  }
  @observable
  var motor_foto_etiqueta_oleo;
  @action
  motor_salvar_foto_etiqueta_oleo(var etiq){
    motor_foto_etiqueta_oleo = etiq;
  }
  @observable
  var motor_foto_bateria;
  @action
  motor_salvar_foto_bateria(var bate){
    motor_foto_bateria= bate;
  }

  //ABA INTERIOR DO VEÍCULO
  @observable
  String interior_limpeza = "";
  @action
  interior_altera_limpeza(String novo){
    interior_limpeza = novo;
    String providencia = "LIMPAR O INTERIOR DO VEÍCULO";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String interior_cinto = "";
  @action
  interior_altera_cinto(String novo){
    interior_cinto = novo;
    String providencia = "VERIFICAR O CINTO DE SEGURANÇA";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String interior_painel = "";
  @action
  interior_altera_painel(String novo){
    interior_painel = novo;
    String providencia = "VERIFICAR O PAINEL DO VEÍCULO";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String interior_tapetes = "";
  @action
  interior_altera_tapetes(String novo){
    interior_tapetes = novo;
    String providencia = "SUBSTITUIR TAPETES DO VEÍCULO";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String interior_bancos = "";
  @action
  interior_altera_bancos(String novo){
    interior_bancos = novo;
    String providencia = "VERIFICAR OS BANCOS DO VEÍCULO";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String interior_macaco = "";
  @action
  interior_altera_macaco(String novo){
    interior_macaco = novo;
    String providencia = "SUBSTITUIR O MACACO";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }

  //ABA EXTERIOR DO VEÍCULO
  @observable
  String exterior_limpeza = "";
  @action
  exterior_altera_limpeza(String novo){
    exterior_limpeza = novo;
    String providencia = "LIMPAR O EXTERIOR DO VEÍCULO";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String exterior_ima = "";
  @action
  exterior_altera_ima(String novo){
    exterior_ima = novo;
    String providencia = "SUBSTITUIR O IMÃ DO VEÍCULO";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String exterior_suspensao = "";
  @action
  exterior_altera_suspensao(String novo){
    exterior_suspensao = novo;
    String providencia = "VERIFICAR A SUSPENSÃO";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String exterior_escapamento = "";
  @action
  exterior_altera_escapamento(String novo){
    exterior_escapamento = novo;
    String providencia = "VERIFICAR O ESCAPAMENTO";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String exterior_trava = "";
  @action
  exterior_altera_trava(String novo){
    exterior_trava = novo;
    String providencia = "VERIFICAR A TRAVA DE SEGURANÇA";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String exterior_fechaduras = "";
  @action
  exterior_altera_fechaduras(String novo){
    exterior_fechaduras = novo;
    String providencia = "VERIFICAR AS FECHADURAS DAS PORTAS";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String exterior_fechadura_tanque = "";
  @action
  exterior_altera_fechadura_tanque(String novo){
    exterior_fechadura_tanque = novo;
    String providencia = "VERIFICAR A FECHADURA DO TANQUE";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String exterior_limpador_dianteiro = "";
  @action
  exterior_altera_limpador_dianteiro(String novo){
    exterior_limpador_dianteiro = novo;
    String providencia = "VERIFICAR O LIMPADOR DIANTEIRO";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String exterior_limpador_traseiro = "";
  @action
  exterior_altera_limpador_traseiro(String novo){
    exterior_limpador_traseiro = novo;
    String providencia = "VERIFICAR O LIMPADOR TRASEIRO";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String exterior_parabrisa = "";
  @action
  exterior_altera_parabrisa(String novo){
    exterior_parabrisa = novo;
    String providencia = "VERIFICAR O PARA-BRISA";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String exterior_rack = "";
  @action
  exterior_altera_rack(String novo){
    exterior_rack = novo;
    String providencia = "VERIFICAR O RACK PARA ESCADAS";
    if(novo == "OK")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }

  //ABA AVARIAS
  @observable
  ObservableList<Avaria> avaria_lista = ObservableList();
  @observable
  String inserir_avaria_local = "";
  @observable
  String inserir_avaria_tipo = "";
  @observable
  String inserir_avaria_comentario = "";
  @observable
  var inserir_avaria_foto_avaria;
  @action
  inserir_avaria_salvar_foto_avaria(var avar){
    inserir_avaria_foto_avaria= avar;
  }
  @action
  inserir_avaria_salvar_nova_avaria(String loc, tip, com){
    Avaria nova = Avaria();
    nova.local = loc;
    nova.tipo = tip;
    nova.comentario = com;
    nova.foto = inserir_avaria_foto_avaria;
    avaria_lista.add(nova);
    inserir_avaria_foto_avaria = null;
  }
  @action
  inserir_avaria_remover_avaria(int indice){
    avaria_lista.removeAt(indice);
  }

  //ABA CONCLUSÃO
  @observable
  SignatureController conclusao_controller_assinatura = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.red,
    exportBackgroundColor: Colors.white,
    exportPenColor: Colors.black,
  );
  @observable
  var conclusao_imagem_assinatura;
  @observable
  String conclusao_obs_condutor = "";
  @action
  conclusao_salvar_dados(String obs, var ass){
    conclusao_obs_condutor = obs;
    conclusao_imagem_assinatura = ass;
  }

  //ABA FERRAMENTAS
  @observable
  String ferramentas_furadeira = "";
  @action
  ferramentas_altera_furadeira(String novo){
    ferramentas_furadeira = novo;
    String providencia = "ENTREGAR NOVA FURADEIRA";
    if(novo == "OK" || novo == "NOVA")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String ferramentas_parafusadeira = "";
  @action
  ferramentas_altera_parafusadeira(String novo){
    ferramentas_parafusadeira = novo;
    String providencia = "ENTREGAR NOVA PARAFUSADEIRA";
    if(novo == "OK" || novo == "NOVA")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String ferramentas_escada_fibra = "";
  @action
  ferramentas_altera_escada_fibra(String novo){
    ferramentas_escada_fibra = novo;
    String providencia = "ENTREGAR NOVA ESCADA DE FIBRA";
    if(novo == "OK" || novo == "NOVA")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String ferramentas_escada_madeira = "";
  @action
  ferramentas_altera_escada_madeira(String novo){
    ferramentas_escada_madeira = novo;
    String providencia = "ENTREGAR NOVA ESCADA DE MADEIRA";
    if(novo == "OK" || novo == "NOVA")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String ferramentas_cones = "";
  @action
  ferramentas_altera_cones(String novo){
    ferramentas_cones = novo;
    String providencia = "ENTREGAR NOVOS CONES";
    if(novo == "OK" || novo == "NOVOS")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String ferramentas_alicates = "";
  @action
  ferramentas_altera_alicates(String novo){
    ferramentas_alicates = novo;
    String providencia = "ENTREGAR NOVO(S) ALICATE(S)";
    if(novo == "OK" || novo == "NOVOS")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String ferramentas_kit_conector = "";
  @action
  ferramentas_altera_kit_conector(String novo){
    ferramentas_kit_conector = novo;
    String providencia = "ENTREGAR NOVO KIT CONECTORIZAÇÃO";
    if(novo == "OK" || novo == "NOVO")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String ferramentas_extensao = "";
  @action
  ferramentas_altera_extensao(String novo){
    ferramentas_extensao = novo;
    String providencia = "ENTREGAR NOVA EXTENSÃO ELÉTRICA";
    if(novo == "OK" || novo == "NOVA")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String ferramentas_cinto = "";
  @action
  ferramentas_altera_cinto(String novo){
    ferramentas_cinto = novo;
    String providencia = "ENTREGAR NOVO CINTO";
    if(novo == "OK" || novo == "NOVO")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String ferramentas_luva_bt = "";
  @action
  ferramentas_altera_luva_bt(String novo){
    ferramentas_luva_bt = novo;
    String providencia = "ENTREGAR NOVA LUVA DE BT";
    if(novo == "OK" || novo == "NOVA")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String ferramentas_linha_vida = "";
  @action
  ferramentas_altera_linha_vida(String novo){
    ferramentas_linha_vida = novo;
    String providencia = "ENTREGAR NOVA LINHA DE VIDA";
    if(novo == "OK" || novo == "NOVA")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }
  @observable
  String ferramentas_fusimec = "";
  @action
  ferramentas_altera_fusimec(String novo){
    ferramentas_fusimec = novo;
    String providencia = "ENTREGAR NOVA FUSIMEC";
    if(novo == "OK" || novo == "NOVA")
      remover_providencia(providencia);
    else
      inserir_providencia(providencia);
  }

  //TELA VISUALIZAR VISTORIAS
  @observable
  List<Vistoria> lista_vistorias = [];

  @observable
  ObservableList<Vistoria> lista_pesquisa_vistorias = ObservableList();

  @action
  preenche_lista_vistoria() async{
    Vistoria item = Vistoria();
    lista_vistorias.clear();
    lista_vistorias = await item.recuperar_vistorias(filial_atual);
  }
  @action
  adiciona_item_lista_pesquisa(Vistoria add) async{
    lista_pesquisa_vistorias.add(add);
  }

  //FINALIZAR VISTORIA
  @observable
  bool vistoria_finalizada = false;
  @action
  alterar_vistoria_finalizada(bool valor){
    vistoria_finalizada = valor;
    if(valor){
      data = "";
      vistoriador = "";
      condutor = "";
      modelo_veiculo = "";
      placa = "";
      indice_tela = 0;
      providencias_a_tomar.clear();
      infos_iniciais_doc_atualizado = "";
      infos_iniciais_multas = "";
      infos_iniciais_km_atual = "";
      infos_iniciais_foto_doc = null;
      infos_iniciais_foto_hod = null;
      infos_iniciais_foto_dianteira = null;
      infos_iniciais_foto_traseira = null;
      infos_iniciais_foto_lat_dir = null;
      infos_iniciais_foto_lat_esq = null;
      infos_iniciais_foto_interior = null;
      infos_iniciais_foto_porta_malas = null;
      luzes_lanterna = "";
      luzes_freio = "";
      luzes_placa = "";
      luzes_re = "";
      luzes_setas_dianteiras = "";
      luzes_setas_traseiras = "";
      luzes_farol = "";
      freios_de_mao = "";
      freios_pedal = "";
      pneus_balanceamento = "";
      pneus_frontal_direito = "";
      pneus_frontal_esquerdo = "";
      pneus_traseiro_direito = "";
      pneus_traseiro_esquerdo = "";
      pneus_step = "";
      pneus_foto_fro_dir = null;
      pneus_foto_fro_esq = null;
      pneus_foto_tra_dir = null;
      pneus_foto_tra_esq = null;
      pneus_foto_step = null;
      motor_aspecto = "";
      motor_funcionamento = "";
      motor_oleo = "";
      motor_agua = "";
      motor_fluido_freio = "";
      motor_bateria = "";
      motor_foto_motor = null;
      motor_foto_etiqueta_oleo = null;
      motor_foto_bateria = null;
      interior_limpeza = "";
      interior_cinto = "";
      interior_painel = "";
      interior_tapetes = "";
      interior_bancos = "";
      interior_macaco = "";
      exterior_limpeza = "";
      exterior_ima = "";
      exterior_suspensao = "";
      exterior_escapamento = "";
      exterior_trava = "";
      exterior_fechaduras = "";
      exterior_fechadura_tanque = "";
      exterior_limpador_dianteiro = "";
      exterior_limpador_traseiro = "";
      exterior_parabrisa = "";
      exterior_rack = "";
      avaria_lista.clear();
      conclusao_controller_assinatura.clear();
      conclusao_imagem_assinatura = null;
      conclusao_obs_condutor = "";
      ferramentas_furadeira = "";
      ferramentas_parafusadeira = "";
      ferramentas_escada_fibra = "";
      ferramentas_escada_madeira = "";
      ferramentas_cones = "";
      ferramentas_alicates = "";
      ferramentas_kit_conector = "";
      ferramentas_extensao = "";
      ferramentas_cinto = "";
      ferramentas_luva_bt = "";
      ferramentas_linha_vida = "";
      ferramentas_fusimec = "";
    }
  }
}