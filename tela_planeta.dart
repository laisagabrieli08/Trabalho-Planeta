
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TelaPlaneta extends StatefulWidget {
  const TelaPlaneta({super.key});

  @override
  State<TelaPlaneta> createState() => _TelaPlanetaState();
}

class _TelaPlanetaState extends State<TelaPlaneta> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _tamanhoController = TextEditingController();
  final TextEditingController _distanciaController = TextEditingController();
  final TextEditingController _apelidoController = TextEditingController();
      
  final Planeta _planeta = Planeta.vazio();

  @override
  void dispose() {
    _nomeController.dispose();
    _tamanhoController.dispose();
    _distanciaController.dispose();
    _apelidoController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Dados do planeta salvos com sucesso!\n
              '${_planeta.nome}\n'
              '${_planeta.tamanho}\n'
              '${_planeta.distancia}\n'
              '${_planeta.apelido}')), // Text // SnackBar
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         centerTitle: true,
         title: const Text('Cadastrar Planeta'),
         elevation: 3,
      ), // AppBar
      body: padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(
                  LabelText: 'Nome',
                ), // InputDecoration(
                  autovalidadeMode: AutovalidadeMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value!;
                    }
                    return null;
                  },
                ), // TextFormField
                TextFormField(
                  controller: _tamanhoController,
                  decoration:
                      const InputDecoration(labelText: 'Tamanho (em km)'),
                  keyboardType: TextInputType.number,
                  autovalidadeMode: AutovalidadeMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, informe o tamanho do planeta.';
                    },
                  ), // TextFormField
                  TextFormField(
                    controller: _distanciaController,
                    decoration: const InputDecoration(
                      const Inputdecoration(labelText: 'Distância (em km)'),
                    keyboardType: TextInputType.number,
                    autovalidadeMode: AutovalidadeMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, informe a distância do planeta';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Insira um valor numérico válido';
                      }
                      return null;
                    },
                    // onSaved: (value) {
                    // _planeta.distancia = double.parse(value!)
                    // },
                  ), // TextFormField
                  TextFormField(
                    controller: _apelidoController,
                    decoration: const InputDecoration(labelText: 'Apelido'),
                    onSaved: (value) {
                      _planeta.apelido = value!;
                      },
                    ), // TextFormField
                    const SizedBox(
                      height: 20.0,
                    ), // SizedBox
                    ElevatedButton(
                      onPressed: _submitForm, //_submitForm,
                      child: const Text('Salvar'),
                    )
                  ]
                ), // Column
              ), // SingleChildScrollView
            ), // Form
          ), // Padding
