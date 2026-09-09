import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/app_colors.dart';
import '../data/services_data.dart';
import '../providers/favorites_provider.dart';
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
              'Marca con el corazón tus servicios favoritos.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Consumer<FavoritesProvider>(
                builder: (context, favoritesProvider, child) {
                  return GridView.builder(
                    itemCount: servicesData.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.66,
                    ),
                    itemBuilder: (context, index) {
                      final service = servicesData[index];

                      return ServiceCard(
                        title: service.title,
                        description: service.description,
                        icon: service.icon,
                        color: service.color,
                        isFavorite:
                            favoritesProvider.isFavorite(service),
                        onFavorite: () {
                          final bool wasFavorite =
                              favoritesProvider.isFavorite(service);

                          favoritesProvider.toggleFavorite(service);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                wasFavorite
                                    ? '${service.title} eliminado de favoritos.'
                                    : '${service.title} agregado a favoritos.',
                              ),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                      );
                    },
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