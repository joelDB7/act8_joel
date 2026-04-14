import 'package:flutter/material.dart';
import 'diccionariousuario.dart';

class VerUsuarios extends StatelessWidget {
  const VerUsuarios({super.key});

  @override
  Widget build(BuildContext context) {
    // Convertir los valores del diccionario en una lista para facilitar el renderizado
    final listaUsuarios = datosusuario.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuarios Registrados'),
      ),
      body: listaUsuarios.isEmpty
          ? const Center(
              child: Text(
                'Aún no hay usuarios registrados en el diccionario.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: listaUsuarios.length,
              itemBuilder: (context, index) {
                final usuario = listaUsuarios[index];
                
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.teal.shade100,
                      child: Text(
                        usuario.id.toString(),
                        style: const TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    title: Text(
                      usuario.nombre,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('💼 Puesto: ${usuario.puesto}'),
                          Text('📧 Correo: ${usuario.correo}'),
                          Text('🔑 Contraseña: ${List.filled(usuario.contrasena.length, '*').join()}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
