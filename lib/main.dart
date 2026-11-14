import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp()); // Ejecuto la aplicación.
}

// Esta clase contiene la configuración principal de mi aplicación.
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor de la clase.

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Aquí configuro mi aplicación.
      title: 'Saludo UAE', // Coloco el nombre de la aplicación.
      theme: ThemeData( // Aquí defino los colores que voy a utilizar.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green), // Utilizo el color  como base.
      ),
      home: const MyHomePage(title: 'SALUDO UAE 6SB'), // Indico la pantalla principal.
    );
  }
}

// Esta clase representa la pantalla donde voy a ingresar mi nombre.
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title}); // Recibo el título de la pantalla.

  final String title; // Guardo el título que voy a mostrar.

  @override
  State<MyHomePage> createState() => _MyHomePageState(); // Creo el contenido de mi pantalla.
}

// Aquí voy a controlar lo que sucede en la pantalla.
class _MyHomePageState extends State<MyHomePage> {

  final TextEditingController _controller = TextEditingController(); // Utilizo esto para leer el nombre que escribo.

  String _resultado = ''; // Aquí guardo el mensaje que aparecerá después de saludar.

  // Esta función se ejecuta cuando presiono el botón Saludar.
  void _saludar() {

    String nombre = _controller.text; // Obtengo el nombre que escribí en la caja de texto.

    if (nombre.isEmpty) { // Compruebo si dejé la caja de texto vacía.
      setState(() {
        _resultado = 'Por favor, ingrese su nombre.'; // Muestro un mensaje si no escribí nada.
      });
      return; // Termino la función para que no continúe.
    }

    setState(() {
      _resultado = 'Hola, $nombre! Bienvenido a UAE.'; // Muestro el saludo con el nombre ingresado.
    });
  }

  // Aquí comienza la parte visual de mi pantalla.
  @override
  Widget build(BuildContext context) {
    return Scaffold( // Creo la estructura principal de la pantalla.

      appBar: AppBar( // Esta es la barra que aparece en la parte superior.
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary, // Utilizo un color del tema que configuré.
        title: Text(widget.title), // Muestro el título de mi aplicación.
      ),

      body: Padding( // Agrego un espacio alrededor del contenido.
        padding: const EdgeInsets.all(16.0),

        child: Column( // Organizo los elementos uno debajo del otro.
          crossAxisAlignment: CrossAxisAlignment.start, // Alineo los elementos hacia la izquierda.

          children: [

            const Text("INGRESA TU NOMBRE:"), // Muestro una indicación para que escriba su nombre.

            const SizedBox(height: 10), // Dejo un pequeño espacio.

            TextField(controller: _controller), // Creo la caja donde voy a escribir mi nombre.

            const SizedBox(height: 20), // Dejo espacio antes del botón.

            ElevatedButton( // Creo el botón para realizar el saludo.
              onPressed: _saludar, // Llamo a la función cuando presiono el botón.
              child: const Text('Saludar'), // Coloco el texto que aparece en el botón.
            ),

            const SizedBox(height: 20), // Dejo espacio antes del resultado.

            Text(_resultado), // Muestro el mensaje de saludo o el aviso si no ingresé un nombre.

          ],
        ),
      ),
    );
  }
}
