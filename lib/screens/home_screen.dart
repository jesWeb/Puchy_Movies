import 'package:flutter/material.dart';
import 'package:movies_app/providers/movies_provider.dart';
import 'package:movies_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerPelicuas = Provider.of<MoviesProvider>(context, listen: true);
    // print(MoviesProvider.onDisplayMovies);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Peliculas en Cartelera',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //tarjetas main
            CardSwiper(movies: providerPelicuas.onDisplayMovies),
            //slider
            MovieSlider(
              movies: providerPelicuas.popularMovies,
              title: 'Populares',
            ),
          ],
        ),
      ),
    );
  }
}
