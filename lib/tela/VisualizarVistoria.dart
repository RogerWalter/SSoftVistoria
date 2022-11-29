import 'dart:async';
import 'dart:io';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../model/Vistoria.dart';
import '../util/Controller.dart';
import '../util/DialogoCarregando.dart';
import '../util/SemDados.dart';
import '../util/Util.dart';

class VisualizarVistoria extends StatefulWidget {
  const VisualizarVistoria({Key? key}) : super(key: key);

  @override
  State<VisualizarVistoria> createState() => _VisualizarVistoriaState();
}

class _VisualizarVistoriaState extends State<VisualizarVistoria> {
  Controller controller_mobx = Controller();
  TextEditingController _controller_pesquisa = TextEditingController();
  Util cores = Util();
  int _conexao = 1;
  List<Vistoria> lista_filtrada = [];

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    controller_mobx = Provider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/wallpaper.png'),
              //colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.75), BlendMode.modulate,),
              fit: BoxFit.cover
          )
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('Vistorias Efetuadas', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
            backgroundColor: cores.cor_app_bar,
            automaticallyImplyLeading: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
            ),
          ),
          body: Padding(
              padding: EdgeInsets.all(8),
              child: Observer(
                builder: (_){
                  return Column(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(top: 8, bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  height: 50,
                                  child: TextField(
                                    controller: _controller_pesquisa,
                                    keyboardType: TextInputType.name,
                                    textCapitalization: TextCapitalization.characters,
                                    textInputAction: TextInputAction.done,
                                    cursorColor: cores.cor_app_bar,
                                    style: TextStyle(
                                        color: cores.cor_app_bar,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold
                                    ),
                                    decoration: InputDecoration(
                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                      counterText: "",
                                      labelText: "Pesquisar Item",
                                      labelStyle: TextStyle(color: cores.laranja_teccel, fontWeight: FontWeight.normal),
                                      fillColor: Colors.transparent,
                                      hoverColor: cores.cor_app_bar,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width: 2, color: cores.cor_app_bar),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width: 2, color: cores.laranja_teccel),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    onChanged: (content){
                                      if(content.isNotEmpty){
                                        controller_mobx.lista_pesquisa_vistorias.clear();
                                        for(int i = 0; i < controller_mobx.lista_vistorias.length; i++){
                                          if(controller_mobx.lista_vistorias[i].condutor.toLowerCase().contains(content.toLowerCase()) ||
                                              controller_mobx.lista_vistorias[i].placa.toLowerCase().contains(content.toLowerCase()) ||
                                              controller_mobx.lista_vistorias[i].veiculo.toLowerCase().contains(content.toLowerCase()) ||
                                              controller_mobx.lista_vistorias[i].data.toLowerCase().contains(content.toLowerCase())){
                                            controller_mobx.adiciona_item_lista_pesquisa(controller_mobx.lista_vistorias[i]);
                                          }
                                        }
                                      }
                                      else{
                                        controller_mobx.lista_pesquisa_vistorias.clear();
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          )
                      ),
                      if(controller_mobx.lista_vistorias.length > 0)
                        Observer(
                            builder: (_) {
                              return Expanded(
                                  child: Stack(
                                    children: <Widget>[
                                      ScrollConfiguration(
                                          behavior: ScrollBehavior(),
                                          child: GlowingOverscrollIndicator(
                                              axisDirection: AxisDirection.down,
                                              color: cores.laranja_teccel.withOpacity(0.20),
                                              child: ListView.builder(
                                                itemCount: controller_mobx.lista_pesquisa_vistorias.length > 0 ? controller_mobx.lista_pesquisa_vistorias.length : controller_mobx.lista_vistorias.length,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemBuilder: (_, index){
                                                  return Card(
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(10),
                                                      ),
                                                      child: InkWell(
                                                        splashColor: cores.laranja_teccel.withOpacity(0.25),
                                                        hoverColor: Colors.white,
                                                        borderRadius: BorderRadius.circular(10),
                                                        onTap: () async{
                                                          if(controller_mobx.lista_pesquisa_vistorias.length > 0){
                                                            //baixar_pdf(controller_mobx.lista_pesquisa_vistorias[index].link, controller_mobx.lista_pesquisa_vistorias[index].identificacao);
                                                            visualizar_pdf(controller_mobx.lista_pesquisa_vistorias[index].link, controller_mobx.lista_pesquisa_vistorias[index].identificacao);
                                                          }
                                                          else{
                                                            //baixar_pdf(controller_mobx.lista_vistorias[index].link, controller_mobx.lista_vistorias[index].identificacao);
                                                            visualizar_pdf(controller_mobx.lista_vistorias[index].link, controller_mobx.lista_vistorias[index].identificacao);
                                                          }
                                                        },
                                                        child: ListTile(
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                          ),
                                                          tileColor: Colors.white,
                                                          leading:  CircleAvatar(
                                                              backgroundColor: Colors.black,
                                                              child: Icon(Icons.arrow_circle_right, color: Colors.white,)
                                                          ),
                                                          title: Padding(
                                                            padding: EdgeInsets.fromLTRB(0, 4, 0, 2),
                                                            child: Text(
                                                              controller_mobx.lista_pesquisa_vistorias.length > 0  ? controller_mobx.lista_pesquisa_vistorias[index].placa + " em " + controller_mobx.lista_pesquisa_vistorias[index].data : controller_mobx.lista_vistorias[index].placa + " em " + controller_mobx.lista_vistorias[index].data,
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                  color: Colors.black,
                                                                  fontSize: (14),
                                                                  fontWeight: FontWeight.bold
                                                              ),
                                                            ),
                                                          ),
                                                          subtitle: Column(
                                                            children: <Widget>[
                                                              Padding(
                                                                padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
                                                                child: Text(
                                                                  controller_mobx.lista_pesquisa_vistorias.length > 0  ? "Carro: " + controller_mobx.lista_pesquisa_vistorias[index].veiculo : "Carro: " + controller_mobx.lista_vistorias[index].veiculo,
                                                                  textAlign: TextAlign.left,
                                                                  style: TextStyle(
                                                                    color: Colors.black54,
                                                                    fontSize: (12),
                                                                  ),
                                                                  maxLines: 1,
                                                                  overflow: TextOverflow.ellipsis,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets.fromLTRB(0, 2, 0, 4),
                                                                child: Text(
                                                                  controller_mobx.lista_pesquisa_vistorias.length > 0  ? "Condutor: " + controller_mobx.lista_pesquisa_vistorias[index].condutor : "Condutor: " + controller_mobx.lista_vistorias[index].condutor,
                                                                  textAlign: TextAlign.left,
                                                                  style: TextStyle(
                                                                      color: Colors.black,
                                                                      fontSize: (14),
                                                                      fontWeight: FontWeight.bold
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          trailing: IconButton(
                                                            icon: Icon(Icons.share, color: cores.laranja_teccel),
                                                            onPressed: () async {
                                                              mostrar_progress();
                                                              var arquivo;
                                                              if(controller_mobx.lista_pesquisa_vistorias.length > 0){
                                                                arquivo = await createFileOfPdfUrl(controller_mobx.lista_pesquisa_vistorias[index].link, controller_mobx.lista_pesquisa_vistorias[index].identificacao);
                                                              }
                                                              else{
                                                                arquivo = await createFileOfPdfUrl(controller_mobx.lista_vistorias[index].link, controller_mobx.lista_vistorias[index].identificacao);
                                                              }
                                                              await Share.shareXFiles([XFile(arquivo.path)], text: "Enviar PDF").then((value) => Navigator.of(context).pop());
                                                            },
                                                          ),
                                                        ),
                                                      )
                                                  );
                                                },
                                              )
                                          )
                                      )
                                    ],
                                  )
                              );
                            }
                        )
                      else
                        Expanded(child: SemDados())
                    ],
                  );
                },
              )
          )
      ),
    );
  }
  visualizar_pdf(String link, String nome_arquivo) async{
    mostrar_progress();
    var arquivo_pdf = await createFileOfPdfUrl(link, nome_arquivo);
    String local_pdf = arquivo_pdf.path;
    if (local_pdf.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PDFScreen(path: local_pdf, arquivo: arquivo_pdf, nome: nome_arquivo + ".pdf"),
        ),
      ).then((value) => Navigator.of(context).pop());
    }
  }

  mostrar_progress(){
    showDialog(
        barrierDismissible: false,
        barrierColor: Color(0x00ffffff),
        context: context,
        builder: (_){
          return WillPopScope(
              child: Dialog(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                child: new Container(
                    alignment: FractionalOffset.center,
                    height: 80.0,
                    padding: const EdgeInsets.all(20.0),
                    child:  Center(child: DialogoCarregando(),)
                ),
              ),
              onWillPop: () async => false
          );
        });
  }

  Future<File> createFileOfPdfUrl(String link, String nome_arquivo) async {
    Completer<File> completer = Completer();
    print("Start download file from internet!");
    try {
      final url = link;
      final filename = nome_arquivo + ".pdf";
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      print("Download files");
      print("${dir.path}/$filename");
      File file = File("${dir.path}/$filename");
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }
    return completer.future;
  }
}

