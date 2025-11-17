import 'package:flutter/material.dart';
import 'package:couldai_user_app/widgets/remote_button.dart';

class RemoteControlScreen extends StatelessWidget {
  final String device;
  final String brand;

  const RemoteControlScreen(
      {super.key, required this.device, required this.brand});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$brand $device Remote'),
        backgroundColor: Colors.grey[900],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Power and Mute buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RemoteButton(
                    icon: Icons.power_settings_new,
                    color: Colors.red,
                    onPressed: () {},
                  ),
                  RemoteButton(
                    icon: Icons.volume_off,
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // D-Pad
              _buildDPad(),

              const SizedBox(height: 20),

              // Volume and Channel Rockers
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildRocker('VOL', Icons.add, Icons.remove),
                  _buildRocker('CH', Icons.keyboard_arrow_up,
                      Icons.keyboard_arrow_down),
                ],
              ),
              const SizedBox(height: 30),

              // Number Pad
              _buildNumberPad(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDPad() {
    return Column(
      children: [
        RemoteButton(icon: Icons.keyboard_arrow_up, onPressed: () {}),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RemoteButton(icon: Icons.keyboard_arrow_left, onPressed: () {}),
            const SizedBox(width: 60),
            RemoteButton(icon: Icons.keyboard_arrow_right, onPressed: () {}),
          ],
        ),
        const SizedBox(height: 10),
        RemoteButton(icon: Icons.keyboard_arrow_down, onPressed: () {}),
        Positioned.fill(
          child: Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
                backgroundColor: Colors.grey[800],
              ),
              child: const Text('OK', style: TextStyle(fontSize: 16)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRocker(String label, IconData upIcon, IconData downIcon) {
    return Column(
      children: [
        RemoteButton(icon: upIcon, onPressed: () {}),
        const SizedBox(height: 10),
        Text(label, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 10),
        RemoteButton(icon: downIcon, onPressed: () {}),
      ],
    );
  }

  Widget _buildNumberPad() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 1.5,
      ),
      itemCount: 9,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return RemoteButton(
          child: Text(
            '${index + 1}',
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          onPressed: () {},
        );
      },
    );
  }
}
