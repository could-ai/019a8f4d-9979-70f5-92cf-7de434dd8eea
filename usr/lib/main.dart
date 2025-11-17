import 'package:flutter/material.dart';
import 'package:couldai_user_app/screens/remote_control_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Universal Remote Control',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF212121),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
      ),
      home: const DeviceSelectionScreen(),
    );
  }
}

class DeviceSelectionScreen extends StatelessWidget {
  const DeviceSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Device'),
        backgroundColor: Colors.grey[900],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: <Widget>[
          DeviceCard(
            deviceName: 'TV',
            icon: Icons.tv,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RemoteControlScreen(device: 'TV'),
                ),
              );
            },
          ),
          DeviceCard(
            deviceName: 'Air Conditioner',
            icon: Icons.ac_unit,
            onTap: () {
              // Navigate to a different remote screen or pass different config
            },
          ),
          DeviceCard(
            deviceName: 'Sound System',
            icon: Icons.speaker,
            onTap: () {
              // Navigate to a different remote screen or pass different config
            },
          ),
          DeviceCard(
            deviceName: 'Projector',
            icon: Icons.videocam,
            onTap: () {
              // Navigate to a different remote screen or pass different config
            },
          ),
        ],
      ),
    );
  }
}

class DeviceCard extends StatelessWidget {
  final String deviceName;
  final IconData icon;
  final VoidCallback onTap;

  const DeviceCard({
    super.key,
    required this.deviceName,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Card(
        elevation: 4,
        color: Colors.grey[850],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              deviceName,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
