import 'dart:convert';
import 'package:flutter/material.dart';
import 'models/image_model.dart';
import 'package:http/http.dart' show get;
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    var url = Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter');
    var response = await get(url);
    var imageModel = ImageModel.fromJson(json.decode(response.body));

    setState(() {
      images.add(imageModel);
    });
  }

  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          // onPressed: () => fetchImage(), onPressed: () { fetchImage(); },
          onPressed: fetchImage,
          child: Icon(Icons.add),
        ),
        appBar: AppBar(title: const Text('Let\'s see some images!')),
      ),
    );
  }
}
