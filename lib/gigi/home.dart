import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gigi_socials/src/widgets.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Size screen = MediaQuery.of(context).size;

    final double width = screen.width;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
              backgroundColor: Colors.black,
              pinned: true,
              expandedHeight: 240,
              flexibleSpace: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: FlexibleSpaceBar(
                  background: Image.asset('assets/pictures/fortnite_2.png',
                  fit: BoxFit.contain),
                ),
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    children: <Widget>[
                      Row(
                        children: const <Widget>[
                          Text('UNCHARTED',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(
                          height: 15,
                          child: VerticalDivider(
                              color: Colors.white, thickness: 1)),
                      Row(
                        children: const <Widget>[
                          Text('The Reckoning',
                              style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: width - 310,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    const Text('\$2,150',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    PopupMenuButton<Text>(
                      color: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      itemBuilder: (BuildContext context) {
                        return <Text>{
                          const Text('Settings'),
                          const Text('App info'),
                          const Text('Contact us'),
                        }.map((Text choice) {
                          return PopupMenuItem<Text>(
                            value: choice,
                            child: choice,
                          );
                        }).toList();
                      },
                    ),
                  ],
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20, top: 25),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: const Text('Star Leagues',
                                          style: TextStyle(
                                              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                          'Every day, lives are lost in the dessert '
                                              'of the Undead. It is the time of the great '
                                              'reckoning after all. Coming soon to a shack near you.',
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 15)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5, bottom: 10),
                                    child: Row(
                                      children: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).push(MaterialPageRoute(
                                                builder: (BuildContext context) {
                                                  return const DownloadPage(
                                                    gameCreator: 'InfinityGames.io',
                                                    gameName: 'League of Legends',
                                                    imageSmall: 'assets/pictures/dungeon.png',
                                                    starRating: '4.4',
                                                    reviewCount: '420k reviews',
                                                    downloadCount: '10M+',
                                                    ratingType: 'E',
                                                    ratingExplained: 'Everyone',
                                                    previewPicture1: 'assets/pictures/war_frame.png',
                                                    previewPicture2: 'assets/pictures/adventure_1.jpg',
                                                    previewPicture3: 'assets/pictures/extinction.jpg',
                                                    previewPicture4: 'assets/pictures/action_4.jpg',
                                                    gameDescription: 'Explore a mad world full of crimes, wars, robots and desires.',
                                                    gameClass1: 'Action',
                                                    gameClass2: 'Casual',
                                                    gameClass3: 'Role Playing',
                                                    gameClass4: 'Adventure',
                                                    gameClass5: 'Stylised',
                                                    intStarRating: 4.4,
                                                  );
                                                  },
                                              ));
                                          },
                                          child: const Text('Buy',
                                              style: TextStyle(
                                                  fontSize: 23, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  height: 200,
                                  width: 110,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/pictures/dungeon.png'),
                                      fit: BoxFit.contain,
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      height: 125,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: SizedBox(
                              child: Text('Total number of players',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15)),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8),
                            child: SizedBox(
                              child: Text('21,142,754',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: SizedBox(
                              child: ConstrainedBox(
                                constraints: BoxConstraints.tightFor(
                                    width: width * 0.97, height: 40),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    elevation: MaterialStateProperty.all(2),
                                    backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Join'),
                                      ),
                                    );
                                  },
                                  child: const Text('Join Now', style: TextStyle(color: Colors.white70)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20, top: 25),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: const Text('Pre-Order now',
                                          style: TextStyle(
                                              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                          'Every day, lives are lost in the dessert '
                                              'of the Undead. It is the time of the great '
                                              'reckoning after all. Coming soon to a shack near you.',
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 15)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5, bottom: 10),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.of(context).push(MaterialPageRoute(
                                            builder: (BuildContext context) {
                                              return const DownloadPage(
                                                gameCreator: 'Ubisoft',
                                                gameName: "Assassin's creed",
                                                imageSmall: 'assets/pictures/creed.png',
                                                starRating: '4.2',
                                                reviewCount: '265k reviews',
                                                downloadCount: '5M+',
                                                ratingType: 'M',
                                                ratingExplained: 'Mature',
                                                previewPicture1: 'assets/pictures/wp4806803-4k-gaming-wallpapers.jpg',
                                                previewPicture2: 'assets/pictures/wp23.jpg',
                                                previewPicture3: 'assets/pictures/wp5254488-gaming-poster-wallpapers.jpg',
                                                previewPicture4: 'assets/pictures/wp5231514-4k-gaming-wallpapers.jpg',
                                                gameDescription: 'Explore a mad world full of crimes, wars, adventure and desires.',
                                                gameClass1: 'Open - world',
                                                gameClass2: 'Action',
                                                gameClass3: 'Role Playing',
                                                gameClass4: 'Adventure',
                                                gameClass5: 'Stealth',
                                                intStarRating: 4.2,
                                              );
                                            },
                                          ));
                                        },
                                        child: const Text('Buy',
                                            style: TextStyle(
                                                fontSize: 23, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  height: 200,
                                  width: 110,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/pictures/creed.png'),
                                      fit: BoxFit.contain,
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      height: 120,
                      decoration: const BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 5),
                            child: SizedBox(
                              child: Text('70%',
                                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5),
                            child: SizedBox(
                              width: 350,
                              child: Text(
                                  '70% of our users report an increase in gaming level and satisfaction after just a short time with us.',
                                  style: TextStyle(fontSize: 15, color: Colors.white), textAlign: TextAlign.center),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: SizedBox(
                              child: ConstrainedBox(
                                constraints: const BoxConstraints.tightFor(height: 20),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    elevation: MaterialStateProperty.all(2),
                                    backgroundColor: MaterialStateProperty.all(Colors.white),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Proceed'),
                                      ),
                                    );
                                  },
                                  child: const Text('Proceed', style: TextStyle(color: Colors.black)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      height: 370,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 5,
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                                  image: DecorationImage(
                                    image: AssetImage('assets/pictures/wp5254488-gaming-poster-wallpapers.jpg'),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20, top: 20),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: const Text('The Witcher',
                                          style: TextStyle(
                                              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                          'Every day, lives are lost in the dessert '
                                              'of the Undead. It is the time of the great '
                                              'reckoning after all. Coming soon to a shack near you.',
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 15)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15, bottom: 5),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: TextButton(
                                        onPressed: () {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(content: Text('Learn More'),
                                            ),
                                          );
                                        },
                                        child: const Text('Learn More',
                                            style: TextStyle(
                                                fontSize: 23, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                                      ),
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/pictures/creed_2.png'),
                          fit: BoxFit.contain,
                        ),
                        color: Colors.grey[300],
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 120, left: 5),
                                  child: Container(
                                    alignment: Alignment.bottomLeft,
                                    child:
                                      FloatingActionButton(
                                        onPressed: () {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(content: Text('Previous'),
                                            ),
                                          );
                                        },
                                        elevation: 3,
                                        backgroundColor: Colors.deepPurple,
                                        child: const Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
                                      ),
                                  ),
                                ),
                                SizedBox(
                                  width: width - 140,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 120),
                                  child: Container(
                                    alignment: Alignment.bottomRight,
                                    child:
                                      FloatingActionButton(
                                        onPressed: () {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(content: Text('Next'),
                                            ),
                                          );
                                        },
                                        elevation: 3,
                                        backgroundColor: Colors.deepPurple,
                                        child: const Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: Colors.white),
                                      ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 130,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, bottom: 10, top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        width: width * 0.2,
                                        child: const Text(r'$8.50',
                                            style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        width: width * 0.2,
                                        child: const Text('Paid by you',
                                            style: TextStyle(fontSize: 15, color: Colors.deepPurple), textAlign: TextAlign.center),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.all(15),
                              child: SizedBox(
                                  height: 45,
                                  child: VerticalDivider(color: Colors.black, thickness: 1 / 2)),
                            ),
                            Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        width: width * 0.2,
                                        child: const Text('5',
                                            style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      width: width * 0.2,
                                      child: const Text('Games played',
                                          style: TextStyle(fontSize: 15, color: Colors.deepPurple), textAlign: TextAlign.center),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.all(15),
                              child: SizedBox(
                                  height: 45,
                                  child: VerticalDivider(color: Colors.black, thickness: 1 / 2)),
                            ),
                            Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        width: width * 0.2,
                                        child: const Text(r'$22.50',
                                            style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        width: width * 0.2,
                                        child: const Text('All-time spend',
                                            style: TextStyle(fontSize: 15, color: Colors.deepPurple), textAlign: TextAlign.center),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: 40,
                                child: ConstrainedBox(
                                  constraints: BoxConstraints.tightFor(
                                      width: width * 0.97, height: 20),
                                  child: ElevatedButton(
                                    style: ButtonStyle(elevation: MaterialStateProperty.all(2),
                                      backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
                                      ),
                                      ),
                                    ),
                                    onPressed: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text('Play'),
                                        ),
                                      );
                                    },
                                    child: const Text('Play'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0),
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const <Widget>[
                          AdList(
                            textTitle: Text("Assassin's Creed",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                            image: AssetImage('assets/pictures/creed_1.png'),
                            textDescription: Text(
                                'Click here to download the full version now.',
                                style: TextStyle(color: Colors.black, fontSize: 17)),
                          ),
                          AdList(
                            textTitle: Text('PUBG Kakarin',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                            image: AssetImage('assets/pictures/pubg_PNG45.png'),
                            textDescription: Text(
                                'Click here to download the full version now.',
                                style: TextStyle(color: Colors.black, fontSize: 17)),
                          ),
                          AdList(
                            textTitle: Text('FIFA 20',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                            image: AssetImage('assets/pictures/fifa_game_PNG79.png'),
                            textDescription: Text(
                                'Click here to download the full version now, son.',
                                style: TextStyle(color: Colors.black, fontSize: 17)),
                          ),
                          AdList(
                            textTitle: Text('RDR 2',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                            image: AssetImage('assets/pictures/red_dead_redemption_PNG60.png'),
                            textDescription: Text(
                                'Click here to download the full version now, son.',
                                style: TextStyle(color: Colors.black, fontSize: 17)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
            ),
          ],
        ),
      ),
    );
  }
}
