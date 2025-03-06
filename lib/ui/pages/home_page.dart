import 'package:consulta_cep/services/cep_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final textCep = TextEditingController();
    final formKey = GlobalKey<FormState>();
    String result = "";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Consulta CEP"),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 400,
                child: TextFormField(
                  controller: textCep,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('CEP'),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'CEP não informado!';
                    }

                    return null;
                  },
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                     final cepInfo = await consultar(textCep.text);
                     setState(() {
                       result = "CEP: ${cepInfo.bairro}\n"
                        "Logradouro: ${cepInfo.logradouro}\n"
                        "Bairro: ${cepInfo.bairro}\n"
                        "Cidade: ${cepInfo.localidade} - ${cepInfo.uf}";
                     });
                  }
                },
                child: Text('Consultar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
