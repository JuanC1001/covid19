import 'package:flutter/foundation.dart';

class MyProvider with ChangeNotifier {
  //Creamos una clase "MyProvider" y le agregamos las capacidades de Change Notifier.
  /*
    La propiedad WITH
    Un mixin se refiere a  agregar las capacidades de otra clase o clases a nuestra propia clase,
    sin heredar de esas clases. Los métodos de esas clases ahora pueden llamarse en su clase, y el código
    dentro de esas clases se ejecutará. Dart no tiene herencia múltiple, pero el uso de mixins le permite
    plegarse en otras clases para lograr la reutilización del código y evitar los problemas que podría causar
   la herencia múltiple.
  */

  String _origen =null; //Dentro de nuestro provider, creamos e inicializamos nuestra variable origen.
  String _destino =null; //Dentro de nuestro provider, creamos e inicializamos nuestra variable destino.
  String _horaSalida =null; //Dentro de nuestro provider, creamos e inicializamos nuestra variable origen.
  String _horaLlegada =null; //Dentro de nuestro provider, creamos e inicializamos nuestra variable destino
  String _cooperativa =null; //Dentro de nuestro provider, creamos e inicializamos nuestra variable origen.
  double _tarifa =null; //Dentro de nuestro provider, creamos e inicializamos nuestra variable destino
  int _cantidadAsiento =null; //Dentro de nuestro provider, creamos e inicializamos nuestra variable destino
  double _total =null; //Dentro de nuestro provider, creamos e inicializamos nuestra variable destino
  String _QR =null; //Dentro de nuestro provider, creamos e inicializamos nuestra variable destino
  String _fechaReserva =null; //Dentro de nuestro provider, creamos e inicializamos nuestra variable destino
  String _fechaViaje =null; //Dentro de nuestro provider, creamos e inicializamos nuestra variable destino
  List _numeroAsientos = [];

  String _email =null; //Dentro de nuestro provider, creamos e inicializamos nuestra variable destino



  String get miorigen => _origen; //Creamos el metodo Get, para poder obtener el valor de mitexto
  String get midestino => _destino; //Creamos el metodo Get, para poder obtener el valor de mitexto
  String get mihoraSalida => _horaSalida; //Creamos el metodo Get, para poder obtener el valor de mitexto
  String get mihoraLlegada => _horaLlegada; //Creamos el metodo Get, para poder obtener el valor de mitexto
  String get micooperativa => _cooperativa; //Creamos el metodo Get, para poder obtener el valor de mitexto
  double get mitarifa => _tarifa; //Creamos el metodo Get, para poder obtener el valor de mitexto
  int get micantidadAsientos => _cantidadAsiento; //Creamos el metodo Get, para poder obtener el valor de mitexto
  double get miTotal => _total; //Creamos el metodo Get, para poder obtener el valor de mitexto
  String get mifechaReserva => _fechaReserva; //Creamos el metodo Get, para poder obtener el valor de mitexto
  String get mifechaViaje => _fechaViaje; //Creamos el metodo Get, para poder obtener el valor de mitexto
  List get minumeroAsientos => _numeroAsientos; //Creamos el metodo Get, para poder obtener el valor de mitexto

  String get miemail => _email; //Creamos el metodo Get, para poder obtener el valor de mitexto


  //Ahora creamos el metodo set para poder actualizar el valor de _mitexto, este metodo recibe un valor newTexto de tipo String

  set miemail(String newTexto) {
    _email = newTexto; //actualizamos el valor
    notifyListeners(); //notificamos a los widgets que esten escuchando el stream.
  }

  set miorigen(String newTexto) {
    _origen = newTexto; //actualizamos el valor
    notifyListeners(); //notificamos a los widgets que esten escuchando el stream.
  }
  set midestino(String newTexto) {
    _destino = newTexto; //actualizamos el valor
    notifyListeners(); //notificamos a los widgets que esten escuchando el stream.
  }
  set mihoraSalida (String newTexto) {
    _horaSalida = newTexto; //actualizamos el valor
    notifyListeners(); //notificamos a los widgets que esten escuchando el stream.
  }
  set mihoraLlegada (String newTexto) {
    _horaLlegada = newTexto; //actualizamos el valor
    notifyListeners(); //notificamos a los widgets que esten escuchando el stream.
  }
  set micooperativa (String newTexto) {
    _cooperativa = newTexto; //actualizamos el valor
    notifyListeners(); //notificamos a los widgets que esten escuchando el stream.
  }
  set mitarifa (double newTexto) {
    _tarifa = newTexto; //actualizamos el valor
    notifyListeners(); //notificamos a los widgets que esten escuchando el stream.
  }
  set micantidadAsientos (int newTexto) {
    _cantidadAsiento = newTexto; //actualizamos el valor
    notifyListeners(); //notificamos a los widgets que esten escuchando el stream.
  }
  set miTotal (double newTexto) {
    _total = newTexto; //actualizamos el valor
    notifyListeners(); //notificamos a los widgets que esten escuchando el stream.
  }
  set mifechaResetvaa (String newTexto) {
    _fechaReserva = newTexto; //actualizamos el valor
    notifyListeners(); //notificamos a los widgets que esten escuchando el stream.
  }
  set mifechaViaje (String newTexto) {
    _fechaViaje = newTexto; //actualizamos el valor
    notifyListeners(); //notificamos a los widgets que esten escuchando el stream.
  }
  set minumeroAsientos (List newTexto) {
    _numeroAsientos = newTexto; //actualizamos el valor
    notifyListeners(); //notificamos a los widgets que esten escuchando el stream.
  }
}