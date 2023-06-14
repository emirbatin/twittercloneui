import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../model/tweets.dart';
import 'tweetpost_view.dart';
import 'search_view.dart';
import '../view/home_view.dart';
import 'viewmodel/like_view.dart';

Tweets tweets = Tweets();

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _currentIndex = 0;
  bool isHeaderClose = false;
  double lastOffSet = 0;
  ScrollController scrollController;

  void didChangeDependencies() {
    super.didChangeDependencies();
    isHeaderClose = false; // Reset the isHeaderClose variable to false
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
    scrollController = ScrollController();
    scrollController.addListener(() {
      print(scrollController.offset);

      if (scrollController.offset <= 0) {
        isHeaderClose = false;
      } else if (scrollController.offset >=
          scrollController.position.maxScrollExtent) {
        isHeaderClose = true;
      } else {
        isHeaderClose = scrollController.offset > lastOffSet ? true : false;
      }

      setState(() {
        lastOffSet = scrollController.offset;
      });
    });
  }

  void _handleTabSelection() {
    setState(() {
      _currentIndex = _tabController.index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _containerAppbar,
          _tabBar,
          _Expanded,
          _bottomNavigationBar,
        ],
      ),
      floatingActionButton: _fabTweet,
    );
  }

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

  Widget get _tabBarView => TabBarView(
        controller: _tabController,
        children: [
          _listViewAll,
          _listViewVerified,
          _listViewMentions,
        ],
      );

  Widget get _tabBar => TabBar(
        controller: _tabController,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: Colors.blue,
        tabs: [
          Tab(
            child: Text(
              'All',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Tab(
            child: Text(
              'Verified',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Tab(
            child: Text(
              'Mentions',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      );

  @override
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

  Widget get _containerAppbar => AnimatedContainer(
        duration: Duration(milliseconds: 100),
        height: isHeaderClose ? 0 : 50,
        child: _appBar,
      );

  Widget get _appBar => AppBar(
        elevation: 0.0,
        titleSpacing: 0.0,
        title: Container(
          height: 60.0,
          child: Column(
            children: <Widget>[_appBarItems],
          ),
        ),
      );

  Widget get _Expanded => Expanded(
        child: _tabBarView,
      );

  Widget get _listViewAll => ListView.separated(
        controller: scrollController,
        itemBuilder: (context, index) {
          return LikeView(context, index);
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 5.0,
          );
        },
        itemCount: tweets.tweets.length,
      );

  Widget get _listViewVerified => ListView.separated(
        controller: scrollController,
        itemBuilder: (context, index) {
          return LikeView(context, index);
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 5.0,
          );
        },
        itemCount: tweets.tweets.length,
      );

  Widget get _listViewMentions => ListView.separated(
        controller: scrollController,
        itemBuilder: (context, index) {
          return LikeView(context, index);
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 5.0,
          );
        },
        itemCount: tweets.tweets.length,
      );

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
              padding: const EdgeInsets.only(left: 0.0, right: 40.0),
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/twitter_logo.svg',
                  // ignore: deprecated_member_use
                  color: Colors.blue,
                ),
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
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchScreen()),
        );
        break;
      // Add cases for other screens if needed
    }
  }
}
