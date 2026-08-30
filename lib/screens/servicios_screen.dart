import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../widgets/service_card.dart';

class ServiciosScreen extends StatefulWidget {
  const ServiciosScreen({super.key});

  @override
  State<ServiciosScreen> createState() => _ServiciosScreenState();
}

class _ServiciosScreenState extends State<ServiciosScreen> {
  final Set<int> favoritos = {};

  void cambiarFavorito(int index, String nombre) {
    setState(() {
      if (favoritos.contains(index)) {
        favoritos.remove(index);
      } else {
        favoritos.add(index);
      }
    });

    final bool agregado = favoritos.contains(index);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          agregado
              ? '$nombre agregado a favoritos.'
              : '$nombre eliminado de favoritos.',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final servicios = [
      {
        'title': 'Fotos para visa',
        'description': 'Fotografías según requisitos del trámite.',
        'icon': Icons.photo_camera,
        'color': AppColors.primary,
      },
      {
        'title': 'Formularios',
        'description': 'Apoyo para organizar tu solicitud.',
        'icon': Icons.description,
        'color': AppColors.secondary,
      },
      {
        'title': 'Orientación',
        'description': 'Información general para tu proceso.',
        'icon': Icons.travel_explore,
        'color': AppColors.primary,
      },
      {
        'title': 'Documentos',
        'description': 'Organización de documentos importantes.',
        'icon': Icons.folder_copy,
        'color': AppColors.secondary,
      },
    ];

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
              'Marca con el corazón tus servicios favoritos.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: servicios.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.78,
                ),
                itemBuilder: (context, index) {
                  final servicio = servicios[index];

                  return ServiceCard(
                    title: servicio['title'] as String,
                    description: servicio['description'] as String,
                    icon: servicio['icon'] as IconData,
                    color: servicio['color'] as Color,
                    isFavorite: favoritos.contains(index),
                    onFavorite: () => cambiarFavorito(
                      index,
                      servicio['title'] as String,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}