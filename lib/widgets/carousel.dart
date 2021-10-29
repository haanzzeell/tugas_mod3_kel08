import 'package:tugas_mod3_kel08/models/top_airing.dart';
import 'package:tugas_mod3_kel08/pages/animedetail.dart';
import 'package:tugas_mod3_kel08/services/api_manager.dart';
import 'package:tugas_mod3_kel08/utils/nav.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  final PageController pageController;
  final int currentPage;

  const Carousel(
      {Key? key, required this.pageController, required this.currentPage})
      : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late Future<AiringModel> _airingModel;

  @override
  void initState() {
    _airingModel = API_Manager().getAiring();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: FutureBuilder<AiringModel>(
        future: _airingModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PageView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              controller: widget.pageController,
              reverse: false,
              itemCount: snapshot.data!.top.length,
              onPageChanged: (index) {
                print(index);
              },
              itemBuilder: (BuildContext context, int index) {
                bool pageActive = widget.currentPage == index ? true : false;
                var top = snapshot.data!.top[index];
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  margin: EdgeInsets.only(
                    top: pageActive ? 0 : 30,
                    bottom: pageActive ? 0 : 30,
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    overflow: Overflow.clip,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          push(context,
                              DetailView(item: top.malId, title: top.title));
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: pageActive ? 3 : 0,
                                offset: pageActive
                                    ? const Offset(0, 5)
                                    : const Offset(0, 0),
                              ),
                            ],
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(top.imageUrl),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        left: -8,
                        child: RawMaterialButton(
                          onPressed: () {
                            print('add clicked');
                          },
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          shape: const CircleBorder(),
                          elevation: 0,
                          fillColor: const Color.fromRGBO(0, 0, 0, 0.6),
                          padding: const EdgeInsets.all(8),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong :('));
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
