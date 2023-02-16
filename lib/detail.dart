import 'package:app1/pic_model.dart';
import 'package:flutter/material.dart';

class DetailPic extends StatefulWidget {
  Pic pic;
  DetailPic({Key? key, required this.pic}) : super(key: key);

  @override
  State<DetailPic> createState() => _DetailPicState();
}

class _DetailPicState extends State<DetailPic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        title: Text(widget.pic.name.toString()),
      ),
      body: SizedBox(
        height: 200,
        width: 300,
        child: Image(image: NetworkImage(widget.pic.image.toString())),
      ),
    );
  }
}
