import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../widgets/service_card.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              'Selecciona una opción para conocer los servicios disponibles.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.85,
                children: const [
                  ServiceCard(
                    title: 'Fotos para visa',
                    description: 'Fotografías según requisitos del trámite.',
                    icon: Icons.photo_camera,
                    color: AppColors.primary,
                  ),
                  ServiceCard(
                    title: 'Formularios',
                    description: 'Apoyo para organizar tu solicitud.',
                    icon: Icons.description,
                    color: AppColors.secondary,
                  ),
                  ServiceCard(
                    title: 'Orientación',
                    description: 'Información general para tu proceso.',
                    icon: Icons.travel_explore,
                    color: AppColors.primary,
                  ),
                  ServiceCard(
                    title: 'Documentos',
                    description: 'Organización de documentos importantes.',
                    icon: Icons.folder_copy,
                    color: AppColors.secondary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}