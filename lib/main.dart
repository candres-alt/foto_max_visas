import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'screens/home_screen.dart';
void main() {
  runApp(const FotoMaxApp());
}

class FotoMaxApp extends StatelessWidget {
  const FotoMaxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foto Max Visas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1565C0),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class ConsultaVisaPage extends StatefulWidget {
  const ConsultaVisaPage({super.key});

  @override
  State<ConsultaVisaPage> createState() => _ConsultaVisaPageState();
}

class _ConsultaVisaPageState extends State<ConsultaVisaPage> {
  String mensaje = 'Ingresa tu número de solicitud para continuar.';
  final TextEditingController applicationIdController = TextEditingController();

  Future<void> consultarEstado() async {
  final applicationId = applicationIdController.text.trim();

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

  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    setState(() {
      mensaje = 'No se pudo abrir el sitio oficial.';
    });
  }
}
Future<void> abrirConsultaOficial() async {
  final Uri url = Uri.parse(
    'https://ceac.state.gov/CEACStatTracker/Status.aspx?App=NIV',
  );

  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('No se pudo abrir el sitio oficial.');
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
        title: const Text('Foto Max Visas'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),

            Image.asset(
  'assets/icon/foto_max_logo.png',
  height: 90,
  fit: BoxFit.contain,
),

            const SizedBox(height: 20),

            const Text(
              'Consulta el estado de tu visa',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Ingresa tu Application ID para preparar la consulta.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 30),

            TextField(
              controller: applicationIdController,
              decoration: InputDecoration(
                labelText: 'Application ID',
                hintText: 'Ejemplo: AA00ABC123',
                prefixIcon: Icon(Icons.badge_outlined),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton.icon(
  onPressed: consultarEstado,
  icon: const Icon(Icons.search),
  label: const Text('Consultar estado'),
  style: ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(vertical: 16),
  ),
),

const SizedBox(height: 12),

OutlinedButton.icon(
  onPressed: abrirConsultaOficial,
  icon: const Icon(Icons.open_in_new),
  label: const Text('Ir al sitio oficial'),
  style: OutlinedButton.styleFrom(
    padding: const EdgeInsets.symmetric(vertical: 16),
  ),
),
            const SizedBox(height: 25),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: Color(0xFF1565C0),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        mensaje,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}