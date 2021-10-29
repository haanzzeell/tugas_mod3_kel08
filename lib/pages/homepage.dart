import 'package:flutter/material.dart';
import 'package:tugas_mod3_kel08/models/top_anime.dart';
import 'package:tugas_mod3_kel08/services/api_manager.dart';
import 'package:tugas_mod3_kel08/widgets/app_bar.dart';
import 'package:tugas_mod3_kel08/widgets/carousel.dart';
import 'detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<AnimeModel> _animeModel;

  final PageController _controller = PageController(
    initialPage: 0,
    keepPage: true,
    viewportFraction: 0.6,
  );
  int currentPage = 0;

  @override
  void initState() {
    _animeModel = API_Manager().getAnime();
    super.initState();

    _controller.addListener(() {
      int next = _controller.page!.round();
      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'MyAnimeList'),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Carousel(pageController: _controller, currentPage: currentPage),
            const Text(
              'Top Anime',
              style: TextStyle(fontSize: 18),
            ),
            Expanded(
              child: FutureBuilder<AnimeModel>(
                future: _animeModel,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Center(
                      child: ListView.builder(
                        itemCount: snapshot.data!.top.length,
                        itemBuilder: (BuildContext context, int index) {
                          var top = snapshot.data!.top[index];
                          return Card(
                            color: Colors.white,
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(top.imageUrl),
                              ),
                              title: Text(top.title),
                              subtitle: Text('Score: ${top.score}'),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                        item: top.malId, title: top.title),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Something went wrong :('));
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
