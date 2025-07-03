import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> movies;
  const CardSwiper({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    //el context es del arbol de widgetes y lo tomara antes la mediada
    final size = MediaQuery.of(context).size;

    if (movies.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.45,
      // color: Colors.deepOrangeAccent,
      // slider swiper
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: (_, int index) {
          final movie = movies[index];
          // print(movie.fullPoster);
          //imagen
          return GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'detalles', arguments: movie),
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.elliptical(15.5, 35)),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                fit: BoxFit.contain,
              ),
            ),
          );
        },
      ),
    );
  }
}
