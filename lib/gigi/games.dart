import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gigi_socials/src/widgets.dart';

class Games extends StatefulWidget {
  const Games({Key? key}) : super(key: key);

  @override
  _GamesState createState() => _GamesState();
}

class _GamesState extends State<Games> {

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 3.2;

    final double itemWidth = size.width / 2;


    final List<Tab> _kTabs = <Tab>[
      const Tab(text: 'GENRES'),
      const Tab(text: 'ALL'),
    ];

    final List<Widget> _kTabPages = <Widget>[
      LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 420) {
            return WideLayout();
          }
          else {
            return GridView.count(
              crossAxisCount: 2,
              childAspectRatio: itemHeight / itemWidth,
              children: const <Widget>[
                ContainerGenres(
                  icon: Icons.flight,
                  text: 'Action',
                ),
                ContainerGenres(
                  icon: Icons.add_location_alt,
                  text: 'Adventure',
                ),
                ContainerGenres(
                  icon: Icons.email,
                  text: 'Board',
                ),
                ContainerGenres(
                  icon: Icons.privacy_tip,
                  text: 'Casino',
                ),
                ContainerGenres(
                    icon: Icons.laptop_chromebook_outlined,
                    text: 'Educational'
                ),
                ContainerGenres(
                  icon: Icons.music_note,
                  text: 'Music',
                ),
                ContainerGenres(
                  icon: Icons.directions_car_rounded,
                  text: 'Racing',
                ),
                ContainerGenres(
                  icon: Icons.sports_football_rounded,
                  text: 'Sports',
                ),
                ContainerGenres(
                  icon: Icons.anchor,
                  text: 'Role Playing',
                ),
                ContainerGenres(
                  icon: Icons.lightbulb,
                  text: 'Trivia',
                ),
                ContainerGenres(
                  icon: Icons.android_sharp,
                  text: 'Card',
                ),
                ContainerGenres(
                  icon: Icons.local_fire_department,
                  text: 'Strategy',
                ),
              ],
            );
          }
        },
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const ListHeadingGames(
                timeStamp: 'Recommended games',
              ),
              Container(
                height: 240,
                color: Colors.black,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const <Widget>[
                    ContainerList(
                      containerImage: 'assets/pictures/extinction.jpg',
                      subImage: 'assets/pictures/creed_2.png',
                      textTitle: 'Extinction',
                      textGenre: 'Action',
                      textSub: 'First Person shooter',
                      textStar: '4.5',
                    ),
                    ContainerList(
                      containerImage: 'assets/pictures/adventure_1.jpg',
                      subImage: 'assets/pictures/creed_2.png',
                      textTitle: 'The Avengers',
                      textGenre: 'Action',
                      textSub: 'First Person shooter',
                      textStar: '4.5',
                    ),
                    ContainerList(
                      containerImage: 'assets/pictures/racing_2.jpg',
                      subImage: 'assets/pictures/creed_2.png',
                      textTitle: 'Forza 6',
                      textGenre: 'Action',
                      textSub: 'First Person shooter',
                      textStar: '4.5',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 120,
                  width: 380,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/pictures/nexus_017.jpg'),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              const ListHeadingGames(
                timeStamp: 'Non-stop Action',
              ),
              Container(
                height: 240,
                color: Colors.black,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const <Widget>[
                    ContainerList(
                      containerImage: 'assets/pictures/action_5.jpg',
                      subImage: 'assets/pictures/creed_2.png',
                      textTitle: 'Call of Duty',
                      textGenre: 'Action',
                      textSub: 'First Person shooter',
                      textStar: '4.5',
                    ),
                    ContainerList(
                      containerImage: 'assets/pictures/action_4.jpg',
                      subImage: 'assets/pictures/creed_2.png',
                      textTitle: 'Mission Impossible',
                      textGenre: 'Action',
                      textSub: 'First Person shooter',
                      textStar: '4.5',
                    ),
                    ContainerList(
                      containerImage: 'assets/pictures/war_frame.png',
                      subImage: 'assets/pictures/creed_2.png',
                      textTitle: 'WarFrame',
                      textGenre: 'Action',
                      textSub: 'First Person shooter',
                      textStar: '4.5',
                    ),
                  ],
                ),
              ),
              const ListHeadingGames(
                timeStamp: 'Role-playing games',
              ),
              Container(
                height: 240,
                color: Colors.black,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const <Widget>[
                    ContainerList(
                      containerImage: 'assets/pictures/dope.jpg',
                      subImage: 'assets/pictures/creed_2.png',
                      textTitle: 'Final Fantasy',
                      textGenre: 'Action',
                      textSub: 'First Person shooter',
                      textStar: '4.5',
                    ),
                    ContainerList(
                      containerImage: 'assets/pictures/adventure_3.png',
                      subImage: 'assets/pictures/creed_2.png',
                      textTitle: 'State of Chassis',
                      textGenre: 'Action',
                      textSub: 'First Person shooter',
                      textStar: '4.5',
                    ),
                    ContainerList(
                      containerImage: 'assets/pictures/action_1.png',
                      subImage: 'assets/pictures/creed_2.png',
                      textTitle: 'Marvel: The Avengers',
                      textGenre: 'Action',
                      textSub: 'First Person shooter',
                      textStar: '4.5',
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
              width: .5,
            ),
          ),
          backgroundColor: Colors.black,
          title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text('Games'),
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
            indicatorColor: Colors.deepPurple.shade300,
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