import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';
import 'package:movies_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //  Cambiar luego por una instancia de movie
    final Pelicula movie =
        ModalRoute.of(context)!.settings.arguments as Pelicula;
    // print(movie.title);

    return Scaffold(
      body: CustomScrollView(
        //widgets con cierto contenido preprogramdo
        slivers: [
          _CustomAppBar(movie),
          //este es una lista de widgets ya que si no lo tiene marca un error
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(movie),
              _Overview(movie),
              _Overview(movie),
              CatingCard(movieId: movie.id),
            ]),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Pelicula movie;

  const _CustomAppBar(this.movie);

  @override
  Widget build(BuildContext context) {
    //controla el ancho del appbar y el comportamiento es diferente
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black45,
          padding: EdgeInsets.only(bottom: 10, left: 20, right: 20),
          // color: Colors.black12,
          child: Text(
            movie.title,
            style: TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(movie.fullPosterImg),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Pelicula movie;
  const _PosterAndTitle(this.movie);

  @override
  Widget build(BuildContext context) {
    // final TextTheme textTheme = Theme.of(context).textTheme;

    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsetsGeometry.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(movie.fullPosterImg),
              height: 150,
              width: 100,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: 15),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width - 160),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: Theme.of(context).textTheme.titleLarge,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                // SizedBox(width: 5),
                Text(
                  movie.originalTitle,
                  style: Theme.of(context).textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Row(
                  children: [
                    Icon(Icons.star, size: 15, color: Colors.grey),
                    SizedBox(width: 5),
                    Text(
                      '${movie.voteAverage}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final Pelicula movie;
  const _Overview(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
