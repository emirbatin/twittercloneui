import 'package:flutter/material.dart';

class TrendCard extends StatelessWidget {
  final String trendType;
  final String trendName;
  final int tweetCount;

  TrendCard({
    @required this.trendType,
    @required this.trendName,
    @required this.tweetCount,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Trende tıklandığında yapılacak işlemler
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTrendType(),
            SizedBox(height: 2),
            _buildTrendName(),
            SizedBox(height: 5),
            _buildTweetCount(),
          ],
        ),
      ),
    );
  }

  Widget _buildTrendType() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          trendType,
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        SizedBox(height: 2),
      ],
    );
  }

  Widget _buildTrendName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          trendName,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
      ],
    );
  }

  Widget _buildTweetCount() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          '$tweetCount K Tweets',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        SizedBox(height: 3),
      ],
    );
  }
}
