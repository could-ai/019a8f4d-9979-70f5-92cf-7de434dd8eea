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

  // Method to show the brand selection dialog
  void _showBrandSelectionDialog(
      BuildContext context, String deviceName, List<String> brands) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select a $deviceName Brand'),
          content: SizedBox(
            width: double.minPositive,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: brands.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(brands[index]),
                  onTap: () {
                    Navigator.of(context).pop(); // Close the dialog
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RemoteControlScreen(
                          device: deviceName,
                          brand: brands[index], // Pass the selected brand
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          backgroundColor: Colors.grey[850],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Brand lists
    const tvBrands = ['Samsung', 'LG', 'Sony', 'Panasonic'];
    const acBrands = ['Daikin', 'LG', 'Carrier', 'Mitsubishi'];
    const soundSystemBrands = ['Sony', 'Bose', 'JBL', 'Yamaha'];
    const projectorBrands = ['Epson', 'BenQ', 'Optoma', 'ViewSonic'];

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
              _showBrandSelectionDialog(context, 'TV', tvBrands);
            },
          ),
          DeviceCard(
            deviceName: 'Air Conditioner',
            icon: Icons.ac_unit,
            onTap: () {
              _showBrandSelectionDialog(
                  context, 'Air Conditioner', acBrands);
            },
          ),
          DeviceCard(
            deviceName: 'Sound System',
            icon: Icons.speaker,
            onTap: () {
              _showBrandSelectionDialog(
                  context, 'Sound System', soundSystemBrands);
            },
          ),
          DeviceCard(
            deviceName: 'Projector',
            icon: Icons.videocam,
            onTap: () {
              _showBrandSelectionDialog(context, 'Projector', projectorBrands);
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
