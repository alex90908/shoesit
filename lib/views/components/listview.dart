import 'package:flutter/material.dart';

class Sepatu extends StatefulWidget {
  const Sepatu({super.key});

  @override
  State<Sepatu> createState() => _SepatuState();
}

class _SepatuState extends State<Sepatu> {
  final List deskripsi = [
    "Sepatu Nike",
    "Sepatu nIke",
    "Adidad",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Riwayat'),
        ),
        body: ListView.builder(
          itemCount: deskripsi.length,
          itemBuilder: (context, index) {
            return Card(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: ClipOval(
                        child: Image.network(
                          'https://highlight.id/wp-content/uploads/2022/03/model-jenis-desain-sepatu-sneakers-nike-sejarah-history-populer-favorit-terbaru_01.jpg',
                          fit: BoxFit.cover,
                          width: 90,
                          height: 90,
                        ),
                      ),
                    ),
                    title: Text("Laundry Suaka Rajo"),
                    subtitle: Text(deskripsi[index]),
                    trailing: Text("15.000"),
                    onTap: () {},
                  ),
                ));
          },

        ));
  }
}
