import 'package:flutter/material.dart';
import 'package:peliculas/models/movie.dart';

class MovieSwiper extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final Function onNextPage;
  const MovieSwiper(
      {super.key, required this.movies, this.title, required this.onNextPage});

  @override
  State<MovieSwiper> createState() => _MovieSwiperState();
}

class _MovieSwiperState extends State<MovieSwiper> {
  final ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 500) {
        widget.onNextPage();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (this.widget.title != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.title!,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: (_, int index) => _MoviePoster(
                movie: widget.movies[index],
                heroid: '${widget.title}-${index}-${widget.movies[index].id}',
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie movie;
  final String heroid;

  const _MoviePoster({
    Key? key,
    required this.movie,
    required this.heroid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    movie.heroId = heroid;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 130,
      height: 190,
      child: Column(
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: movie),
            child: Hero(
              tag: movie.heroId!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(movie.fullPosterImg),
                  width: 130,
                  height: 190,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
