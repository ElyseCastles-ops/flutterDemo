import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const whitecolor = Colors.white;
const blackcolor = Colors.black;
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  final urlImages = [
    'assets/images/a.jpg',
    'assets/images/b.jpg',
    'assets/images/c.jpg',
    'assets/images/d.jpg',
  ];
  var transformedImages = [];

  Future<dynamic> getSizeOfImages() async {
    transformedImages = [];
    for (int i = 0; i < urlImages.length; i++) {
      final imageObject = {};
      await rootBundle.load(urlImages[i]).then((value) => {
            imageObject['path'] = urlImages[i],
            imageObject['size'] = value.lengthInBytes,
          });
      transformedImages.add(imageObject);
    }
  }
  @override
  void initState() {
    getSizeOfImages();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: false,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,           
          ), 
        ),
        iconTheme: const IconThemeData(color: blackcolor),
      ),
      // Body area
      body: const SafeArea(
        child: Column(
          children: <Widget>[
            Text(
              "ELYSE CASTLES",
              style: TextStyle(
                color: Colors.black
              ),
            ),
            Image(
              image: AssetImage("images/UnionStation.png"),
              fit: BoxFit.cover,
              )
          ],
      )),
    );
  }
}