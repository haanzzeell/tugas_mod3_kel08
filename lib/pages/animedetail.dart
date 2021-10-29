import 'package:tugas_mod3_kel08/models/detail_model.dart';
import 'package:tugas_mod3_kel08/services/api_manager.dart';
import 'package:tugas_mod3_kel08/widgets/app_bar.dart';
import 'package:tugas_mod3_kel08/widgets/badge.dart';
import 'package:tugas_mod3_kel08/widgets/star_rating.dart';
import 'package:flutter/material.dart';

class DetailView extends StatefulWidget {
  final int item;
  final String title;
  const DetailView({Key? key, required this.item, required this.title})
      : super(key: key);

  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  int rating = 0;

  late Future<DetailModel> _detailModel;

  @override
  void initState() {
    _detailModel = API_Manager().getDetail(widget.item);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isBack: true,
      ),
      body: SafeArea(
          child: FutureBuilder<DetailModel>(
        future: _detailModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var score = snapshot.data!.score ?? 'unknown';
            var scoredby = snapshot.data!.scoredBy ?? 'unknown';
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              children: <Widget>[
                Text(
                  snapshot.data!.title,
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 5),
                  child: Row(
                    children: <Widget>[
                      Badge(
                        color: Colors.amber,
                        text: snapshot.data!.aired!.string ?? 'unknown',
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Badge(
                        color: Colors.green,
                        text: snapshot.data!.status ?? 'unknown',
                      ),
                    ],
                  ),
                ),
                Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  overflow: Overflow.clip,
                  children: <Widget>[
                    Container(
                      height: 350,
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 3,
                            offset: Offset(0, 5),
                          ),
                        ],
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            snapshot.data!.imageUrl ?? 'unknown',
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: RawMaterialButton(
                        onPressed: () {
                          print('add clicked');
                        },
                        child: Row(
                          children: const <Widget>[
                            Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            Text(
                              'Add To My List',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        elevation: 0,
                        fillColor: const Color.fromRGBO(0, 0, 0, 0.6),
                        padding: const EdgeInsets.all(8),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        snapshot.data!.genres![0].name ?? 'unknown',
                        style: TextStyle(
                          color: Colors.black45,
                        ),
                      ),
                      Text(
                        snapshot.data!.duration ?? 'unknown',
                        style: TextStyle(
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    StarRating(
                      onChanged: (value) {
                        setState(() {
                          rating = value;
                        });
                      },
                      rating: double.parse(score.toString()).toInt() ~/ 2,
                    ),
                    Text(
                      score.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      scoredby.toString(),
                      style: TextStyle(
                        color: Colors.black45,
                        // fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: Text(
                    snapshot.data!.synopsis ?? 'unknown',
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                RawMaterialButton(
                  onPressed: () {
                    print('start watching now clicked');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Start watching now'.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  elevation: 0,
                  fillColor: Colors.red,
                  padding: const EdgeInsets.all(15),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong :('));
          }
          return const CircularProgressIndicator();
        },
      )),
    );
  }
}
