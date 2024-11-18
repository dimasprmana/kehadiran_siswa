import 'package:flutter/material.dart';
import '../main.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Kehadiran Mahasiswa',
        style: TextStyle(color: Colors.blue),
      )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: attendanceHistory.length,
          itemBuilder: (context, index) {
            final history = attendanceHistory[index];
            return ExpansionTile(
              title: Text('${history['date']}'),
              subtitle: Text('${history['summary']}'),
              children: [
                ...history['details'].keys.map((name) {
                  return ListTile(
                    title: Text(name),
                    trailing: Text(history['details'][name] ? 'Hadir' : 'Tidak Hadir'),
                  );
                }).toList(),
              ],
            );
          },
        ),
      ),
    );
  }
}
