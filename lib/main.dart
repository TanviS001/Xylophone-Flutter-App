import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(
          'Xylophone',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white
          ),
        ),
      ),
      body: XylophonePage(),
    )
  )
  );
}
class XylophonePage extends StatefulWidget {
  const XylophonePage({super.key});

  @override
  State<XylophonePage> createState() => _XylophonePageState();
}

class _XylophonePageState extends State<XylophonePage> {

  void playSound(int count){
    setState((){
      final player = AudioPlayer();
      player.play(AssetSource('note$count.wav'));
    });
  }

  Widget generateKey(int key, Color color){
    return Expanded(
      child: GestureDetector(
          child: Container(
            width: 100.0,
            height: 50.0,
            color: color,
          ),
          onTap: (){
            playSound(key);
          }
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:[
          generateKey(1, Colors.red),
          generateKey(2, Colors.orange),
          generateKey(3, Colors.yellow),
          generateKey(4, Colors.green),
          generateKey(5, Colors.blue),
          generateKey(6, Colors.indigo),
          generateKey(7, Colors.purple),
        ]
      ),
    );
  }
}

