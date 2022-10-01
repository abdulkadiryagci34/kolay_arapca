import 'package:flutter/material.dart';
import 'package:kolay_arapca/data/strings.dart';
import 'package:kolay_arapca/kelime_item.dart';
import 'package:kolay_arapca/model/kelime.dart';

class Kelimeler extends StatelessWidget {
  late List<Kelime> tumKelime;
  Kelimeler() {
    tumKelime = veriKaynaginiHazirla();
    print(tumKelime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade100,
        appBar: AppBar(title: Text("Kelimeler")),
        body: Center(
            child: ListView.builder(
          itemBuilder: ((context, index) {
            return KelimeItem(listelenenKelime: tumKelime[index]);
          }),
          itemCount: tumKelime.length,
        )));
  }

  List<Kelime> veriKaynaginiHazirla() {
    List<Kelime> gecici = [];
    for (int i = 0; i < 19; i++) {
      var kelimeAdi = Strings.KELIME_ADLARI[i];
      var kelimeResmi = Strings.KELIME_RESIMLERI[i];
      var kelimeAnlami = Strings.KELIME_ANLAMLARI[i];
      var kelimeSesi = Strings.KELIME_SESLERI[i];
      Kelime eklenecekKelime =
          Kelime(kelimeAnlami, kelimeAdi, kelimeResmi, kelimeSesi);
      gecici.add(eklenecekKelime);
    }
    return gecici;
  }
}
