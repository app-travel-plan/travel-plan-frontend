import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CardCustomPopular extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;

  CardCustomPopular({
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  _CardCustomPopularState createState() => _CardCustomPopularState();
}

class _CardCustomPopularState extends State<CardCustomPopular> {
  late String imageUrl;

  @override
  void initState() {
    super.initState();
    imageUrl = widget.imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 4,
          child: SizedBox(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      height: 126,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: imageUrl.isNotEmpty
                            ? DecorationImage(
                                image: NetworkImage(imageUrl),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(Icons.star, color: Colors.yellow),
                          Text(
                            '4.5',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 5),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 6),
          alignment: Alignment.centerLeft,
          child: Text(
            widget.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 6),
          alignment: Alignment.centerLeft,
          child: Text(
            widget.description,
            style: TextStyle(
              color: Colors.red,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
