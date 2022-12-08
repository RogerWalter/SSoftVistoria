import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gsheets/gsheets.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';
import '../firebase_options.dart';
import '../model/Vistoria.dart';
import '../util/Controller.dart';
import '../util/Planilha.dart';
import '../util/Util.dart';
import 'package:intl/intl.dart';
import 'Principal.dart';
class AbaFim extends StatefulWidget {
  const AbaFim({Key? key}) : super(key: key);

  @override
  State<AbaFim> createState() => _AbaFimState();
}

class _AbaFimState extends State<AbaFim> {
  Util cores = Util();
  Controller controller_mobx = Controller();
  var pdf_gerado;
  Planilha planilha = Planilha();

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    controller_mobx = Provider.of(context);
  }
  @override
  Widget build(BuildContext context) {
    finalizar_vistoria();
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          DefaultTextStyle(
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            child: Text(
              "Salvando dados e gerando relatório...",
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 16)),
          CircularProgressIndicator(
            color: cores.cor_app_bar,
            backgroundColor: cores.laranja_teccel,
            strokeWidth: 8,
          )
        ],
      ),
    );
  }

  finalizar_vistoria() async{
    await gerar_pdf();
    await salvar_dados_vistoria_firebase();
    /*Controller controller_novo = Controller();
    controller_mobx = controller_novo;*/
    controller_mobx.alterar_vistoria_finalizada(true);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Main()
        )
    );
  }

  gerar_pdf() async{
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final font = await PdfGoogleFonts.nunitoExtraLight();
    final font_bold = await PdfGoogleFonts.nunitoExtraBold();
    final image = await imageFromAssetBundle('images/logo.png');
    DateTime now = DateTime.now();
    String data_relatorio = DateFormat('dd/MM/yyyy kk:mm:ss').format(now);

    pdf.addPage(
        pw.MultiPage(
            maxPages: 10000,
            pageFormat: PdfPageFormat.a4,
            margin: pw.EdgeInsets.all(8),
            build: (context) => [
              pw.Align(
                alignment: pw.Alignment.topCenter,
                child: pw.Container(
                  width: double.infinity,
                  height: 70,
                  child: pw.Image(image, fit: pw.BoxFit.scaleDown),
                ),
              ),
              pw.Align(
                alignment: pw.Alignment.topCenter,
                child: pw.Padding(
                  padding: pw.EdgeInsets.only(top: 16, bottom: 8),
                  child: pw.Container(
                    child: pw.FittedBox(
                      child: pw.Text("Vistoria Veícular", style: pw.TextStyle(font: font, fontSize: 28)),
                    ),
                  ),
                ),
              ),
              pw.Align(
                alignment: pw.Alignment.topCenter,
                child: pw.Padding(
                  padding: pw.EdgeInsets.only(top: 8, bottom: 8),
                  child: pw.SizedBox(
                    child: pw.FittedBox(
                      child: pw.Text("1 - DADOS DA VISTORIA",
                          style: pw.TextStyle(font: font, fontSize: 18),
                          textAlign: pw.TextAlign.center
                      ),
                    ),
                  ),
                ),
              ),
              pw.Padding(
                padding: pw.EdgeInsets.only(top: 8, bottom: 8),
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    children: [
                      pw.Container(
                          width: 250,
                          child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.center,
                              children: [
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "DATA DA VISTORIA",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "VISTORIADOR",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "CONDUTOR",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "MODELO DO VEÍCULO",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "PLACA DO VEÍCULO",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                )
                              ]
                          )
                      ),
                      pw.Container(
                          width: 250,
                          child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.center,
                              children: [
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.data,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.vistoriador,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.condutor,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.modelo_veiculo,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.placa,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                              ]
                          )
                      )
                    ]
                ),
              ),
              pw.Align(
                alignment: pw.Alignment.topCenter,
                child: pw.Padding(
                  padding: pw.EdgeInsets.only(top: 8, bottom: 8),
                  child: pw.SizedBox(
                    child: pw.FittedBox(
                      child: pw.Text("2 - INFORMAÇÕES GERAIS",
                          style: pw.TextStyle(font: font, fontSize: 18),
                          textAlign: pw.TextAlign.center
                      ),
                    ),
                  ),
                ),
              ),
              pw.Padding(
                padding: pw.EdgeInsets.only(top: 8, bottom: 8),
                child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.Container(
                              width: 250,
                              child: pw.Column(
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                                  children: [
                                    pw.Container(
                                        width: 250,
                                        decoration: pw.BoxDecoration(
                                          border: pw.Border.all(
                                              color: PdfColor.fromHex("#000000"),
                                              width: 1.0
                                          ),
                                        ),
                                        child: pw.Padding(
                                          padding: pw.EdgeInsets.all(4),
                                          child: pw.Text(
                                              "DOCUMENTO ATUALIZADO?",
                                              style: pw.TextStyle(font: font_bold, fontSize: 12),
                                              textAlign: pw.TextAlign.left
                                          ),
                                        )
                                    ),
                                    pw.Container(
                                        width: 250,
                                        decoration: pw.BoxDecoration(
                                          border: pw.Border.all(
                                              color: PdfColor.fromHex("#000000"),
                                              width: 1.0
                                          ),
                                        ),
                                        child: pw.Padding(
                                          padding: pw.EdgeInsets.all(4),
                                          child: pw.Text(
                                              "MULTAS PARA VERIFICAR?",
                                              style: pw.TextStyle(font: font_bold, fontSize: 12),
                                              textAlign: pw.TextAlign.left
                                          ),
                                        )
                                    ),
                                    pw.Container(
                                        width: 250,
                                        decoration: pw.BoxDecoration(
                                          border: pw.Border.all(
                                              color: PdfColor.fromHex("#000000"),
                                              width: 1.0
                                          ),
                                        ),
                                        child: pw.Padding(
                                          padding: pw.EdgeInsets.all(4),
                                          child: pw.Text(
                                              "KM ATUAL",
                                              style: pw.TextStyle(font: font_bold, fontSize: 12),
                                              textAlign: pw.TextAlign.left
                                          ),
                                        )
                                    ),
                                  ]
                              )
                          ),
                          pw.Container(
                              width: 250,
                              child: pw.Column(
                                  mainAxisAlignment: pw.MainAxisAlignment.start,
                                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                                  children: [
                                    pw.Container(
                                        width: 250,
                                        decoration: pw.BoxDecoration(
                                          border: pw.Border.all(
                                              color: PdfColor.fromHex("#000000"),
                                              width: 1.0
                                          ),
                                        ),
                                        child: pw.Padding(
                                          padding: pw.EdgeInsets.all(4),
                                          child: pw.Text(
                                              controller_mobx.infos_iniciais_doc_atualizado,
                                              style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                              textAlign: pw.TextAlign.left
                                          ),
                                        )
                                    ),
                                    pw.Container(
                                        width: 250,
                                        decoration: pw.BoxDecoration(
                                          border: pw.Border.all(
                                              color: PdfColor.fromHex("#000000"),
                                              width: 1.0
                                          ),
                                        ),
                                        child: pw.Padding(
                                          padding: pw.EdgeInsets.all(4),
                                          child: pw.Text(
                                              controller_mobx.infos_iniciais_multas,
                                              style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                              textAlign: pw.TextAlign.left
                                          ),
                                        )
                                    ),
                                    pw.Container(
                                        width: 250,
                                        decoration: pw.BoxDecoration(
                                          border: pw.Border.all(
                                              color: PdfColor.fromHex("#000000"),
                                              width: 1.0
                                          ),
                                        ),
                                        child: pw.Padding(
                                          padding: pw.EdgeInsets.all(4),
                                          child: pw.Text(
                                              controller_mobx.infos_iniciais_km_atual,
                                              style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                              textAlign: pw.TextAlign.left
                                          ),
                                        )
                                    ),
                                  ]
                              )
                          )
                        ]
                    ),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.Container(
                              width: 125,
                              decoration: pw.BoxDecoration(
                                border: pw.Border.all(
                                    color: PdfColor.fromHex("#000000"),
                                    width: 1.0
                                ),
                              ),
                              child: pw.Column(
                                  children: [
                                    pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "DOCUMENTO",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    ),
                                    pw.Align(
                                      alignment: pw.Alignment.topCenter,
                                      child: pw.Padding(
                                        padding: pw.EdgeInsets.all(4),
                                        child: pw.Container(
                                            height: 150,
                                            child: pw.Image(pw.MemoryImage(controller_mobx.infos_iniciais_foto_doc.readAsBytesSync()), fit: pw.BoxFit.scaleDown)
                                        ),
                                      ),
                                    ),
                                  ]
                              )
                          ),
                          pw.Container(
                              width: 125,
                              decoration: pw.BoxDecoration(
                                border: pw.Border.all(
                                    color: PdfColor.fromHex("#000000"),
                                    width: 1.0
                                ),
                              ),
                              child: pw.Column(
                                  children: [
                                    pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "HODÔMETRO",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    ),
                                    pw.Align(
                                      alignment: pw.Alignment.topCenter,
                                      child: pw.Padding(
                                        padding: pw.EdgeInsets.all(4),
                                        child: pw.Container(
                                            height: 150,
                                            child: pw.Image(pw.MemoryImage(controller_mobx.infos_iniciais_foto_hod.readAsBytesSync()), fit: pw.BoxFit.scaleDown)
                                        ),
                                      ),
                                    ),
                                  ]
                              )
                          ),
                          pw.Container(
                              width: 125,
                              decoration: pw.BoxDecoration(
                                border: pw.Border.all(
                                    color: PdfColor.fromHex("#000000"),
                                    width: 1.0
                                ),
                              ),
                              child: pw.Column(
                                  children: [
                                    pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "DIANTEIRA",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    ),
                                    pw.Align(
                                      alignment: pw.Alignment.topCenter,
                                      child: pw.Padding(
                                        padding: pw.EdgeInsets.all(4),
                                        child: pw.Container(
                                            height: 150,
                                            child: pw.Image(pw.MemoryImage(controller_mobx.infos_iniciais_foto_dianteira.readAsBytesSync()), fit: pw.BoxFit.scaleDown)
                                        ),
                                      ),
                                    ),
                                  ]
                              )
                          ),
                          pw.Container(
                              width: 125,
                              decoration: pw.BoxDecoration(
                                border: pw.Border.all(
                                    color: PdfColor.fromHex("#000000"),
                                    width: 1.0
                                ),
                              ),
                              child: pw.Column(
                                  children: [
                                    pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "TRASEIRA",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    ),
                                    pw.Align(
                                      alignment: pw.Alignment.topCenter,
                                      child: pw.Padding(
                                        padding: pw.EdgeInsets.all(4),
                                        child: pw.Container(
                                            height: 150,
                                            child: pw.Image(pw.MemoryImage(controller_mobx.infos_iniciais_foto_traseira.readAsBytesSync()), fit: pw.BoxFit.scaleDown)
                                        ),
                                      ),
                                    ),
                                  ]
                              )
                          ),
                        ]
                    ),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.Container(
                              width: 125,
                              decoration: pw.BoxDecoration(
                                border: pw.Border.all(
                                    color: PdfColor.fromHex("#000000"),
                                    width: 1.0
                                ),
                              ),
                              child: pw.Column(
                                  children: [
                                    pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "INTERIOR",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    ),
                                    pw.Align(
                                      alignment: pw.Alignment.topCenter,
                                      child: pw.Padding(
                                        padding: pw.EdgeInsets.all(4),
                                        child: pw.Container(
                                            height: 150,
                                            child: pw.Image(pw.MemoryImage(controller_mobx.infos_iniciais_foto_interior.readAsBytesSync()), fit: pw.BoxFit.scaleDown)
                                        ),
                                      ),
                                    ),
                                  ]
                              )
                          ),
                          pw.Container(
                              width: 125,
                              decoration: pw.BoxDecoration(
                                border: pw.Border.all(
                                    color: PdfColor.fromHex("#000000"),
                                    width: 1.0
                                ),
                              ),
                              child: pw.Column(
                                  children: [
                                    pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "PORTA-MALAS",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    ),
                                    pw.Align(
                                      alignment: pw.Alignment.topCenter,
                                      child: pw.Padding(
                                        padding: pw.EdgeInsets.all(4),
                                        child: pw.Container(
                                            height: 150,
                                            child: pw.Image(pw.MemoryImage(controller_mobx.infos_iniciais_foto_porta_malas.readAsBytesSync()), fit: pw.BoxFit.scaleDown)
                                        ),
                                      ),
                                    ),
                                  ]
                              )
                          ),
                          pw.Container(
                              width: 125,
                              decoration: pw.BoxDecoration(
                                border: pw.Border.all(
                                    color: PdfColor.fromHex("#000000"),
                                    width: 1.0
                                ),
                              ),
                              child: pw.Column(
                                  children: [
                                    pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "LAT. DIREITA",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    ),
                                    pw.Align(
                                      alignment: pw.Alignment.topCenter,
                                      child: pw.Padding(
                                        padding: pw.EdgeInsets.all(4),
                                        child: pw.Container(
                                            height: 150,
                                            child: pw.Image(pw.MemoryImage(controller_mobx.infos_iniciais_foto_lat_dir.readAsBytesSync()), fit: pw.BoxFit.scaleDown)
                                        ),
                                      ),
                                    ),
                                  ]
                              )
                          ),
                          pw.Container(
                              width: 125,
                              decoration: pw.BoxDecoration(
                                border: pw.Border.all(
                                    color: PdfColor.fromHex("#000000"),
                                    width: 1.0
                                ),
                              ),
                              child: pw.Column(
                                  children: [
                                    pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "LAT. ESQUERDA",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    ),
                                    pw.Align(
                                      alignment: pw.Alignment.topCenter,
                                      child: pw.Padding(
                                        padding: pw.EdgeInsets.all(4),
                                        child: pw.Container(
                                            height: 150,
                                            child: pw.Image(pw.MemoryImage(controller_mobx.infos_iniciais_foto_lat_esq.readAsBytesSync()), fit: pw.BoxFit.scaleDown)
                                        ),
                                      ),
                                    ),
                                  ]
                              )
                          ),
                        ]
                    ),
                  ]
                )
              ),
              pw.Align(
                alignment: pw.Alignment.topCenter,
                child: pw.Padding(
                  padding: pw.EdgeInsets.only(top: 8, bottom: 8),
                  child: pw.SizedBox(
                    child: pw.FittedBox(
                      child: pw.Text("3 - FERRAMENTAS DE TRABALHO",
                          style: pw.TextStyle(font: font, fontSize: 18),
                          textAlign: pw.TextAlign.center
                      ),
                    ),
                  ),
                ),
              ),
              pw.Padding(
                padding: pw.EdgeInsets.only(top: 8, bottom: 8),
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    children: [
                      pw.Container(
                          width: 250,
                          child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.center,
                              children: [
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "FURADEIRA",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "PARAFUSADEIRA",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "ESCADA DE FIBRA",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "ESCADA DE MADEIRA",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "CONES",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "ALICATES",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "KIT CONECTORIZAÇÃO",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "FUSIMEC",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "EXTENSÃO ELÉTRICA",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "CINTO",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "LUVA DE BT",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "LINHA DE VIDA",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                              ]
                          )
                      ),
                      pw.Container(
                          width: 250,
                          child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.center,
                              children: [
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.ferramentas_furadeira,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.ferramentas_parafusadeira,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.ferramentas_escada_fibra,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.ferramentas_escada_madeira,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.ferramentas_cones,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.ferramentas_alicates,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.ferramentas_kit_conector,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.ferramentas_fusimec,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.ferramentas_extensao,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.ferramentas_cinto,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.ferramentas_luva_bt,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.ferramentas_linha_vida,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                              ]
                          )
                      )
                    ]
                ),
              ),
              pw.Align(
                alignment: pw.Alignment.topCenter,
                child: pw.Padding(
                  padding: pw.EdgeInsets.only(top: 8, bottom: 8),
                  child: pw.SizedBox(
                    child: pw.FittedBox(
                      child: pw.Text("4 - LUZES DO VEÍCULO",
                          style: pw.TextStyle(font: font, fontSize: 18),
                          textAlign: pw.TextAlign.center
                      ),
                    ),
                  ),
                ),
              ),
              pw.Padding(
                padding: pw.EdgeInsets.only(top: 8, bottom: 8),
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    children: [
                      pw.Container(
                          width: 250,
                          child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.center,
                              children: [
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "LANTERNA",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "LUZ DE FREIO",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "LUZ DA PLACA",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "LUZ DE RÉ",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "SETAS DIANTEIRAS",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "SETAS TRASEIRAS",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "FAROL",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                )
                              ]
                          )
                      ),
                      pw.Container(
                          width: 250,
                          child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.center,
                              children: [
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.luzes_lanterna,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.luzes_freio,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.luzes_placa,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.luzes_re,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.luzes_setas_dianteiras,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.luzes_setas_traseiras,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.luzes_farol,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                              ]
                          )
                      )
                    ]
                ),
              ),
              pw.Align(
                alignment: pw.Alignment.topCenter,
                child: pw.Padding(
                  padding: pw.EdgeInsets.only(top: 8, bottom: 8),
                  child: pw.SizedBox(
                    child: pw.FittedBox(
                      child: pw.Text("5 - FREIOS DO VEÍCULO",
                          style: pw.TextStyle(font: font, fontSize: 18),
                          textAlign: pw.TextAlign.center
                      ),
                    ),
                  ),
                ),
              ),
              pw.Padding(
                padding: pw.EdgeInsets.only(top: 8, bottom: 8),
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    children: [
                      pw.Container(
                          width: 250,
                          child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.center,
                              children: [
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "FREIO DE MÃO",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "FREIO DO PEDAL",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                              ]
                          )
                      ),
                      pw.Container(
                          width: 250,
                          child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.center,
                              children: [
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.freios_de_mao,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.freios_pedal,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                              ]
                          )
                      )
                    ]
                ),
              ),
              pw.NewPage(),
              pw.Align(
                alignment: pw.Alignment.topCenter,
                child: pw.Padding(
                  padding: pw.EdgeInsets.only(top: 8, bottom: 8),
                  child: pw.SizedBox(
                    child: pw.FittedBox(
                      child: pw.Text("6 - PNEUS DO VEÍCULO",
                          style: pw.TextStyle(font: font, fontSize: 18),
                          textAlign: pw.TextAlign.center
                      ),
                    ),
                  ),
                ),
              ),
              pw.Padding(
                  padding: pw.EdgeInsets.only(top: 8, bottom: 8),
                  child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                            children: [
                              pw.Container(
                                  width: 250,
                                  child: pw.Column(
                                      mainAxisAlignment: pw.MainAxisAlignment.start,
                                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                                      children: [
                                        pw.Container(
                                            width: 250,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(
                                                  color: PdfColor.fromHex("#000000"),
                                                  width: 1.0
                                              ),
                                            ),
                                            child: pw.Padding(
                                              padding: pw.EdgeInsets.all(4),
                                              child: pw.Text(
                                                  "BALANCEAMENTO",
                                                  style: pw.TextStyle(font: font_bold, fontSize: 12),
                                                  textAlign: pw.TextAlign.left
                                              ),
                                            )
                                        ),
                                        pw.Container(
                                            width: 250,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(
                                                  color: PdfColor.fromHex("#000000"),
                                                  width: 1.0
                                              ),
                                            ),
                                            child: pw.Padding(
                                              padding: pw.EdgeInsets.all(4),
                                              child: pw.Text(
                                                  "FRONTAL DIREITO",
                                                  style: pw.TextStyle(font: font_bold, fontSize: 12),
                                                  textAlign: pw.TextAlign.left
                                              ),
                                            )
                                        ),
                                        pw.Container(
                                            width: 250,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(
                                                  color: PdfColor.fromHex("#000000"),
                                                  width: 1.0
                                              ),
                                            ),
                                            child: pw.Padding(
                                              padding: pw.EdgeInsets.all(4),
                                              child: pw.Text(
                                                  "FRONTAL ESQUERDO",
                                                  style: pw.TextStyle(font: font_bold, fontSize: 12),
                                                  textAlign: pw.TextAlign.left
                                              ),
                                            )
                                        ),
                                        pw.Container(
                                            width: 250,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(
                                                  color: PdfColor.fromHex("#000000"),
                                                  width: 1.0
                                              ),
                                            ),
                                            child: pw.Padding(
                                              padding: pw.EdgeInsets.all(4),
                                              child: pw.Text(
                                                  "TRASEIRO DIREITO",
                                                  style: pw.TextStyle(font: font_bold, fontSize: 12),
                                                  textAlign: pw.TextAlign.left
                                              ),
                                            )
                                        ),
                                        pw.Container(
                                            width: 250,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(
                                                  color: PdfColor.fromHex("#000000"),
                                                  width: 1.0
                                              ),
                                            ),
                                            child: pw.Padding(
                                              padding: pw.EdgeInsets.all(4),
                                              child: pw.Text(
                                                  "TRASEIRO ESQUERDO",
                                                  style: pw.TextStyle(font: font_bold, fontSize: 12),
                                                  textAlign: pw.TextAlign.left
                                              ),
                                            )
                                        ),
                                        pw.Container(
                                            width: 250,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(
                                                  color: PdfColor.fromHex("#000000"),
                                                  width: 1.0
                                              ),
                                            ),
                                            child: pw.Padding(
                                              padding: pw.EdgeInsets.all(4),
                                              child: pw.Text(
                                                  "ESTEPE",
                                                  style: pw.TextStyle(font: font_bold, fontSize: 12),
                                                  textAlign: pw.TextAlign.left
                                              ),
                                            )
                                        ),
                                      ]
                                  )
                              ),
                              pw.Container(
                                  width: 250,
                                  child: pw.Column(
                                      mainAxisAlignment: pw.MainAxisAlignment.start,
                                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                                      children: [
                                        pw.Container(
                                            width: 250,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(
                                                  color: PdfColor.fromHex("#000000"),
                                                  width: 1.0
                                              ),
                                            ),
                                            child: pw.Padding(
                                              padding: pw.EdgeInsets.all(4),
                                              child: pw.Text(
                                                  controller_mobx.pneus_balanceamento,
                                                  style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                                  textAlign: pw.TextAlign.left
                                              ),
                                            )
                                        ),
                                        pw.Container(
                                            width: 250,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(
                                                  color: PdfColor.fromHex("#000000"),
                                                  width: 1.0
                                              ),
                                            ),
                                            child: pw.Padding(
                                              padding: pw.EdgeInsets.all(4),
                                              child: pw.Text(
                                                  controller_mobx.pneus_frontal_direito,
                                                  style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                                  textAlign: pw.TextAlign.left
                                              ),
                                            )
                                        ),
                                        pw.Container(
                                            width: 250,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(
                                                  color: PdfColor.fromHex("#000000"),
                                                  width: 1.0
                                              ),
                                            ),
                                            child: pw.Padding(
                                              padding: pw.EdgeInsets.all(4),
                                              child: pw.Text(
                                                  controller_mobx.pneus_frontal_esquerdo,
                                                  style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                                  textAlign: pw.TextAlign.left
                                              ),
                                            )
                                        ),
                                        pw.Container(
                                            width: 250,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(
                                                  color: PdfColor.fromHex("#000000"),
                                                  width: 1.0
                                              ),
                                            ),
                                            child: pw.Padding(
                                              padding: pw.EdgeInsets.all(4),
                                              child: pw.Text(
                                                  controller_mobx.pneus_traseiro_direito,
                                                  style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                                  textAlign: pw.TextAlign.left
                                              ),
                                            )
                                        ),
                                        pw.Container(
                                            width: 250,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(
                                                  color: PdfColor.fromHex("#000000"),
                                                  width: 1.0
                                              ),
                                            ),
                                            child: pw.Padding(
                                              padding: pw.EdgeInsets.all(4),
                                              child: pw.Text(
                                                  controller_mobx.pneus_traseiro_esquerdo,
                                                  style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                                  textAlign: pw.TextAlign.left
                                              ),
                                            )
                                        ),
                                        pw.Container(
                                            width: 250,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(
                                                  color: PdfColor.fromHex("#000000"),
                                                  width: 1.0
                                              ),
                                            ),
                                            child: pw.Padding(
                                              padding: pw.EdgeInsets.all(4),
                                              child: pw.Text(
                                                  controller_mobx.pneus_step,
                                                  style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                                  textAlign: pw.TextAlign.left
                                              ),
                                            )
                                        ),
                                      ]
                                  )
                              )
                            ]
                        ),
                        pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                            children: [
                              pw.Container(
                                  width: 100,
                                  decoration: pw.BoxDecoration(
                                    border: pw.Border.all(
                                        color: PdfColor.fromHex("#000000"),
                                        width: 1.0
                                    ),
                                  ),
                                  child: pw.Column(
                                      children: [
                                        pw.Padding(
                                          padding: pw.EdgeInsets.all(4),
                                          child: pw.Text(
                                              "FRO. DIREITO",
                                              style: pw.TextStyle(font: font_bold, fontSize: 10),
                                              textAlign: pw.TextAlign.left
                                          ),
                                        ),
                                        pw.Align(
                                          alignment: pw.Alignment.topCenter,
                                          child: pw.Padding(
                                            padding: pw.EdgeInsets.all(4),
                                            child: pw.Container(
                                                height: 150,
                                                child: pw.Image(pw.MemoryImage(controller_mobx.pneus_foto_fro_dir.readAsBytesSync()), fit: pw.BoxFit.scaleDown)
                                            ),
                                          ),
                                        ),
                                      ]
                                  )
                              ),
                              pw.Container(
                                  width: 100,
                                  decoration: pw.BoxDecoration(
                                    border: pw.Border.all(
                                        color: PdfColor.fromHex("#000000"),
                                        width: 1.0
                                    ),
                                  ),
                                  child: pw.Column(
                                      children: [
                                        pw.Padding(
                                          padding: pw.EdgeInsets.all(4),
                                          child: pw.Text(
                                              "FRO. ESQUERDO",
                                              style: pw.TextStyle(font: font_bold, fontSize: 10),
                                              textAlign: pw.TextAlign.left
                                          ),
                                        ),
                                        pw.Align(
                                          alignment: pw.Alignment.topCenter,
                                          child: pw.Padding(
                                            padding: pw.EdgeInsets.all(4),
                                            child: pw.Container(
                                                height: 150,
                                                child: pw.Image(pw.MemoryImage(controller_mobx.pneus_foto_fro_esq.readAsBytesSync()), fit: pw.BoxFit.scaleDown)
                                            ),
                                          ),
                                        ),
                                      ]
                                  )
                              ),
                              pw.Container(
                                  width: 100,
                                  decoration: pw.BoxDecoration(
                                    border: pw.Border.all(
                                        color: PdfColor.fromHex("#000000"),
                                        width: 1.0
                                    ),
                                  ),
                                  child: pw.Column(
                                      children: [
                                        pw.Padding(
                                          padding: pw.EdgeInsets.all(4),
                                          child: pw.Text(
                                              "TRA. DIREITO",
                                              style: pw.TextStyle(font: font_bold, fontSize: 10),
                                              textAlign: pw.TextAlign.left
                                          ),
                                        ),
                                        pw.Align(
                                          alignment: pw.Alignment.topCenter,
                                          child: pw.Padding(
                                            padding: pw.EdgeInsets.all(4),
                                            child: pw.Container(
                                                height: 150,
                                                child: pw.Image(pw.MemoryImage(controller_mobx.pneus_foto_tra_dir.readAsBytesSync()), fit: pw.BoxFit.scaleDown)
                                            ),
                                          ),
                                        ),
                                      ]
                                  )
                              ),
                              pw.Container(
                                  width: 100,
                                  decoration: pw.BoxDecoration(
                                    border: pw.Border.all(
                                        color: PdfColor.fromHex("#000000"),
                                        width: 1.0
                                    ),
                                  ),
                                  child: pw.Column(
                                      children: [
                                        pw.Padding(
                                          padding: pw.EdgeInsets.all(4),
                                          child: pw.Text(
                                              "TRA. ESQUERDO",
                                              style: pw.TextStyle(font: font_bold, fontSize: 10),
                                              textAlign: pw.TextAlign.left
                                          ),
                                        ),
                                        pw.Align(
                                          alignment: pw.Alignment.topCenter,
                                          child: pw.Padding(
                                            padding: pw.EdgeInsets.all(4),
                                            child: pw.Container(
                                                height: 150,
                                                child: pw.Image(pw.MemoryImage(controller_mobx.pneus_foto_tra_esq.readAsBytesSync()), fit: pw.BoxFit.scaleDown)
                                            ),
                                          ),
                                        ),
                                      ]
                                  )
                              ),
                              pw.Container(
                                  width: 100,
                                  decoration: pw.BoxDecoration(
                                    border: pw.Border.all(
                                        color: PdfColor.fromHex("#000000"),
                                        width: 1.0
                                    ),
                                  ),
                                  child: pw.Column(
                                      children: [
                                        pw.Padding(
                                          padding: pw.EdgeInsets.all(4),
                                          child: pw.Text(
                                              "ESTEPE",
                                              style: pw.TextStyle(font: font_bold, fontSize: 10),
                                              textAlign: pw.TextAlign.left
                                          ),
                                        ),
                                        pw.Align(
                                          alignment: pw.Alignment.topCenter,
                                          child: pw.Padding(
                                            padding: pw.EdgeInsets.all(4),
                                            child: pw.Container(
                                                height: 150,
                                                child: pw.Image(pw.MemoryImage(controller_mobx.pneus_foto_step.readAsBytesSync()), fit: pw.BoxFit.scaleDown)
                                            ),
                                          ),
                                        ),
                                      ]
                                  )
                              ),
                            ]
                        ),
                      ]
                  )
              ),
              pw.Align(
                alignment: pw.Alignment.topCenter,
                child: pw.Padding(
                  padding: pw.EdgeInsets.only(top: 8, bottom: 8),
                  child: pw.SizedBox(
                    child: pw.FittedBox(
                      child: pw.Text("7 - MOTOR DO VEÍCULO",
                          style: pw.TextStyle(font: font, fontSize: 18),
                          textAlign: pw.TextAlign.center
                      ),
                    ),
                  ),
                ),
              ),
              pw.Padding(
                  padding: pw.EdgeInsets.only(top: 8, bottom: 8),
                  child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                            children: [
                              pw.Container(
                                  width: 250,
                                  child: pw.Column(
                                      mainAxisAlignment: pw.MainAxisAlignment.start,
                                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                                      children: [
                                        pw.Container(
                                            width: 250,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(
                                                  color: PdfColor.fromHex("#000000"),
                                                  width: 1.0
                                              ),
                                            ),
                                            child: pw.Padding(
                                              padding: pw.EdgeInsets.all(4),
                                              child: pw.Text(
                                                  "ASPECTO GERAL DO MOTOR",
                                                  style: pw.TextStyle(font: font_bold, fontSize: 12),
                                                  textAlign: pw.TextAlign.left
                                              ),
                                            )
                                        ),
                                        pw.Container(
                                            width: 250,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(
                                                  color: PdfColor.fromHex("#000000"),
                                                  width: 1.0
                                              ),
                                            ),
                                            child: pw.Padding(
                                              padding: pw.EdgeInsets.all(4),
                                              child: pw.Text(
                                                  "FUNCIONAMENTO",
                                                  style: pw.TextStyle(font: font_bold, fontSize: 12),
                                                  textAlign: pw.TextAlign.left
                                              ),
                                            )
                                        ),
                                        pw.Container(
                                            width: 250,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(
                                                  color: PdfColor.fromHex("#000000"),
                                                  width: 1.0
                                              ),
                                            ),
                                            child: pw.Padding(
                                              padding: pw.EdgeInsets.all(4),
                                              child: pw.Text(
                                                  "ÓLEO",
                                                  style: pw.TextStyle(font: font_bold, fontSize: 12),
                                                  textAlign: pw.TextAlign.left
                                              ),
                                            )
                                        ),
                                        pw.Container(
                                            width: 250,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(
                                                  color: PdfColor.fromHex("#000000"),
                                                  width: 1.0
                                              ),
                                            ),
                                            child: pw.Padding(
                                              padding: pw.EdgeInsets.all(4),
                                              child: pw.Text(
                                                  "ÁGUA",
                                                  style: pw.TextStyle(font: font_bold, fontSize: 12),
                                                  textAlign: pw.TextAlign.left
                                              ),
                                            )
                                        ),
                                        pw.Container(
                                            width: 250,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(
                                                  color: PdfColor.fromHex("#000000"),
                                                  width: 1.0
                                              ),
                                            ),
                                            child: pw.Padding(
                                              padding: pw.EdgeInsets.all(4),
                                              child: pw.Text(
                                                  "FLUÍDO DE FREIO",
                                                  style: pw.TextStyle(font: font_bold, fontSize: 12),
                                                  textAlign: pw.TextAlign.left
                                              ),
                                            )
                                        ),
                                        pw.Container(
                                            width: 250,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(
                                                  color: PdfColor.fromHex("#000000"),
                                                  width: 1.0
                                              ),
                                            ),
                                            child: pw.Padding(
                                              padding: pw.EdgeInsets.all(4),
                                              child: pw.Text(
                                                  "BATERIA",
                                                  style: pw.TextStyle(font: font_bold, fontSize: 12),
                                                  textAlign: pw.TextAlign.left
                                              ),
                                            )
                                        ),
                                      ]
                                  )
                              ),
                              pw.Container(
                                  width: 250,
                                  child: pw.Column(
                                      mainAxisAlignment: pw.MainAxisAlignment.start,
                                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                                      children: [
                                        pw.Container(
                                            width: 250,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(
                                                  color: PdfColor.fromHex("#000000"),
                                                  width: 1.0
                                              ),
                                            ),
                                            child: pw.Padding(
                                              padding: pw.EdgeInsets.all(4),
                                              child: pw.Text(
                                                  controller_mobx.motor_aspecto,
                                                  style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                                  textAlign: pw.TextAlign.left
                                              ),
                                            )
                                        ),
                                        pw.Container(
                                            width: 250,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(
                                                  color: PdfColor.fromHex("#000000"),
                                                  width: 1.0
                                              ),
                                            ),
                                            child: pw.Padding(
                                              padding: pw.EdgeInsets.all(4),
                                              child: pw.Text(
                                                  controller_mobx.motor_funcionamento,
                                                  style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                                  textAlign: pw.TextAlign.left
                                              ),
                                            )
                                        ),
                                        pw.Container(
                                            width: 250,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(
                                                  color: PdfColor.fromHex("#000000"),
                                                  width: 1.0
                                              ),
                                            ),
                                            child: pw.Padding(
                                              padding: pw.EdgeInsets.all(4),
                                              child: pw.Text(
                                                  controller_mobx.motor_oleo,
                                                  style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                                  textAlign: pw.TextAlign.left
                                              ),
                                            )
                                        ),
                                        pw.Container(
                                            width: 250,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(
                                                  color: PdfColor.fromHex("#000000"),
                                                  width: 1.0
                                              ),
                                            ),
                                            child: pw.Padding(
                                              padding: pw.EdgeInsets.all(4),
                                              child: pw.Text(
                                                  controller_mobx.motor_agua,
                                                  style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                                  textAlign: pw.TextAlign.left
                                              ),
                                            )
                                        ),
                                        pw.Container(
                                            width: 250,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(
                                                  color: PdfColor.fromHex("#000000"),
                                                  width: 1.0
                                              ),
                                            ),
                                            child: pw.Padding(
                                              padding: pw.EdgeInsets.all(4),
                                              child: pw.Text(
                                                  controller_mobx.motor_fluido_freio,
                                                  style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                                  textAlign: pw.TextAlign.left
                                              ),
                                            )
                                        ),
                                        pw.Container(
                                            width: 250,
                                            decoration: pw.BoxDecoration(
                                              border: pw.Border.all(
                                                  color: PdfColor.fromHex("#000000"),
                                                  width: 1.0
                                              ),
                                            ),
                                            child: pw.Padding(
                                              padding: pw.EdgeInsets.all(4),
                                              child: pw.Text(
                                                  controller_mobx.motor_bateria,
                                                  style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                                  textAlign: pw.TextAlign.left
                                              ),
                                            )
                                        ),
                                      ]
                                  )
                              )
                            ]
                        ),
                        pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                            children: [
                              pw.Container(
                                  width: 167,
                                  decoration: pw.BoxDecoration(
                                    border: pw.Border.all(
                                        color: PdfColor.fromHex("#000000"),
                                        width: 1.0
                                    ),
                                  ),
                                  child: pw.Column(
                                      children: [
                                        pw.Padding(
                                          padding: pw.EdgeInsets.all(4),
                                          child: pw.Text(
                                              "MOTOR",
                                              style: pw.TextStyle(font: font_bold, fontSize: 12),
                                              textAlign: pw.TextAlign.left
                                          ),
                                        ),
                                        pw.Align(
                                          alignment: pw.Alignment.topCenter,
                                          child: pw.Padding(
                                            padding: pw.EdgeInsets.all(4),
                                            child: pw.Container(
                                                height: 150,
                                                child: pw.Image(pw.MemoryImage(controller_mobx.motor_foto_motor.readAsBytesSync()), fit: pw.BoxFit.scaleDown)
                                            ),
                                          ),
                                        ),
                                      ]
                                  )
                              ),
                              pw.Container(
                                  width: 166,
                                  decoration: pw.BoxDecoration(
                                    border: pw.Border.all(
                                        color: PdfColor.fromHex("#000000"),
                                        width: 1.0
                                    ),
                                  ),
                                  child: pw.Column(
                                      children: [
                                        pw.Padding(
                                          padding: pw.EdgeInsets.all(4),
                                          child: pw.Text(
                                              "ETIQ. DO ÓLEO",
                                              style: pw.TextStyle(font: font_bold, fontSize: 12),
                                              textAlign: pw.TextAlign.left
                                          ),
                                        ),
                                        pw.Align(
                                          alignment: pw.Alignment.topCenter,
                                          child: pw.Padding(
                                            padding: pw.EdgeInsets.all(4),
                                            child: pw.Container(
                                                height: 150,
                                                child: pw.Image(pw.MemoryImage(controller_mobx.motor_foto_etiqueta_oleo.readAsBytesSync()), fit: pw.BoxFit.scaleDown)
                                            ),
                                          ),
                                        ),
                                      ]
                                  )
                              ),
                              pw.Container(
                                  width: 167,
                                  decoration: pw.BoxDecoration(
                                    border: pw.Border.all(
                                        color: PdfColor.fromHex("#000000"),
                                        width: 1.0
                                    ),
                                  ),
                                  child: pw.Column(
                                      children: [
                                        pw.Padding(
                                          padding: pw.EdgeInsets.all(4),
                                          child: pw.Text(
                                              "BATERIA",
                                              style: pw.TextStyle(font: font_bold, fontSize: 12),
                                              textAlign: pw.TextAlign.left
                                          ),
                                        ),
                                        pw.Align(
                                          alignment: pw.Alignment.topCenter,
                                          child: pw.Padding(
                                            padding: pw.EdgeInsets.all(4),
                                            child: pw.Container(
                                                height: 150,
                                                child: pw.Image(pw.MemoryImage(controller_mobx.motor_foto_bateria.readAsBytesSync()), fit: pw.BoxFit.scaleDown)
                                            ),
                                          ),
                                        ),
                                      ]
                                  )
                              ),
                            ]
                        ),
                      ]
                  )
              ),
              pw.NewPage(),
              pw.Align(
                alignment: pw.Alignment.topCenter,
                child: pw.Padding(
                  padding: pw.EdgeInsets.only(top: 8, bottom: 8),
                  child: pw.SizedBox(
                    child: pw.FittedBox(
                      child: pw.Text("8 - INTERIOR DO VEÍCULO",
                          style: pw.TextStyle(font: font, fontSize: 18),
                          textAlign: pw.TextAlign.center
                      ),
                    ),
                  ),
                ),
              ),
              pw.Padding(
                padding: pw.EdgeInsets.only(top: 8, bottom: 8),
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    children: [
                      pw.Container(
                          width: 250,
                          child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.center,
                              children: [
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "LIMPEZA INTERIOR",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "CINTO DE SEGURANÇA",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "PAINEL",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "TAPEÇARIA",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "BANCOS",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "MACACO",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                              ]
                          )
                      ),
                      pw.Container(
                          width: 250,
                          child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.center,
                              children: [
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.interior_limpeza,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.interior_cinto,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.interior_painel,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.interior_tapetes,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.interior_bancos,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.interior_macaco,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                              ]
                          )
                      ),
                    ]
                ),
              ),
              pw.Align(
                alignment: pw.Alignment.topCenter,
                child: pw.Padding(
                  padding: pw.EdgeInsets.only(top: 8, bottom: 8),
                  child: pw.SizedBox(
                    child: pw.FittedBox(
                      child: pw.Text("9 - EXTERIOR DO VEÍCULO",
                          style: pw.TextStyle(font: font, fontSize: 18),
                          textAlign: pw.TextAlign.center
                      ),
                    ),
                  ),
                ),
              ),
              pw.Padding(
                padding: pw.EdgeInsets.only(top: 8, bottom: 8),
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    children: [
                      pw.Container(
                          width: 250,
                          child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.center,
                              children: [
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "LIMPEZA EXTERIOR",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "IMÃ DA EMPRESA",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "SUSPENSÃO",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "ESCAPAMENTO",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "TRAVA DE SEGURANÇA",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "FECHADURAS",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "FECHADURA DO TANQUE",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "LIMPADOR DIANTEIRO",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "LIMPADOR TRASEIRO",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "PARA-BRISA",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          "RACK DE ESCADAS",
                                          style: pw.TextStyle(font: font_bold, fontSize: 12),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                              ]
                          )
                      ),
                      pw.Container(
                          width: 250,
                          child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.center,
                              children: [
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.exterior_limpeza,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.exterior_ima,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.exterior_suspensao,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.exterior_escapamento,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.exterior_trava,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.exterior_fechaduras,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.exterior_fechadura_tanque,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.exterior_limpador_dianteiro,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.exterior_limpador_traseiro,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.exterior_parabrisa,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                                pw.Container(
                                    width: 250,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(
                                          color: PdfColor.fromHex("#000000"),
                                          width: 1.0
                                      ),
                                    ),
                                    child: pw.Padding(
                                      padding: pw.EdgeInsets.all(4),
                                      child: pw.Text(
                                          controller_mobx.exterior_rack,
                                          style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                          textAlign: pw.TextAlign.left
                                      ),
                                    )
                                ),
                              ]
                          )
                      ),
                    ]
                ),
              ),
              pw.Align(
                alignment: pw.Alignment.topCenter,
                child: pw.Padding(
                  padding: pw.EdgeInsets.only(top: 8, bottom: 8),
                  child: pw.SizedBox(
                    child: pw.FittedBox(
                      child: pw.Text("10 - AVARIAS NO VEÍCULO",
                          style: pw.TextStyle(font: font, fontSize: 18),
                          textAlign: pw.TextAlign.center
                      ),
                    ),
                  ),
                ),
              ),
              if(controller_mobx.avaria_lista.length > 0)
                for(int i=0; i < controller_mobx.avaria_lista.length; i++)
                pw.Padding(
                    padding: (i == 0) ? pw.EdgeInsets.only(top: 8, bottom: 2) : ((i == controller_mobx.avaria_lista.length - 1) ? pw.EdgeInsets.only(top: 2, bottom: 8) : pw.EdgeInsets.only(top: 2, bottom: 2)),
                    child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.center,
                              crossAxisAlignment: pw.CrossAxisAlignment.center,
                              children: [
                                pw.Container(
                                    width: 100,
                                    child: pw.Column(
                                        mainAxisAlignment: pw.MainAxisAlignment.start,
                                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                                        children: [
                                          pw.Container(
                                              width: 100,
                                              height: 50,
                                              decoration: pw.BoxDecoration(
                                                border: pw.Border.all(
                                                    color: PdfColor.fromHex("#000000"),
                                                    width: 1.0
                                                ),
                                              ),
                                              child: pw.Padding(
                                                padding: pw.EdgeInsets.all(4),
                                                child: pw.Text(
                                                    "LOCAL",
                                                    style: pw.TextStyle(font: font_bold, fontSize: 12),
                                                    textAlign: pw.TextAlign.left
                                                ),
                                              )
                                          ),
                                          pw.Container(
                                              width: 100,
                                              height: 50,
                                              decoration: pw.BoxDecoration(
                                                border: pw.Border.all(
                                                    color: PdfColor.fromHex("#000000"),
                                                    width: 1.0
                                                ),
                                              ),
                                              child: pw.Padding(
                                                padding: pw.EdgeInsets.all(4),
                                                child: pw.Text(
                                                    "TIPO",
                                                    style: pw.TextStyle(font: font_bold, fontSize: 12),
                                                    textAlign: pw.TextAlign.left
                                                ),
                                              )
                                          ),
                                          pw.Container(
                                              width: 100,
                                              height: 50,
                                              decoration: pw.BoxDecoration(
                                                border: pw.Border.all(
                                                    color: PdfColor.fromHex("#000000"),
                                                    width: 1.0
                                                ),
                                              ),
                                              child: pw.Padding(
                                                padding: pw.EdgeInsets.all(4),
                                                child: pw.Text(
                                                    "COMENTÁRIO",
                                                    style: pw.TextStyle(font: font_bold, fontSize: 10),
                                                    textAlign: pw.TextAlign.left
                                                ),
                                              )
                                          ),
                                        ]
                                    )
                                ),
                                pw.Container(
                                    width: 275,
                                    child: pw.Column(
                                        mainAxisAlignment: pw.MainAxisAlignment.start,
                                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                                        children: [
                                          pw.Container(
                                              width: 275,
                                              height: 50,
                                              decoration: pw.BoxDecoration(
                                                border: pw.Border.all(
                                                    color: PdfColor.fromHex("#000000"),
                                                    width: 1.0
                                                ),
                                              ),
                                              child: pw.Padding(
                                                padding: pw.EdgeInsets.all(4),
                                                child: pw.Text(
                                                    controller_mobx.avaria_lista[i].local,
                                                    style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                                    textAlign: pw.TextAlign.left
                                                ),
                                              )
                                          ),
                                          pw.Container(
                                              width: 275,
                                              height: 50,
                                              decoration: pw.BoxDecoration(
                                                border: pw.Border.all(
                                                    color: PdfColor.fromHex("#000000"),
                                                    width: 1.0
                                                ),
                                              ),
                                              child: pw.Padding(
                                                padding: pw.EdgeInsets.all(4),
                                                child: pw.Text(
                                                    controller_mobx.avaria_lista[i].tipo,
                                                    style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                                    textAlign: pw.TextAlign.left
                                                ),
                                              )
                                          ),
                                          pw.Container(
                                              width: 275,
                                              height: 50,
                                              decoration: pw.BoxDecoration(
                                                border: pw.Border.all(
                                                    color: PdfColor.fromHex("#000000"),
                                                    width: 1.0
                                                ),
                                              ),
                                              child: pw.Padding(
                                                padding: pw.EdgeInsets.all(4),
                                                child: pw.Text(
                                                    controller_mobx.avaria_lista[i].comentario,
                                                    style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                                    textAlign: pw.TextAlign.left
                                                ),
                                              )
                                          ),
                                        ]
                                    )
                                ),
                                pw.Container(
                                    width: 125,
                                    child: pw.Column(
                                        mainAxisAlignment: pw.MainAxisAlignment.start,
                                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                                        children: [
                                          pw.Container(
                                              width: 125,
                                              height: 150,
                                              decoration: pw.BoxDecoration(
                                                border: pw.Border.all(
                                                    color: PdfColor.fromHex("#000000"),
                                                    width: 1.0
                                                ),
                                              ),
                                              child: pw.Column(
                                                  children: [
                                                    pw.Padding(
                                                      padding: pw.EdgeInsets.all(4),
                                                      child: pw.Text(
                                                          "IMAGEM",
                                                          style: pw.TextStyle(font: font_bold, fontSize: 10),
                                                          textAlign: pw.TextAlign.left
                                                      ),
                                                    ),
                                                    pw.Align(
                                                      alignment: pw.Alignment.topCenter,
                                                      child: pw.Padding(
                                                        padding: pw.EdgeInsets.all(4),
                                                        child: pw.Container(
                                                            height: 120,
                                                            child: pw.Image(pw.MemoryImage(controller_mobx.avaria_lista[i].foto.readAsBytesSync()), fit: pw.BoxFit.scaleDown)
                                                        ),
                                                      ),
                                                    ),
                                                  ]
                                              )
                                          ),
                                        ]
                                    )
                                )
                              ]
                          ),
                        ]
                    )
                )
              else
                pw.Align(
                  alignment: pw.Alignment.topCenter,
                  child: pw.Padding(
                    padding: pw.EdgeInsets.only(top: 8, bottom: 8),
                    child: pw.SizedBox(
                      child: pw.FittedBox(
                        child: pw.Text("NENHUMA AVARIA REGISTRADA PARA O VEÍCULO",
                            style: pw.TextStyle(font: font_bold, fontSize: 12),
                            textAlign: pw.TextAlign.center
                        ),
                      ),
                    ),
                  ),
                ),
              pw.Align(
                alignment: pw.Alignment.topCenter,
                child: pw.Padding(
                  padding: pw.EdgeInsets.only(top: 8, bottom: 8),
                  child: pw.SizedBox(
                    child: pw.FittedBox(
                      child: pw.Text("11 - CONCLUSÃO DA VISTORIA",
                          style: pw.TextStyle(font: font, fontSize: 18),
                          textAlign: pw.TextAlign.center
                      ),
                    ),
                  ),
                ),
              ),
              if(controller_mobx.providencias_a_tomar.length > 0)
                for(int i=0; i < controller_mobx.providencias_a_tomar.length; i++)
                  pw.Padding(
                      padding: (i == 0) ? pw.EdgeInsets.only(top: 8, bottom: 0) : ((i == controller_mobx.avaria_lista.length - 1) ? pw.EdgeInsets.only(top: 0, bottom: 8) : pw.EdgeInsets.only(top: 0, bottom: 0)),
                      child: pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          crossAxisAlignment: pw.CrossAxisAlignment.center,
                          children: [
                            if(i == 0)
                              pw.Row(
                                  mainAxisAlignment: pw.MainAxisAlignment.center,
                                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                                  children: [
                                    pw.Container(
                                        width: 500,
                                        child: pw.Column(
                                            mainAxisAlignment: pw.MainAxisAlignment.start,
                                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                                            children: [
                                              pw.Container(
                                                  width: 500,
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                        color: PdfColor.fromHex("#000000"),
                                                        width: 1.0
                                                    ),
                                                  ),
                                                  child: pw.Padding(
                                                    padding: pw.EdgeInsets.all(4),
                                                    child: pw.Text(
                                                        "AÇÕES NECESSÁRIAS",
                                                        style: pw.TextStyle(font: font_bold, fontSize: 12),
                                                        textAlign: pw.TextAlign.left
                                                    ),
                                                  )
                                              ),
                                            ]
                                        )
                                    ),
                                  ]
                              )
                            else
                              pw.Row(
                                  mainAxisAlignment: pw.MainAxisAlignment.center,
                                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                                  children: [
                                    pw.Container(
                                        width: 500,
                                        child: pw.Column(
                                            mainAxisAlignment: pw.MainAxisAlignment.start,
                                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                                            children: [
                                              pw.Container(
                                                  width: 500,
                                                  decoration: pw.BoxDecoration(
                                                    border: pw.Border.all(
                                                        color: PdfColor.fromHex("#000000"),
                                                        width: 1.0
                                                    ),
                                                  ),
                                                  child: pw.Padding(
                                                    padding: pw.EdgeInsets.all(4),
                                                    child: pw.Text(
                                                        controller_mobx.providencias_a_tomar[i],
                                                        style: pw.TextStyle(font: font, fontSize: 12),
                                                        textAlign: pw.TextAlign.left
                                                    ),
                                                  )
                                              ),
                                            ]
                                        )
                                    ),
                                  ]
                              ),
                          ]
                      )
                  )
              else
                pw.Align(
                  alignment: pw.Alignment.topCenter,
                  child: pw.Padding(
                    padding: pw.EdgeInsets.only(top: 8, bottom: 8),
                    child: pw.SizedBox(
                      child: pw.FittedBox(
                        child: pw.Text("NENHUMA AÇÃO NECESSÁRIA. O VEÍCULO ESTA EM CONDIÇÕES DE USO.",
                            style: pw.TextStyle(font: font_bold, fontSize: 12),
                            textAlign: pw.TextAlign.center
                        ),
                      ),
                    ),
                  ),
                ),
              if(controller_mobx.conclusao_obs_condutor.isNotEmpty)
                pw.Padding(
                  padding: pw.EdgeInsets.only(top: 8, bottom: 8),
                  child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Container(
                            width: 125,
                            child: pw.Column(
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                crossAxisAlignment: pw.CrossAxisAlignment.center,
                                children: [
                                  pw.Container(
                                      width: 125,
                                      child: pw.Padding(
                                        padding: pw.EdgeInsets.all(4),
                                        child: pw.Text(
                                            "OBS. CONDUTOR:",
                                            style: pw.TextStyle(font: font_bold, fontSize: 12),
                                            textAlign: pw.TextAlign.left
                                        ),
                                      )
                                  ),
                                ]
                            )
                        ),
                        pw.Container(
                            width: 375,
                            child: pw.Column(
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                crossAxisAlignment: pw.CrossAxisAlignment.center,
                                children: [
                                  pw.Container(
                                      width: 375,
                                      child: pw.Padding(
                                        padding: pw.EdgeInsets.all(4),
                                        child: pw.Text(
                                            controller_mobx.conclusao_obs_condutor,
                                            style: pw.TextStyle(font: font, fontSize: 12, fontWeight: pw.FontWeight.normal),
                                            textAlign: pw.TextAlign.left
                                        ),
                                      )
                                  ),
                                ]
                            )
                        )
                      ]
                  ),
                )
              else
                pw.Align(
                  alignment: pw.Alignment.topCenter,
                  child: pw.Padding(
                    padding: pw.EdgeInsets.only(top: 8, bottom: 8),
                    child: pw.SizedBox(
                      child: pw.FittedBox(
                        child: pw.Text("NENHUM COMENTÁRIO REGISTRADO PELO CONDUTOR",
                            style: pw.TextStyle(font: font_bold, fontSize: 12),
                            textAlign: pw.TextAlign.center
                        ),
                      ),
                    ),
                  ),
                ),
              pw.Align(
                alignment: pw.Alignment.topCenter,
                child: pw.Padding(
                  padding: pw.EdgeInsets.only(top: 8),
                  child: pw.Container(
                      height: 100,
                      child: pw.Image(pw.MemoryImage(controller_mobx.conclusao_imagem_assinatura), fit: pw.BoxFit.scaleDown)
                  ),
                ),
              ),
              pw.Align(
                alignment: pw.Alignment.topCenter,
                child: pw.Padding(
                  padding: pw.EdgeInsets.only(top: 2, bottom: 16),
                  child: pw.Container(
                    width: 150,
                    decoration: pw.BoxDecoration(
                      border: pw.Border(
                          top: pw.BorderSide(
                              color: PdfColor.fromHex("#000000"),
                              width: 1.0
                          )
                      ),
                    ),
                    child: pw.Text(controller_mobx.condutor,
                        style: pw.TextStyle(font: font, fontSize: 14),
                        textAlign: pw.TextAlign.center
                    ),
                  ),
                ),
              ),
            ]
        )
    );
    String data_formatada = DateFormat('yyyyMMdd-kkmmss').format(now);
    String nome_pdf = data_formatada + "-" + controller_mobx.placa.toUpperCase();
    await Printing.sharePdf(bytes: await pdf.save(), filename: nome_pdf+'.pdf');

    final output = await getTemporaryDirectory();
    final file = File('${output.path}/' + nome_pdf);
    pdf_gerado = await file.writeAsBytes(await pdf.save());
  }

  salvar_dados_vistoria_firebase() async{
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    DateTime now = DateTime.now();
    String data_formatada = DateFormat('yyyyMMdd-kkmmss').format(now);
    String data_salvar = DateFormat('dd/MM/yyyy').format(now);
    String nome_pdf = data_formatada + "-" + controller_mobx.placa.toUpperCase();
    //fazer upload e gerar o link do arquivo
    String link_download = await fazer_upload_pdf(nome_pdf);
    //copiar link do pdf e salvar na listagem de baixas
    Vistoria vistoria = Vistoria();
    vistoria.identificacao = nome_pdf;
    vistoria.data = data_salvar;
    vistoria.condutor = controller_mobx.condutor;
    vistoria.vistoriador = controller_mobx.vistoriador;
    vistoria.veiculo = controller_mobx.modelo_veiculo;
    vistoria.placa = controller_mobx.placa;
    vistoria.link = link_download;
    DatabaseReference ref_vistoria = FirebaseDatabase.instance.ref(controller_mobx.filial_atual).child("vistoria").child(nome_pdf);
    final json = vistoria.toJson();
    await ref_vistoria.set(json);
    //salvar dados da vistoria na planilha
    List<String> vistoria_salvar = [];
    vistoria_salvar.add(vistoria.identificacao);
    vistoria_salvar.add(vistoria.data);
    vistoria_salvar.add(vistoria.placa);
    vistoria_salvar.add(vistoria.veiculo);
    vistoria_salvar.add(vistoria.vistoriador);
    vistoria_salvar.add(vistoria.condutor);
    vistoria_salvar.add(vistoria.link);
    await planilha_salvar_vistoria(vistoria_salvar);
  }

  fazer_upload_pdf(String nome) async{
    final storageRef = FirebaseStorage.instance.ref();
    final saidaRef = storageRef.child(controller_mobx.filial_atual).child("vistoria/" + nome);
    String link_download_pdf = "";
    try {
      await saidaRef.putFile(pdf_gerado);
      link_download_pdf = await saidaRef.getDownloadURL();
    }catch (e) {
      print("Erro no upload do pdf");
    }
    return link_download_pdf;
  }

  planilha_salvar_vistoria(List<String> salvar) async{
    final gsheets = GSheets(planilha.credentials);
    final ss = await gsheets.spreadsheet(planilha.spreadsheetId);
    var sheet = ss.worksheetByTitle(controller_mobx.filial_atual);
    await sheet!.values.appendRow([salvar[0], salvar[1], salvar[2], salvar[3], salvar[4], salvar[5], salvar[6]]);
  }
}
