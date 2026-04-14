import 'package:flutter/material.dart';
import 'guardardatosdiccionario.dart';

class CapturaUsuarios extends StatefulWidget {
  const CapturaUsuarios({super.key});

  @override
  State<CapturaUsuarios> createState() => _CapturaUsuariosState();
}

class _CapturaUsuariosState extends State<CapturaUsuarios> {
  final _formKey = GlobalKey<FormState>();
  
  // Controladores para capturar los 4 datos requeridos
  final TextEditingController _nombreCtrl = TextEditingController();
  final TextEditingController _correoCtrl = TextEditingController();
  final TextEditingController _contrasenaCtrl = TextEditingController();
  final TextEditingController _puestoCtrl = TextEditingController();

  void _guardarDatos() {
    if (_formKey.currentState!.validate()) {
      // Usamos nuestro agente para guardar los datos
      GuardarDatosDiccionario.guardarUsuario(
        nombre: _nombreCtrl.text,
        correo: _correoCtrl.text,
        contrasena: _contrasenaCtrl.text,
        puesto: _puestoCtrl.text,
      );

      // Mostrar confirmación
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Usuario guardado exitosamente'),
          backgroundColor: Colors.teal,
          behavior: SnackBarBehavior.floating,
        ),
      );

      // Limpiar el formulario
      _nombreCtrl.clear();
      _correoCtrl.clear();
      _contrasenaCtrl.clear();
      _puestoCtrl.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Capturar Usuario'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: DefaultTextStyle(
            style: const TextStyle(color: Colors.black87),
            child: Form(
              key: _formKey,
              child: Column(
                // Distribución atractiva y elegante
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Registrar Nuevo Empleado',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 30),
                  
                  // Campo 1: Nombre
                  TextFormField(
                    controller: _nombreCtrl,
                    decoration: InputDecoration(
                      labelText: 'Nombre Completo',
                      prefixIcon: const Icon(Icons.person_outline),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    validator: (value) => value!.isEmpty ? 'Requerido' : null,
                  ),
                  const SizedBox(height: 20),

                  // Campo 2: Correo
                  TextFormField(
                    controller: _correoCtrl,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Correo Electrónico',
                      prefixIcon: const Icon(Icons.email_outlined),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    validator: (value) => value!.isEmpty || !value.contains('@') 
                        ? 'Correo inválido' : null,
                  ),
                  const SizedBox(height: 20),

                  // Campo 3: Contraseña
                  TextFormField(
                    controller: _contrasenaCtrl,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      prefixIcon: const Icon(Icons.lock_outline),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    validator: (value) => value!.isEmpty ? 'Requerido' : null,
                  ),
                  const SizedBox(height: 20),

                  // Campo 4: Puesto
                  TextFormField(
                    controller: _puestoCtrl,
                    decoration: InputDecoration(
                      labelText: 'Puesto Asignado',
                      prefixIcon: const Icon(Icons.work_outline),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    validator: (value) => value!.isEmpty ? 'Requerido' : null,
                  ),
                  const SizedBox(height: 40),

                  // Botón de guardar
                  ElevatedButton(
                    onPressed: _guardarDatos,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    child: const Text('Guardar Datos'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
