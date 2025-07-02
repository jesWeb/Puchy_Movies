//este se tratara de ser reutilizable
import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';

class MovieSlider extends StatefulWidget {
  final List<Pelicula> movies;
  final String? title;
  const MovieSlider({super.key, required this.movies, this.title, required this.onNextPage});
  final Function onNextPage;

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  
  final ScrollController scrollController =  ScrollController();

  
  @override
  void initState() {
    super.initState();
    scrollController.addListener((){
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 500) {
        print('Obtener sigguiente pagina');
         widget.onNextPage();
        
      }
    });
  }

  @override
  void dispose() {
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (this.widget.title != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                this.widget.title!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  // color: Colors.white,
                ),
              ),
            ),

          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: (_, int index) => _MoviePoster(widget.movies[index]),
            ),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Pelicula movie;

  const _MoviePoster(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 170,
      // color: Colors.amber,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              'detalles',
              arguments: 'movies-instace',
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                width: 130,
                height: 170,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // SizedBox(height: 5),
          Text(
            movie.title,
            maxLines: 3,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
