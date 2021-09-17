import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gigi_socials/src/widgets.dart';

class Subscription extends StatefulWidget {
  const Subscription({Key? key}) : super(key: key);

  @override
  _SubscriptionState createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {

  @override
  Widget build(BuildContext context) {

    final Size screen = MediaQuery.of(context).size;
    final double width = screen.width;

    final List<Tab> _kTabs = <Tab>[
      const Tab(text: 'GAME LIST'),
      const Tab(text: 'HISTORY'),
      const Tab(text: 'OFFLINE'),
    ];

    final List<Widget> _kTabPages = <Widget>[
      SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 50,
                  width: width,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, left: 5),
                    child: Filter(),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  color: Colors.black,
                  child: Column(
                    children: <Widget>[
                      const Divider(thickness: .5, color: Colors.white12),
                      Row(
                        children: const <Widget>[
                          GamesList(
                            textTitle: 'Clash of Clans',
                            textDescription: 'Last played 10 hours ago',
                            image: 'assets/pictures/clash_of_clans.png',
                          ),
                        ],
                      ),
                      DividerIndented(),
                      Row(
                        children: const <Widget>[
                          GamesList(
                            textTitle: 'Final Fantasy',
                            textDescription: 'Last played 12 hours ago',
                            image: 'assets/pictures/final_fantasy.png',
                          ),
                        ],
                      ),
                      DividerIndented(),
                      Row(
                        children: const <Widget>[
                          GamesList(
                            textTitle: 'OverWatch',
                            textDescription: 'Last played 13 hours ago',
                            image: 'assets/pictures/overwatch.png',
                          ),
                        ],
                      ),
                      DividerIndented(),
                      Row(
                        children: const <Widget>[
                          GamesList(
                            textTitle: 'Fallout Shelter',
                            textDescription: 'Last played 16 hours ago',
                            image: 'assets/pictures/fallout_shelter.png',
                          ),
                        ],
                      ),
                      DividerIndented(),
                      Row(
                        children: const <Widget>[
                          GamesList(
                            textTitle: 'Far Cry',
                            textDescription: 'Last played 20 hours ago',
                            image: 'assets/pictures/far_cry_2.png',
                          ),
                        ],
                      ),
                      DividerIndented(),
                      Row(
                        children: const <Widget>[
                          GamesList(
                            textTitle: 'Apex Legends',
                            textDescription: 'Last played 16 hours ago',
                            image: 'assets/pictures/dungeon.png',
                          ),
                        ],
                      ),
                      DividerIndented(),
                      Row(
                        children: const <Widget>[
                          GamesList(
                            textTitle: 'Player Unknown BG',
                            textDescription: 'Last played 16 hours ago',
                            image: 'assets/pictures/pubg_PNG45.png',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: const <Widget>[
              ListHeading(
                timeStamp: 'Recently',
              ),
              HistoryList(
                content1: HistorySubList(
                  image: 'assets/pictures/nexus_009.jpg',
                  textTitle: 'PUBG Mobile',
                  textStar: '4.6',
                  textPrice: '\$29.99',
                ),
                content2: HistorySubList(
                  image: 'assets/pictures/nexus_011.jpg',
                  textTitle: 'Doom Eternal',
                  textStar: '4.5',
                  textPrice: '\$19.99',
                ),
                content3: HistorySubList(
                  image: 'assets/pictures/nexus_014.jpg',
                  textTitle: 'Venom 2',
                  textStar: '4.0',
                  textPrice: '\$9.99',
                ),
              ),
              ListHeading(
                timeStamp: 'Last Month',
              ),
              HistoryList(
                content1: HistorySubList(
                  image: 'assets/pictures/nexus_010.jpg',
                  textTitle: 'Bleach: Brave Souls',
                  textStar: '4.5',
                  textPrice: '\$9.99',
                ),
                content2: HistorySubList(
                  image: 'assets/pictures/nexus_006.jpg',
                  textTitle: 'Naruto: Ninja Wars',
                  textStar: '4.2',
                  textPrice: '\$24.99',
                ),
                content3: HistorySubList(
                  image: 'assets/pictures/nexus_007.jpg',
                  textTitle: "Bleach: World's end",
                  textStar: '4.0',
                  textPrice: '\$19.99',
                ),
              ),
              HistoryList(
                content1: HistorySubList(
                  image: 'assets/pictures/nexus_012.jpg',
                  textTitle: 'OverWatch',
                  textStar: '4.6',
                  textPrice: '\$14.99',
                ),
                content2: HistorySubList(
                  image: 'assets/pictures/nexus_002.jpg',
                  textTitle: 'Boku No Hero',
                  textStar: '4.5',
                  textPrice: '\$4.99',
                ),
                content3: HistorySubList(
                  image: 'assets/pictures/nexus_013.jpg',
                  textTitle: 'Sonic',
                  textStar: '4.0',
                  textPrice: '\$9.99',
                ),
              ),
            ],
          ),
        ),
      ),
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 120, bottom: 15),
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: Image(image: AssetImage('assets/pictures/nexus_23.jpg')),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  SizedBox(
                    height: 60,
                    width: 250,
                    child: Text('Sync your favorite games and play offline on the go.',
                        style: TextStyle(fontSize: 18, color: Colors.white), textAlign: TextAlign.center),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  SizedBox(
                    height: 40,
                    width: 250,
                    child: Text('Upgrade to Mega Fan to use this feature.',
                        style: TextStyle(fontSize: 15, color: Colors.white), textAlign: TextAlign.center),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 45,
                      width: 320,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(width: 75, height: 20),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(2),
                            backgroundColor: MaterialStateProperty.all(Colors.deepPurple.shade300),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text('Go Premium', style: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ];

    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          shape: const Border(
            bottom: BorderSide(
              color: Colors.grey,
            ),
          ),
          backgroundColor: Colors.black,
          title: const Padding(
            padding: EdgeInsets.all(10),
            child: Text('Subscriptions'),
          ),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Search'),
                  ),
                );
              },
              child: const Icon(Icons.search),
            ),
          ],
          bottom: TabBar(
            indicatorColor: Colors.deepPurple.shade400,
            tabs: _kTabs,
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: TabBarView(
            children: _kTabPages,
          ),
        ),
      ),
    );
  }
}