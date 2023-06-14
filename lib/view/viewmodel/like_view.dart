import 'package:flutter/material.dart';
import '../../model/tweets.dart';
import '../../widgets/customSvgPicture.dart';
import 'package:flutter_svg/flutter_svg.dart';

Tweets tweets = Tweets();

class LikeView extends StatefulWidget {
  BuildContext _context;
  int _index;

  LikeView(this._context, this._index);

  BuildContext get context => _context;

  @override
  __LikeViewState createState() => __LikeViewState();

  int get index => _index;
}

class __LikeViewState extends State<LikeView> {
  BuildContext get _context => widget._context;
  int get _index => widget._index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: _tweetView,
    );
  }

  @override
  Widget get _tweetView => Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _tweetLike,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _tweetuserThumb,
                    _tweetUsername,
                    _tweetText,
                    _tweetIcons,
                  ],
                ),
              ),
            )
          ],
        ),
      );

  Widget get _tweetLike => Container(
        width: 30,
        height: 30,
        child: ClipRRect(
          child: SvgPicture.asset(
            'assets/icons/like_filled.svg',
            // ignore: deprecated_member_use
            color:
                Colors.red, // SVG dosyasının yolunu doğru şekilde güncelleyin
          ),
        ),
      );

  Widget get _tweetuserThumb => Container(
        width: 40,
        height: 40,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.network(
            tweets.tweets[_index].userThumb,
            height: 40,
          ),
        ),
      );

  Widget get _tweetUsername => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            tweets.tweets[_index].userName,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              tweets.tweets[_index].userMName,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          )
        ],
      );

  Widget get _tweetText => Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Text(
          tweets.tweets[_index].tweetText,
          style: TextStyle(fontSize: 16.0),
        ),
      );

  Widget get _tweetImage => tweets.tweets[_index].tweetImage != ''
      ? Material(
          borderRadius: BorderRadius.circular(20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.network(
              tweets.tweets[_index].tweetImage,
              height: 300.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        )
      : SizedBox(height: 0.0);

  Widget get _tweetIcons => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
        child: Row(
          children: <Widget>[
            _commentIcon,
            _likeIcon,
            _likeIcon,
            _shareIcon,
          ],
        ),
      );
  @override
  Widget get _commentIcon => Expanded(
        child: Row(
          children: <Widget>[
            NewSvgPicture(imagePath: 'assets/icons/comment.svg'),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(tweets.tweets[_index].commentCount.toString()),
            )
          ],
        ),
      );
  Widget get _retweetIcon => Expanded(
        child: Row(
          children: <Widget>[
            NewSvgPicture(imagePath: 'assets/icons/retweet.svg'),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(tweets.tweets[_index].retweetCount.toString()),
            ),
          ],
        ),
      );
  Widget get _likeIcon => Expanded(
        child: Row(
          children: <Widget>[
            NewSvgPicture(imagePath: 'assets/icons/like_outlined.svg'),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(tweets.tweets[_index].loveCount.toString()),
            ),
          ],
        ),
      );
  Widget get _shareIcon => Expanded(
        child: Icon(
          Icons.share,
          color: Colors.grey,
          size: 20.0,
        ),
      );
}
