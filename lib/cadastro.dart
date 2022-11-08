import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var dropdown =1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(30),
              child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      TextFormField(

                        decoration: InputDecoration(icon: Icon(Icons.account_circle_rounded),
                          labelText: 'Conferente',
                          border: OutlineInputBorder(),
                        ),
                      ),

                      SizedBox(height: 15,),

                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Separador',
                          icon: Icon(Icons.search_rounded),
                          border: OutlineInputBorder(),
                        ),
                      ),

                      SizedBox(height: 15,),

                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween ,children: [
                        Flexible(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              icon: Icon(Icons.error_rounded),
                              labelText: 'Erros',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),

                        Flexible(flex: 1,
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
                                DropdownMenuItem(
                                  value: 2,
                                  child: Text('Noite'),
                                )
                              ],
                              onChanged: (value) {
                                setState(() {
                                  dropdown = value;
                                });
                              },
                            ),
                          ),
                        ),

                      ],)
                    ,

                      SizedBox(height: 15,),

                      LayoutBuilder(
                        builder: (context, constraints) {
                          return SizedBox(height: 300,
                            child: TextFormField(maxLength: 250,
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
                        onPressed: () {

                        },
                        child: Text('ENVIAR'),
                      )
                    ],
              ),
            ),
        ),
        );
  }
}
