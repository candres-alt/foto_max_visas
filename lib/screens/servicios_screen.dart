import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class ServiciosScreen extends StatelessWidget {
  const ServiciosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        title: const Text('Servicios'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Nuestros servicios',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Conoce algunas de las opciones disponibles en Foto Max Visas.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 24),

          Card(
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: AppColors.primary,
                child: Icon(
                  Icons.photo_camera,
                  color: Colors.white,
                ),
              ),
              title: const Text('Fotos para visa'),
              subtitle: const Text(
                'Fotografías con los requisitos necesarios para tu trámite.',
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ),

          const SizedBox(height: 12),

          Card(
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: AppColors.secondary,
                child: Icon(
                  Icons.description,
                  color: Colors.white,
                ),
              ),
              title: const Text('Asistencia en formularios'),
              subtitle: const Text(
                'Apoyo para organizar la información de tu solicitud.',
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ),

          const SizedBox(height: 12),

          Card(
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: AppColors.primary,
                child: Icon(
                  Icons.travel_explore,
                  color: Colors.white,
                ),
              ),
              title: const Text('Orientación de trámites'),
              subtitle: const Text(
                'Información general para facilitar tu proceso.',
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}