import 'package:flutter/material.dart';
import 'package:contrasenas/views/controller/contrasenasController.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Inicio extends StatefulWidget {
  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  double _currentSliderValue = 20;
  Map<String, dynamic> values = {
    'allow': false,  
    'mayuscula': false,
    'minuscula': false,
    'numero': false,
    'simbolo': false,
    'valid': false,
    'accepted': '',
  };
  final contrasenasController _contrasenasController = contrasenasController();
  final TextEditingController _textController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        Column(children: [
          TextField(
          controller: _textController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Su Contraseña',
            suffixIcon:IconButton(
              icon: Icon(Icons.content_copy),
                onPressed: () {
                Clipboard.setData(ClipboardData(text: _textController.text));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                content: Text('Texto copiado al portapapeles'),
              ),
            );
          },
          ), 
          ),
        ),
        
        ],
        ),
        
        const SizedBox(height: 20), 
        const Text(
          "Personalice su contraseña",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20, 
            fontWeight: FontWeight.bold, 
          ),
        ),
        const SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Tamaño de la contraseña: "),
          Text(_currentSliderValue.toInt().toString())
        ],
        ),
        Slider(
          value: _currentSliderValue,
          max: 20,
          min: 7,
          activeColor: Color.fromARGB(255, 0, 71, 169),
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value;
            });
          },
        ),
        RadioListTile(
          title: const Text("Fácil de decir"),
          value: 'FACILD',
          groupValue: values["accepted"],
          onChanged: (newValue) {
            setState(() {
              if (newValue == 'FACILD') {
                values["mayuscula"] = true;
                values["minuscula"] = true;
                values["numero"] = false;
                values["simbolo"] = false;
              }
              values["accepted"] = newValue;
            });
          },
        ),
        RadioListTile(
          title: const Text("Fácil de leer"),
          value: 'FACILLE',
          groupValue: values["accepted"],
          onChanged: (newValue) {
            setState(() {
              values["accepted"] = newValue;
            });
          },
        ),
        RadioListTile(
          title: const Text("Todos los caracteres"),
          value: 'ALL',
          groupValue: values["accepted"],
          onChanged: (newValue) {
            setState(() {
              values["accepted"] = newValue;
              values["mayuscula"] = true;
              values["minuscula"] = true;
              values["numero"] = true;
              values["simbolo"] = true;
              
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Mayúsculas"),
          value: values["mayuscula"],
          onChanged: (newValue) {
            setState(() {
              values["mayuscula"] = newValue;
              if(values["accepted"]==""){values["accepted"] = "ALL";}
              
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Minúsculas"),
          value: values["minuscula"],
          onChanged: (newValue) {
            setState(() {
              values["minuscula"] = newValue;
              if(values["accepted"]==""){values["accepted"] = "ALL";}
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Números"),
          value: values["numero"],
          onChanged: values["accepted"] == 'FACILD' ? null : (newValue) {
            setState(() {
              values["numero"] = newValue;
              if(values["accepted"]==""){values["accepted"] = "ALL";}
              
            });
          },
        ),
        CheckboxListTile(
          title: const Text("Simbolos"),
          value: values["simbolo"],
          onChanged: values["accepted"] == 'FACILD' ? null : (newValue) {
            setState(() {
              values["simbolo"] = newValue;
              if(values["accepted"]==""){values["accepted"] = "ALL";}
            });
          },
        ),
        ElevatedButton(
           onPressed: () {
            setState(() {
              String nuevaContra;
              if (values["mayuscula"] || values["minuscula"] || values["numero"] || values["simbolo"]) {
                if(values["accepted"] == 'FACILD' || values["accepted"]=='ALL'){
                  nuevaContra = _contrasenasController.generarContra(
                  _currentSliderValue.toInt(),
                  values["mayuscula"],
                  values["minuscula"],
                  values["numero"],
                  values["simbolo"]
                );
                }else if(values['accepted']=='FACILLE'){
                  nuevaContra = _contrasenasController.generarContraFacil(
                  _currentSliderValue.toInt(),
                  values["mayuscula"],
                  values["minuscula"],
                  values["numero"],
                  values["simbolo"]
                  );
                }else{
                  nuevaContra = "Debes seleccionar al menos una opción.";
                }
              } else {
                nuevaContra = "Debes seleccionar al menos una opción.";
              }
              _textController.text = nuevaContra;
            });
          },
          child: const Text('Generar',style: TextStyle(color: Colors.blue),),
        ),
      ],
    );
  }
}