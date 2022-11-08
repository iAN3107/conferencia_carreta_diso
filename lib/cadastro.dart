import 'package:conferencia_carreta_diso/services/mensagensErro.dart';
import 'package:conferencia_carreta_diso/services/sql.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var dropdown = 1;

  final conferenteControl = TextEditingController();
  final separadorControl = TextEditingController();
  final errosControl = TextEditingController();
  final comentarioControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: conferenteControl,
                      decoration: InputDecoration(
                        icon: Icon(Icons.account_circle_rounded),
                        labelText: 'Conferente',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: separadorControl,
                      decoration: InputDecoration(
                        labelText: 'Separador',
                        icon: Icon(Icons.search_rounded),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: TextFormField(
                            controller: errosControl,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              icon: Icon(Icons.error_rounded),
                              labelText: 'Erros',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Center(
                            child: DropdownButton(
                              value: dropdown,
                              items: <DropdownMenuItem>[
                                DropdownMenuItem(
                                  value: 0,
                                  child: Text('Manhã'),
                                ),
                                DropdownMenuItem(
                                  value: 1,
                                  child: Text('Tarde'),
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  dropdown = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return SizedBox(
                          height: 300,
                          child: TextFormField(
                            maxLength: 250,
                            controller: comentarioControl,
                            expands: true,
                            minLines: null,
                            maxLines: null,
                            decoration: InputDecoration(
                              labelText: 'Comentário',
                              icon: Icon(Icons.description_rounded),
                            ),
                          ),
                        );
                      },
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          int.parse(errosControl.text);

                          if (conferenteControl.text.isNotEmpty &
                              separadorControl.text.isNotEmpty &
                              errosControl.text.isNotEmpty &
                              comentarioControl.text.isNotEmpty) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: new Text("ATENÇÃO!"),
                                  content: new Text(
                                      "Tem certeza que deseja registrar o erro de ${separadorControl.text} com ${errosControl.text} erros."),
                                  actions: <Widget>[

                                    new ElevatedButton(onPressed: () {
                                         Navigator.of(context).pop();
                                    }, child: Text('Não')),
                                    new ElevatedButton(
                                      child: new Text("Sim"),
                                      onPressed: () {
                                        Navigator.of(context).pop();

                                        SQLServer().cadastraConferencia(conferenteControl.text, separadorControl.text, errosControl.text, dropdown, comentarioControl.text);

                                        conferenteControl.text = '';
                                        separadorControl.text = '';
                                        errosControl.text = '';
                                        comentarioControl.text = '';
                                      },
                                    ),
                                  ],
                                );
                              },
                            );

                            //
                          } else {
                            faltaConferente(context);
                          }
                        } catch (e) {
                          erroInteiro(context);
                        }

                        //faltaConferente();
                      },
                      child: Text('ENVIAR'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(alignment: FractionalOffset.bottomCenter, child: Text('Developed by Vinícius Ian')
          ), SizedBox(height: 10,)
        ],
      ),
    );
  }
}
