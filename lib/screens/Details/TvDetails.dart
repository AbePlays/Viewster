import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TvDetails extends StatefulWidget {
  final int id = 1668;
  final String title = "Friends";
  final String imageUrl = "/l0qVZIpXtIo7km9u5Yqh0nKPOr5.jpg";
  final String releaseDate = "1994-09-22";
  final double votes = 8.2;
  final List<String> genres = ["Comedy", "Drama"];
  final String overview =
      "The misadventures of a group of friends as they navigate the pitfalls of work, life and love in Manhattan.";
  final int episodeLength = 25;
  final List creator = [
    {
      "id": 163461,
      "credit_id": "525710bf19c295731c03280b",
      "name": "Marta Kauffman",
      "gender": 1,
      "profile_path": null
    },
    {
      "id": 1216352,
      "credit_id": "525710bf19c295731c032811",
      "name": "David Crane",
      "gender": 2,
      "profile_path": "/wXb8gWv24sX24LFuE6rSpJCjWwE.jpg"
    }
  ];
  final List cast = [
    {
      "character": "Chandler Bing",
      "credit_id": "525710be19c295731c03256f",
      "id": 14408,
      "name": "Matthew Perry",
      "gender": 2,
      "profile_path": "/ecDzkLWPV1z0x31I1GTjNmLxAHk.jpg",
      "order": 0
    },
    {
      "character": "Joey Tribbiani",
      "credit_id": "525710bd19c295731c0323a3",
      "id": 14407,
      "name": "Matt LeBlanc",
      "gender": 2,
      "profile_path": "/wvGne2ilC3dI1aTT8uGgJ8Zo4EG.jpg",
      "order": 1
    },
    {
      "character": "Monica Geller",
      "credit_id": "525710bc19c295731c032341",
      "id": 14405,
      "name": "Courteney Cox",
      "gender": 1,
      "profile_path": "/a2NJbLwimILFYOVArpUuwS1pBAY.jpg",
      "order": 2
    },
    {
      "character": "Ross Geller",
      "credit_id": "525710bd19c295731c0324a9",
      "id": 14409,
      "name": "David Schwimmer",
      "gender": 2,
      "profile_path": "/oBsK1ql5bo3zxepbQCclIwnapXM.jpg",
      "order": 3
    },
    {
      "character": "Rachel Green",
      "credit_id": "525710bd19c295731c03242d",
      "id": 4491,
      "name": "Jennifer Aniston",
      "gender": 1,
      "profile_path": "/qPXG41rYdUGldZhMhuZFvmpZKRp.jpg",
      "order": 4
    },
    {
      "character": "Phoebe Buffay",
      "credit_id": "525710bd19c295731c032525",
      "id": 14406,
      "name": "Lisa Kudrow",
      "gender": 1,
      "profile_path": "/dWoXQonmmtV1byxmKXCd8E4rlPC.jpg",
      "order": 5
    }
  ];

  @override
  _TvDetailsState createState() => _TvDetailsState();
}

class _TvDetailsState extends State<TvDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TV Show"),
        centerTitle: true,
        leading: Icon(Icons.arrow_back),
        backgroundColor: Colors.black12,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FadeInImage.assetNetwork(
                placeholder: "assets/images/movie.jpg",
                image: "https://image.tmdb.org/t/p/w500${widget.imageUrl}"),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        widget.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "(${DateFormat('yyyy').format(DateTime.parse(widget.releaseDate))})",
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 30),
                      ),
                    ],
                  ),
                  Container(
                    height: 25,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.genres.length,
                      itemBuilder: (context, index) {
                        return Text(
                          widget.genres[index],
                          style: TextStyle(fontSize: 20),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Text(
                          "/",
                          style: TextStyle(fontSize: 20),
                        );
                      },
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 25,
                      ),
                      Text(
                        widget.votes.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Overview",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.overview,
                    style: TextStyle(color: Colors.black54, fontSize: 17),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Creator(s)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    height: 290,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.creator.length,
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 10,
                        );
                      },
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 2,
                          child: Column(
                            children: <Widget>[
                              FadeInImage.assetNetwork(
                                width: 150,
                                height: 180,
                                placeholder: "assets/images/notfound.png",
                                image:
                                    "https://image.tmdb.org/t/p/w154${widget.creator[index]["profile_path"]}",
                                fit: BoxFit.fitWidth,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${widget.creator[index]['name']}",
                                softWrap: true,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Text(
                    "Cast(s)",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    height: 330,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.cast.length,
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 10,
                        );
                      },
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 2,
                          child: Column(
                            children: <Widget>[
                              FadeInImage.assetNetwork(
                                width: 150,
                                height: 180,
                                placeholder: "assets/images/notfound.png",
                                image:
                                    "https://image.tmdb.org/t/p/w154${widget.cast[index]["profile_path"]}",
                                fit: BoxFit.fitWidth,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    "${widget.cast[index]['name']}",
                                    softWrap: true,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "${widget.cast[index]['character']}",
                                    softWrap: true,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
