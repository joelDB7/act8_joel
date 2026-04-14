class Usuario {
  final int id;
  final String nombre;
  final String correo;
  final String contrasena;
  final String puesto; // Cuarto dato capturado (además del ID)

  Usuario({
    required this.id,
    required this.nombre,
    required this.correo,
    required this.contrasena,
    required this.puesto,
  });
}
