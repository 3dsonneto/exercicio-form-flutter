import 'package:flutter/material.dart';

class FormView extends StatefulWidget {
  @override
  _FormViewState createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final _formKey = GlobalKey<FormState>();
  String name = "";
  String lastName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Form(
          key: _formKey,
          child: Center(
            child: Container(
              padding: EdgeInsets.only(right: 18, left: 18),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextFormField(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Campo Nome é obrigatório";
                      }
                      return null;
                    },
                    decoration: InputDecoration(hintText: "Nome"),
                    onChanged: (text) {
                      name = text;
                    },
                  ),
                  TextFormField(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Campo Sobrenome é obrigatório";
                      }
                      return null;
                    },
                    decoration: InputDecoration(hintText: "Sobrenome"),
                    onChanged: (text) {
                      lastName = text;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final isValid = _formKey.currentState.validate();
                      if (isValid) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Olá ${name} ${lastName}"),
                              );
                            });
                      }
                    },
                    child: Text("Validar"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
