import 'package:flutter/material.dart';

class DeviceList extends StatelessWidget {
  const DeviceList({ super.key });

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Column(
          spacing: 15,
          children: [
            DeviceCard(deviceName: "Device 1", lastSeen: DateTime(2025, 11, 2),),
            DeviceCard(deviceName: "Device 2", lastSeen: DateTime(2025, 12, 2),),
            DeviceCard(deviceName: "Device 3",),
            DeviceCard(deviceName: "Device 4",),
            DeviceCard(deviceName: "Device 5",),
            DeviceCard(deviceName: "Device 6",),
            DeviceCard(deviceName: "Device 7", lastSeen: DateTime(2025, 12, 2),),
            DeviceCard(deviceName: "Device 8",),
          ],
        ),
      ),
    );
  }
}

class DeviceCard extends StatelessWidget {
  final String deviceName;
  final DateTime? lastSeen;
  
  const DeviceCard({ super.key, required this.deviceName, this.lastSeen });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 246, 242, 229),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: SizedBox(
          height: 100,
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Device Name: $deviceName",
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Spacer(),
              (lastSeen != null ? (
                Container(
                  alignment: Alignment.bottomRight,
                  child: Opacity(
                    opacity: 0.5,
                    child: Text(
                      lastSeen.toString(),
                    ),
                  ),
                )
              ) : (
                Container(
                  alignment: Alignment.bottomRight,
                  child: const Text(
                    "ONLINE",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              )
              ),
            ],
          ),
        ),
      ),
    );
  }
}