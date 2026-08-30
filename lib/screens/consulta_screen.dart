import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_colors.dart';

class ConsultaScreen extends StatefulWidget {
  const ConsultaScreen({super.key});

  @override
  State<ConsultaScreen> createState() => _ConsultaScreenState();
}

class _ConsultaScreenState extends State<ConsultaScreen> {
  final TextEditingController applicationIdController =
      TextEditingController();

  String mensaje = 'Ingresa tu número de solicitud para continuar.';

  Future<void> consultarEstado() async {
    final String applicationId = applicationIdController.text.trim();

    if (applicationId.isEmpty) {
      setState(() {
        mensaje = 'Ingresa tu Application ID para continuar.';
      });
      return;
    }

    setState(() {
      mensaje = 'Application ID ingresado: $applicationId';
    });

    final Uri url = Uri.parse(
      'https://ceac.state.gov/CEACStatTracker/Status.aspx?App=NIV',
    );

    final bool abierto = await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );

    if (!abierto && mounted) {
      setState(() {
        mensaje = 'No se pudo abrir el sitio oficial.';
      });
    }
  }

  Future<void> abrirConsultaOficial() async {
    final Uri url = Uri.parse(
      'https://ceac.state.gov/CEACStatTracker/Status.aspx?App=NIV',
    );

    final bool abierto = await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );

    if (!abierto && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No se pudo abrir el sitio oficial.'),
        ),
      );
    }
  }

  @override
  void dispose() {
    applicationIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        title: const Text('Consultar Visa'),
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
            'Consulta el estado de tu visa',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Ingresa tu Application ID y accede al sistema oficial CEAC.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 25),
          TextField(
            controller: applicationIdController,
            decoration: InputDecoration(
              labelText: 'Application ID',
              hintText: 'Ejemplo: AA00ABC123',
              prefixIcon: const Icon(Icons.badge),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: consultarEstado,
            icon: const Icon(Icons.search),
            label: const Text('Consultar estado'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: abrirConsultaOficial,
            icon: const Icon(Icons.open_in_new),
            label: const Text('Ir al sitio oficial'),
          ),
          const SizedBox(height: 25),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.info_outline,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    mensaje,
                    style: const TextStyle(
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