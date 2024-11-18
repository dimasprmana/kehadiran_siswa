import 'package:flutter/material.dart';
import '../main.dart';

class AttendanceScreen extends StatefulWidget {
  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  Map<String, bool> students = {
    'DIMAS PERMANA': false,
    'DHAFA FIRJATULLAH H.': false,
    'ISHAK HADI P.': false,
    'GILANG BAGUS TRI PAMBUDI': false,
    'M.DZAKY M.': false,
  };

  void _saveData(BuildContext context) {
    int hadir = students.values.where((isPresent) => isPresent).length;
    int tidakHadir = students.values.where((isPresent) => !isPresent).length;

    
    attendanceHistory.add({
      'date': DateTime.now().toLocal().toString().split(' ')[0],
      'details': Map<String, bool>.from(students), 
      'summary': 'Hadir: $hadir, Tidak Hadir: $tidakHadir',
    });

  
    setState(() {
      students.updateAll((key, value) => false);
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Presensi Mahasiswa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: students.keys.map((String name) {
                  return CheckboxListTile(
                    title: Text(name),
                    value: students[name],
                    onChanged: (bool? value) {
                      setState(() {
                        students[name] = value ?? false;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            ElevatedButton(
              onPressed: () => _saveData(context),
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
