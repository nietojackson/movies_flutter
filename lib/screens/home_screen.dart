import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_outlined),
            ),
          ],
          title: const Text('Home'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              //tajetas principales
              CardSwiper(),

              //slider de peliculas
              MovieSwiper(),
              MovieSwiper(),
              MovieSwiper(),
            ],
          ),
        ));
  }
}
