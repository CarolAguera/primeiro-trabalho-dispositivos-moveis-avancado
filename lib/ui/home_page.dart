import 'package:calculadora_de_custo_de_viagem/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   double resultado = 0;

  final precoCombustivelController = TextEditingController();
  final distaciaController = TextEditingController();
  final mediaConsumoVeiculoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custo de Viagem"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          criarCampoTexto("Preco do Combustível: ", precoCombustivelController, true),
          criarCampoTexto("Distancia em KM: ", distaciaController, false),
          criarCampoTexto("Media de Consumo do Veículo: ", mediaConsumoVeiculoController,true),

          ElevatedButton(
            onPressed: calcular,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.calculate_outlined),
                Text("Calcular"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void calcular() {
    double precoCombustivel = double.parse(precoCombustivelController.text);
    double distancia = double.parse(distaciaController.text);
    double mediaDeConsumo = double.parse(mediaConsumoVeiculoController.text);

    resultado = (distancia * precoCombustivel) / mediaDeConsumo;
    mostrarMensagem("O custo da viagem será de: R\$ $resultado");
    setState(() { });
  }

   void mostrarMensagem(String texto) {
     showDialog(
         context: context,
         builder: (context) {
           return AlertDialog(
             title: Text('Resultado'),
             content: Text(texto),
             actions: [
               Botao('Ok', () {
                 Navigator.pop(context);
               })
             ],
           );
         }
     );
   }
  Widget criarCampoTexto(String texto, TextEditingController controlador, bool? prefix) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: TextField(
        controller: controlador,
        decoration: InputDecoration(
          labelText: texto,
          prefixText: prefix != null ? "R\$ " : "KM ",
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}