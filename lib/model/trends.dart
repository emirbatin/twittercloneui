import 'package:flutter/material.dart';

class Trends {
  List<Trend> _trends = [
    Trend('Politics', 'M.A.M', 1),
    Trend('Trend in Politics', 'Niger', 12),
    Trend('Entertainment', '#dek66', 608),
    Trend('Trends in Turkey', 'Whatsapp', 9),
  ];

  List<Trend> get trends => _trends;
}

class Trend {
  String _trendType, _trendName;
  int _tweetCount;

  Trend(this._trendType, this._trendName, this._tweetCount);

  int get tweetCount => _tweetCount;

  String get trendName => _trendName;

  String get trendType => _trendType;
}
