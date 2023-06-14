class Tweets {
  List<Tweet> _tweets = [
    Tweet(
      'https://pbs.twimg.com/profile_images/1551222643080282113/9m9e8uQ9_400x400.jpg',
      'EBK',
      '@emirbatink',
      'Hmm bence baya güvenli',
      'https://pbs.twimg.com/media/Fwk8XOSacAIvygS?format=jpg&name=large',
      120,
      20,
      800,
    ),
    Tweet(
      'https://pbs.twimg.com/profile_images/1668888083352231936/NbDLuhW0_400x400.jpg',
      'バティン',
      '@batinjp',
      '日本語を練習するためにこのアカウントを作りました🙂',
      'https://pbs.twimg.com/media/FykVGG7XwAAmd5q?format=jpg&name=large',
      120,
      20,
      800,
    ),
    Tweet(
      'https://pbs.twimg.com/profile_images/1593669202702999554/aQ7YTs2C_400x400.jpg',
      'Andrew Tate',
      '@Cobratate',
      'GM',
      'https://pbs.twimg.com/media/FwkcULoWIAM9dZB?format=jpg&name=large',
      100,
      20,
      50,
    ),
    Tweet(
      'https://pbs.twimg.com/profile_images/1609809081950158848/5VV7u7va_400x400.jpg',
      'Binance',
      '@binance',
      "Wait, you don't use 2FA?",
      'https://pbs.twimg.com/media/FwkDQylWwAAvFRV?format=jpg&name=medium',
      9,
      20,
      50,
    ),
  ];

  Tweets();

  List<Tweet> get tweets => _tweets;
}

class Tweet {
  String _userThumb, _userName, _userMName, _tweetText, _tweetImage;
  int _retweetCount, _commentCount, _loveCount;

  /*_Tweet(this._userThumb, this._userName, this._userMName, this._tweetText,
      this._tweetImage, this._retweetCount, this._commentCount,
      this._loveCount);*/

  Tweet(
      this._userThumb,
      this._userName,
      this._userMName,
      this._tweetText,
      this._tweetImage,
      this._retweetCount,
      this._commentCount,
      this._loveCount);

  get loveCount => _loveCount;

  get commentCount => _commentCount;

  get retweetCount => _retweetCount;

  get tweetImage => _tweetImage;

  get tweetText => _tweetText;

  get userMName => _userMName;

  get userName => _userName;

  String get userThumb => _userThumb;
}
