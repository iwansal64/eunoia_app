import 'package:flutter/material.dart';

class AboutContent extends StatelessWidget {
  const AboutContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.all(2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 25,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "😪 Apa itu Microsleep?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const Text(
                  "Microsleep adalah episode tidur singkat yang terjadi tanpa disadari, biasanya berlangsung dari sepersekian detik hingga sekitar 30 detik.",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w100
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "🤔 Bagaimana Microsleep Terjadi",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const Text(
                  "Microsleep biasanya terjadi ketika seseorang:",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w100
                  ),
                ),
                BulletPoint(content: "Sangat lelah atau kurang tidur",),
                BulletPoint(content: "Melakukan aktivitas monoton dan berulang (seperti menyetir jarak jauh atau menatap layar lama)",),
                BulletPoint(content: "Memaksakan diri tetap terjaga terlalu lama",),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "💀 Mengapa Microsleep Berbahaya?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const Text(
                  "Microsleep bisa sangat berbahaya, terutama saat melakukan aktivitas yang membutuhkan konsentrasi tinggi, seperti:",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w100
                  ),
                ),
                BulletPoint(content: "Mengemudi",),
                BulletPoint(content: "Mengoperasikan mesin",),
                BulletPoint(content: "Menangani pasien atau bekerja di bidang penerbangan",),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "👀 Tanda-Tanda Microsleep",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const Text(
                  "Beberapa tanda bahwa seseorang mungkin mengalami microsleep:",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w100
                  ),
                ),
                BulletPoint(content: "Tiba-tiba tidak ingat apa yang baru saja dilakukan",),
                BulletPoint(content: "Detak jantung melambat secara tiba-tiba",),
                BulletPoint(content: "Mata berkedip lambat atau terasa berat",),
                BulletPoint(content: "Melewatkan kata atau informasi saat membaca atau mendengarkan",),
                BulletPoint(content: "Kendaraan bergeser dari jalur tanpa disadari",),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "😎 Cara Mencegah Microsleep",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const Text(
                  "Inilah beberapa cara untuk menghindari Microsleep:",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w100
                  ),
                ),
                BulletPoint(content: "Tidurlah cukup setiap malam (7-9 jam untuk orang dewasa)",),
                BulletPoint(content: "Ambil istirahat atau tidur singkat (power nap) saat merasa mengantuk",),
                BulletPoint(content: "Jangan mengemudi atau bekerja dengan alat berat ketika sedang lelah",),
                BulletPoint(content: "Bergeraklah atau lakukan peregangan secara berkala",),
                BulletPoint(content: "Pastikan lingkungan terang dan sejuk",),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class BulletPoint extends StatelessWidget {
  final String content;

  const BulletPoint({ super.key, required this.content });

  @override
  Widget build(BuildContext context) {

    return Text("\u2022 $content");
  }
}