import 'package:brasil_fields/brasil_fields.dart';
import 'package:consulta_cep/services/cep_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textCep = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String result = "";

  Future<void> constultaCep() async {
    final cepInfo = await consultar(textCep.text.replaceAll(RegExp(r'[.-]'), ''));
    setState(() {
      result =
          "CEP: ${cepInfo.cep}\n"
          "Logradouro: ${cepInfo.logradouro}\n"
          "Bairro: ${cepInfo.bairro}\n"
          "Cidade: ${cepInfo.localidade} - ${cepInfo.uf}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: Text("Consulta CEP", style: TextStyle(
          color: Theme.of(context).primaryColorDark,
          fontFamily: 'Anton'
        ),),
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
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CepInputFormatter(),
                  ],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('CEP', style: TextStyle(fontFamily: 'Anton'),),
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
                    constultaCep();
                  }
                },
                child: Text('Consultar', style: TextStyle(
                  fontFamily: 'Anton'
                ),),
              ),
              const SizedBox(height: 30),
              Text(result),
            ],
          ),
        ),
      ),
    );
  }
}
