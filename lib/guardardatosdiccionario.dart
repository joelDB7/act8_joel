import 'claseusuario.dart';
import 'diccionariousuario.dart';

class GuardarDatosDiccionario {
  // Agente o clase para modificar el archivo diccionariousuario.dart
  static void guardarUsuario({
    required String nombre,
    required String correo,
    required String contrasena,
    required String puesto,
  }) {
    // Generar ID autonumérico
    int idNuevo = contadorId++;
    
    // Crear la instancia de usuario
    Usuario nuevoUsuario = Usuario(
      id: idNuevo,
      nombre: nombre,
      correo: correo,
      contrasena: contrasena,
      puesto: puesto,
    );
    
    // Guardar en el diccionario
    datosusuario[idNuevo] = nuevoUsuario;
  }
}
