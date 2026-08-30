import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class ContactoScreen extends StatelessWidget {
  const ContactoScreen({super.key});

  void mostrarInformacion(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Foto Max Visas'),
          content: const Text(
            'Esta aplicación facilita el acceso a información y herramientas relacionadas con el proceso de visa.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        title: const Text('Contacto y Ayuda'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: Image.asset(
              'assets/icon/foto_max_logo.png',
              height: 90,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 24),

          const Text(
            '¿Necesitas ayuda?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            'Encuentra información útil para continuar con tu proceso.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),

          const SizedBox(height: 28),

          const Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.primary,
                child: Icon(
                  Icons.support_agent,
                  color: Colors.white,
                ),
              ),
              title: Text('Asistencia'),
              subtitle: Text(
                'Consulta información relacionada con tu trámite.',
              ),
            ),
          ),

          const SizedBox(height: 12),

          const Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.secondary,
                child: Icon(
                  Icons.public,
                  color: Colors.white,
                ),
              ),
              title: Text('Recursos oficiales'),
              subtitle: Text(
                'Accede a fuentes oficiales relacionadas con visas.',
              ),
            ),
          ),

          const SizedBox(height: 20),

          const Divider(),

          const SizedBox(height: 20),

          ElevatedButton.icon(
            onPressed: () => mostrarInformacion(context),
            icon: const Icon(Icons.info_outline),
            label: const Text('Acerca de Foto Max Visas'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ],
      ),
    );
  }
}