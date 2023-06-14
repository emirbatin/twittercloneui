import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'tweetpost_view.dart';
import 'notification_view.dart';
import 'home_view.dart';
import '../model/trends.dart';
import '../widgets/customTrendCard.dart';

class SearchScreen extends StatefulWidget {
  Trends trends = Trends();
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  double lastOffSet = 0;
  ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(() {
      print(scrollController.offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: widget.trends.trends.length,
              itemBuilder: (context, index) {
                Trend trend = widget.trends.trends[index];
                return TrendCard(
                  trendType: trend.trendType,
                  trendName: trend.trendName,
                  tweetCount: trend.tweetCount,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: _fabTweet,
      bottomNavigationBar: _bottomNavigationBar,
    );
  }

//Widget get yapıları

  Widget get _fabTweet => FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TweetPost(),
            ),
          );
        },
        child: SvgPicture.asset(
          'assets/icons/tweetpost.svg',
          // ignore: deprecated_member_use
          color: Colors.white,
        ),
      );

  Widget get _bottomNavigationBar => BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabSelected,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/home_outlined.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/search.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/notif_outlined.svg'),
            label: '',
          ),
        ],
      );

  // Diğer widget'lar burada

  Widget get _containerAppbar => Container(
        child: _appBar,
      );

  Widget get _appBar => AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        titleSpacing: 0.0,
        title: Container(
          height: 60.0,
          child: Column(
            children: <Widget>[_appBarItems],
          ),
        ),
      );

  @override
  Widget get _appBarItems => Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: profileImageStyle,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.grey[500],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                            isDense: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Center(
              child: Icon(
                Icons.settings,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      );

  final profileImageStyle = Image.network(
    'https://pbs.twimg.com/profile_images/1551222643080282113/9m9e8uQ9_400x400.jpg',
    height: 40,
    width: 40,
  );

  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NotificationScreen()),
        );
        break;
      // Add cases for other screens if needed
    }
  }
}
