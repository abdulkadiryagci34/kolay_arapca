import 'package:audiofileplayer/audiofileplayer.dart';
import 'package:flutter/material.dart';
import 'package:kolay_arapca/data/strings.dart';
import 'package:kolay_arapca/model/kelime.dart';

class KelimeDetay extends StatefulWidget {
  final Kelime secilenKelime;
  const KelimeDetay({required this.secilenKelime, Key? key}) : super(key: key);

  @override
  State<KelimeDetay> createState() => _KelimeDetayState();
}

class _KelimeDetayState extends State<KelimeDetay> {
  @override
  Widget build(BuildContext context) {
    var myTextStyle = Theme.of(context).textTheme;
    Audio audio = Audio.load("${widget.secilenKelime.kelimeSesi}");

    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.secilenKelime.kelimeAnlami,
          ),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              widget.secilenKelime.kelimeAnlami,
              maxLines: 1,
              style: myTextStyle.headline3,
              textAlign: TextAlign.center,
            ),
            Image.asset(
              "${widget.secilenKelime.kelimeResmi}",
              width: 250,
              height: 250,
            ),
            ListTile(
                title: Text(
              widget.secilenKelime.kelimeAdi,
              maxLines: 1,
              style: myTextStyle.headline3,
              textAlign: TextAlign.center,
            )),
            ElevatedButton.icon(
              onPressed: () {
                audio.play();
                setState(() {});
              },
              icon: Icon(
                Icons.play_arrow,
                color: Colors.red,
                size: 64,
              ),
              label: Text("Dinle"),
            ),
          ]),
        ));
  }
}
