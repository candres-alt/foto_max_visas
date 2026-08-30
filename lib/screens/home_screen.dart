import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'consulta_screen.dart';
import 'servicios_screen.dart';
import 'contacto_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void mostrarMensaje(BuildContext context, String opcion) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$opcion estará disponible en el siguiente paso.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        title: const Text('Foto Max Visas'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: Image.asset(
              'assets/icon/foto_max_logo.png',
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 24),

          const Text(
            'Bienvenido a Foto Max Visas',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            'Consulta información de tu visa y accede a nuestros servicios desde un solo lugar.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),

          const SizedBox(height: 30),

          Card(
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: AppColors.primary,
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                'Consultar Visa',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                'Consulta el estado de tu solicitud.',
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const ConsultaScreen(),
    ),
  );
},
            ),
          ),

          const SizedBox(height: 12),

          Card(
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: AppColors.secondary,
                child: Icon(
                  Icons.business_center,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                'Servicios',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                'Conoce los servicios disponibles.',
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const ServiciosScreen(),
    ),
  );
},
            ),
          ),

          const SizedBox(height: 12),

          Card(
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: AppColors.primary,
                child: Icon(
                  Icons.contact_support,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                'Contacto y Ayuda',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                'Encuentra información y canales de contacto.',
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const ContactoScreen(),
    ),
  );
},
            ),
          ),

          const SizedBox(height: 30),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.verified_user,
                  color: AppColors.primary,
                  size: 32,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Información rápida, organizada y fácil de consultar.',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.textDark,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}