class PDFScreen extends StatefulWidget {
  final String? path;
  var arquivo;
  final String? nome;

  PDFScreen({Key? key, this.path, this.arquivo, this.nome}) : super(key: key);

  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {
  final Completer<PDFViewController> _controller =
  Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';
  Util cores = Util();

  @override
  Widget build(BuildContext context) {
    String local_arquivo = widget.path!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cores.cor_app_bar,
        title: Text("Visualizar Vistoria"),
      ),
      backgroundColor: cores.cor_app_bar,
      body: Stack(
        children: <Widget>[
          PDFView(
            filePath: widget.path,
            enableSwipe: true,
            swipeHorizontal: true,
            autoSpacing: false,
            pageFling: true,
            pageSnap: true,
            defaultPage: currentPage!,
            fitPolicy: FitPolicy.BOTH,
            preventLinkNavigation:
            false, // if set to true the link is handled in flutter
            onRender: (_pages) {
              setState(() {
                pages = _pages;
                isReady = true;
              });
            },
            onViewCreated: (PDFViewController pdfViewController) {
              _controller.complete(pdfViewController);
            },
          ),
          errorMessage.isEmpty
              ? !isReady
              ? Center(
            child: CircularProgressIndicator(),
          )
              : Container()
              : Center(
            child: Text(errorMessage),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: cores.cor_app_bar,
        child: Icon(Icons.share),
        onPressed: () async {
          await Share.shareXFiles([XFile(local_arquivo)], text: "Enviar PDF");
        },
      )
    );
  }
}
