import 'package:flutter/material.dart';
// import 'package:movies_app/models/models.dart';
import 'package:movies_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //  Cambiar luego por una instancia de movie
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ??
        'no Disponible';

    return Scaffold(
      body: CustomScrollView(
        //widgets con cierto contenido preprogramdo
        slivers: [
          _CustomAppBar(),
          //este es una lista de widgets ya que si no lo tiene marca un error
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(),
              _Overview(),
              _Overview(),
              CatingCard(),
            ]),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
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
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            'movie.title',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://picsum.photos/500/300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsGeometry.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://picsum.photos/200/300'),
              height: 150,
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Movie.title',
                style: Theme.of(context).textTheme.titleLarge,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                'Original-title',
                style: Theme.of(context).textTheme.titleMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Row(
                children: [
                  Icon(Icons.star, size: 15, color: Colors.grey),
                  SizedBox(width: 5),
                  Text(
                    'movie.voteAverage',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        'Aliqua aute commodo incididunt elit. Tempor nostrud tempor adipisicing consectetur voluptate minim id irure. Culpa elit non est esse ullamco est culpa laborum ipsum excepteur sit id pariatur. Ex dolor duis aute proident non consectetur. Eiusmod est est voluptate qui laborum consectetur. Cillum cillum esse do occaecat duis fugiat culpa amet velit enim voluptate magna. Nostrud deserunt officia sit deserunt labore nulla id veniam esse sint dolore ullamco aliqua consectetur.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
