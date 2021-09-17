import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ButtonGameClass extends StatelessWidget {
  const ButtonGameClass({
   required this.gameClass,
});
  final String gameClass;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(height: 30),
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(2),
            backgroundColor: MaterialStateProperty.all(Colors.black),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
                side: const BorderSide(color: Colors.grey),
              ),
            ),
          ),
          onPressed: () {},
          child: Text(gameClass, style: const TextStyle(color: Colors.grey, fontSize: 14)),
        ),
      ),
    );
  }
}

class PreviewPictures extends StatelessWidget {
  const PreviewPictures({
   required this.previewPicture,
});
  final String previewPicture;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        height: 150,
        width: 280,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(previewPicture),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}

class DownloadPage extends StatefulWidget {
  const DownloadPage({
    required this.imageSmall,
    required this.gameName,
    required this.gameCreator,
    required this.starRating,
    required this.downloadCount,
    required this.reviewCount,
    required this.ratingType,
    required this.ratingExplained,
    required this.previewPicture1,
    required this.previewPicture2,
    required this.previewPicture3,
    required this.previewPicture4,
    required this.gameDescription,
    required this.gameClass1,
    required this.gameClass2,
    required this.gameClass3,
    required this.gameClass4,
    required this.gameClass5,
    required this.intStarRating,
  });
  final String imageSmall;
  final String gameName;
  final String gameCreator;
  final String starRating;
  final String downloadCount;
  final String reviewCount;
  final String ratingType;
  final String ratingExplained;
  final String previewPicture1;
  final String previewPicture2;
  final String previewPicture3;
  final String previewPicture4;
  final String gameDescription;
  final String gameClass1;
  final String gameClass2;
  final String gameClass3;
  final String gameClass4;
  final String gameClass5;
  final double intStarRating;

  @override
  _DownloadPageState createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {

  @override
  Widget build(BuildContext context) {

    final Size screen = MediaQuery.of(context).size;
    final double width = screen.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AppBar(
              backgroundColor: Colors.black,
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
                PopupMenuButton<Text>(
                  color: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  itemBuilder: (BuildContext context) {
                    return <Text>{
                      const Text('Share'),
                      const Text('Add to wishlist'),
                      const Text('Flag as inappropriate'),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 20),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(widget.imageSmall),
                              fit: BoxFit.contain,
                            ),
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 75,
                          width: 240,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0),
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 30,
                                    child: Text(widget.gameName, style: const TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    height: 20,
                                    child: Text(widget.gameCreator, style: const TextStyle(fontSize: 14, color: Colors.deepPurpleAccent)),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Row(
                                    children: const <Widget>[
                                      SizedBox(
                                        height: 15,
                                        child: Text('Contains ads', style: TextStyle(fontSize: 13, color: Colors.grey)),
                                      ),
                                      SizedBox(
                                        height: 15,
                                        width: 15,
                                        child: Icon(Icons.circle, size: 5, color: Colors.grey),
                                      ),
                                      SizedBox(
                                        height: 15,
                                        child: Text('In-app purchases', style: TextStyle(fontSize: 13, color: Colors.grey)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 10, top: 10),
                        child: Row(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: width * 0.1,
                                  child: Text(widget.starRating,
                                      style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.right),
                                ),
                              ],
                            ),
                            const SizedBox(
                              child: Icon(Icons.star, size: 14),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: width * 0.2,
                              child: Text(widget.reviewCount,
                                  style: const TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                        height: 30,
                        child: VerticalDivider(color: Colors.grey, thickness: 1)),
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
                              child: Text(widget.downloadCount,
                                  style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
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
                            child: const Text('Downloads',
                                style: TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                        height: 30,
                        child: VerticalDivider(color: Colors.grey, thickness: 1)),
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
                              child: Text(widget.ratingType,
                                  style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
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
                              child: Text(widget.ratingExplained,
                                  style: const TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.center),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 40,
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tightFor(
                          width: width * 0.87, height: 20),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(2),
                          backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),
                          ),
                          ),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Install'),
                            ),
                          );
                        },
                        child: const Text('Install'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: 160,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    PreviewPictures(previewPicture: widget.previewPicture1),
                    PreviewPictures(previewPicture: widget.previewPicture2),
                    PreviewPictures(previewPicture: widget.previewPicture3),
                    PreviewPictures(previewPicture: widget.previewPicture4),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: ListHeadingDownload(timeStamp: 'About this game'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: SizedBox(
                width: width * 0.87,
                child: Text(widget.gameDescription,
                        style: const TextStyle(color: Colors.grey, fontSize: 15), textAlign: TextAlign.start),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SizedBox(
                height: 30,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    ButtonGameClass(gameClass: widget.gameClass1),
                    ButtonGameClass(gameClass: widget.gameClass2),
                    ButtonGameClass(gameClass: widget.gameClass3),
                    ButtonGameClass(gameClass: widget.gameClass4),
                    ButtonGameClass(gameClass: widget.gameClass5),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: ListHeadingDownload(timeStamp: 'Ratings and reviews'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: SizedBox(
                              child: Text(widget.starRating, style: const TextStyle(color: Colors.white, fontSize: 45)),
                            ),
                          ),
                          RatingBar.builder(
                            itemSize: 14,
                            initialRating: widget.intStarRating,
                            minRating: 1,
                            allowHalfRating: true,
                            itemBuilder: (BuildContext context, _) => const Icon(
                              Icons.star,
                              color: Colors.deepPurpleAccent,
                            ),
                            onRatingUpdate: (double rating) {
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: SizedBox(
                              width: width * 0.16,
                              child: Text(widget.reviewCount, style: const TextStyle(color: Colors.grey, fontSize: 12), textAlign: TextAlign.start),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: Row(
                            children: const <Widget>[
                              SizedBox(
                                width: 20,
                                child: Text('5', style: TextStyle(color: Colors.white)),
                              ),
                              RatingSlider(newValue: 0.8),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: Row(
                            children: const <Widget>[
                              SizedBox(
                                width: 20,
                                child: Text('4', style: TextStyle(color: Colors.white)),
                              ),
                              RatingSlider(newValue: 0.2),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: Row(
                            children: const <Widget>[
                              SizedBox(
                                width: 20,
                                child: Text('3', style: TextStyle(color: Colors.white)),
                              ),
                              RatingSlider(newValue: 0.1),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: Row(
                            children: const <Widget>[
                              SizedBox(
                                width: 20,
                                child: Text('2', style: TextStyle(color: Colors.white)),
                              ),
                              RatingSlider(newValue: 0.1),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: Row(
                            children: const <Widget>[
                              SizedBox(
                                width: 20,
                                child: Text('1', style: TextStyle(color: Colors.white)),
                              ),
                              RatingSlider(newValue: 0.2),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingSlider extends StatelessWidget {

  const RatingSlider({required this.newValue});

  final double newValue;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        overlayShape: SliderComponentShape.noOverlay,
        disabledActiveTrackColor: Colors.deepPurple,
        disabledInactiveTrackColor: Colors.white38,
        trackHeight: 7.0,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0),
      ),
      child: SizedBox(
        width: 210,
        child: Slider(
          onChanged: null,
          value: newValue,
        ),
      ),
    );
  }
}

class WideLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 0.55;

    final double itemWidth = size.width / 2;

    return GridView.count(
      crossAxisCount: 4,
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
}

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);

  final List<Widget> kInfo = <Widget>[
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage('assets/pictures/nexus_19.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: <Widget>[
          Expanded(flex: 3, child: Column()),
          Expanded(
            child: Column(
              children: const <Widget>[
                SizedBox(
                  child: HeaderNew(
                    text: 'UnchartedMods',
                    color: Colors.white,
                    size: 26,
                    weight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 270,
                  child: HeaderNew(
                    text: 'Every day, lives are lost in the dessert '
                        'of the Undead. It is the time of the great '
                        'reckoning after all.',
                    color: Colors.white,
                    size: 18,
                    weight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage('assets/pictures/nexus_018.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: <Widget>[
          Expanded(flex: 3, child: Column()),
          Expanded(
            child: Column(
              children: const <Widget>[
                SizedBox(
                  child: HeaderNew(
                    text: 'UnchartedMods',
                    color: Colors.white,
                    size: 26,
                    weight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 270,
                  child: HeaderNew(
                    text: 'Every day, lives are lost in the dessert '
                        'of the Undead. It is the time of the great '
                        'reckoning after all.',
                    color: Colors.white,
                    size: 18,
                    weight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage('assets/pictures/nexus_19.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: <Widget>[
          Expanded(flex: 3, child: Column()),
          Expanded(
            child: Column(
              children: const <Widget>[
                SizedBox(
                  child: HeaderNew(
                    text: 'UnchartedMods',
                    color: Colors.white,
                    size: 26,
                    weight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 270,
                  child: HeaderNew(
                    text: 'Every day, lives are lost in the dessert '
                        'of the Undead. It is the time of the great '
                        'reckoning after all.',
                    color: Colors.white,
                    size: 18,
                    weight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: DefaultTabController(
          length: kInfo.length,
          child: Builder(
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TabBarView(children: kInfo),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TabPageSelector(),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.deepPurple.shade300),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/gigi');
                      },
                      child: const Text('SKIP'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}


class HeaderNew extends StatelessWidget {
  const HeaderNew({
    required this.text,
    required this.color,
    required this.size,
    required this.weight,
  });
  final String text;
  final Color color;
  final double size;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        text,
        style: TextStyle(fontSize: size, color: color, fontWeight: weight),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header(this.heading);
  final String heading;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      heading,
      style: const TextStyle(fontSize: 24, color: Colors.white),
    ),
  );
}

class StyledButton extends StatelessWidget {
  const StyledButton({required this.child,required  this.onPressed});
  final Widget child;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: 350, height: 55),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(2),
          backgroundColor: MaterialStateProperty.all(Colors.deepPurple.shade300),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}

class AlertButton extends StatelessWidget {
  const AlertButton({required this.child,required  this.onPressed});
  final Widget child;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: 100, height: 40),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(2),
          backgroundColor: MaterialStateProperty.all(Colors.deepPurple.shade200),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}

class DividerIndented extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const Divider(thickness: 1, indent: 100, height: 0.5, color: Colors.white24);
  }
}

class DividerNew extends StatelessWidget {
  const DividerNew({
    required this.thickness,
  });
  final double thickness;

  @override
  Widget build(BuildContext context) {
    return Divider(thickness: thickness, color: Colors.white);
  }
}

class ContainerGenres extends StatelessWidget {

  const ContainerGenres({
    required this.icon,
    required this.text,
  });
  final IconData icon;
  final String text;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.black,
        child: InkWell(
          splashColor: Colors.white24,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Open'),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.deepPurple.shade300),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 5, top: 5),
                  child: Container(
                    alignment: Alignment.topRight,
                    height: 10,
                    color: Colors.white.withOpacity(0),
                    child: const Icon(Icons.star_border_outlined, size: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35, left: 10, right: 10, bottom: 5),
                  child: Container(
                    height: 30,
                    color: Colors.white.withOpacity(0),
                    child: Icon(icon, color: Colors.white, size: 25),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                  child: Container(
                    height: 40,
                    color: Colors.white.withOpacity(0),
                    child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AdList extends StatelessWidget {

  const AdList({
    required this.textDescription,
    required this.image,
    required this.textTitle,
  });

  final Text textDescription;
  final AssetImage image;
  final Text textTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 10, bottom: 20),
      child: Container(
        height: 250,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      textTitle
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  width: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: image,
                        fit: BoxFit.contain,
                      )),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 25,
                    child: textDescription,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Row(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            height: 15,
                            child: ConstrainedBox(
                              constraints: const BoxConstraints.tightFor(width: 90, height: 20),
                              child: ElevatedButton(
                                style: ButtonStyle(elevation: MaterialStateProperty.all(2),
                                  backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  ),
                                ),
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Sponsored'),
                                    ),
                                  );
                                },
                                child: const Text('Sponsored', style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              height: 15,
                              child: ConstrainedBox(
                                constraints: const BoxConstraints.tightFor(width: 90, height: 20),
                                child: ElevatedButton(
                                  style: ButtonStyle(elevation: MaterialStateProperty.all(2),
                                    side: MaterialStateProperty.all<BorderSide>(const BorderSide(color: Colors.deepPurple)),
                                    backgroundColor : MaterialStateProperty.all(Colors.white.withOpacity(0)),
                                    shadowColor: MaterialStateProperty.all(Colors.white.withOpacity(0)),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    ),
                                  ),
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Download'),
                                      ),
                                    );
                                  },
                                  child: const Text('Download', style: TextStyle(color: Colors.deepPurple)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerList extends StatelessWidget {

  const ContainerList({
    required this.containerImage,
    required this.subImage,
    required this.textTitle,
    required this.textGenre,
    required this.textSub,
    required this.textStar,
  });

  final String containerImage;
  final String subImage;
  final String textTitle;
  final String textGenre;
  final String textSub;
  final String textStar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Row(
        children: <Widget>[
          Container(
            width: 260,
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 130,
                        width: 240,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(containerImage),
                            fit: BoxFit.cover,
                          ),
                          color: Colors.white.withOpacity(0),
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(subImage),
                              ),
                              color: Colors.grey,
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          height: 60,
                          width: 170,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      height: 20,
                                      width: 160,
                                      color: Colors.black,
                                      child: Text(textTitle, style: const TextStyle(fontSize: 15, color: Colors.white)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          height: 15,
                                          width: 30,
                                          color: Colors.black,
                                          child: Text(textGenre, style: const TextStyle(fontSize: 13, color: Colors.white)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          height: 15,
                                          width: 15,
                                          color: Colors.black,
                                          child: const Icon(Icons.circle, size: 5),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          height: 15,
                                          width: 110,
                                          color: Colors.black,
                                          child: Text(textSub, style: const TextStyle(fontSize: 13, color: Colors.white)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      height: 15,
                                      width: 15,
                                      color: Colors.black,
                                      child: Text(textStar, style: const TextStyle(fontSize: 12, color: Colors.white)),
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      height: 10,
                                      width: 15,
                                      color: Colors.black,
                                      child: const Icon(Icons.star, size: 8),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ListHeadingGames extends StatelessWidget {

  const ListHeadingGames({
    required this.timeStamp,
  });

  final String timeStamp;

  @override
  Widget build(BuildContext context) {

    final Size screen = MediaQuery.of(context).size;
    final double width = screen.width;

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: Row(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    height: 30,
                    width: 170,
                    color: Colors.black,
                    child: Text(timeStamp, style: const TextStyle(fontSize: 20, color: Colors.grey)),
                  ),
                ],
              ),
              SizedBox(width: width - 240),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 3),
                    child: Container(
                      height: 30,
                      width: 40,
                      color: Colors.black,
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Icon(Icons.arrow_forward, color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class GamesList extends StatelessWidget {

  const GamesList({
    required this.image,
    required this.textTitle,
    required this.textDescription,
  });

  final String image;
  final String textTitle;
  final String textDescription;

  @override
  Widget build(BuildContext context) {

    final Size screen = MediaQuery.of(context).size;
    final double width = screen.width;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.contain,
                      ),
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  height: 70,
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                              child: Text(textTitle, style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              height: 15,
                              child: Text(textDescription, style: const TextStyle(fontSize: 13, color: Colors.white)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: width - 360),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white.withOpacity(0)),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Play'),
                            ),
                          );
                        },
                        child: Icon(Icons.play_arrow_rounded, color: Colors.deepPurple.shade400, size: 28),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Filter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final Size screen = MediaQuery.of(context).size;
    final double width = screen.width;
    return AppBar(
      backgroundColor: Colors.black,
      title: const Padding(
        padding: EdgeInsets.only(),
        child: Text('Recent Activity', style: TextStyle(fontSize: 15)),
      ),
      automaticallyImplyLeading: false,
      actions: <Widget>[
        SizedBox(width: width - 300),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black.withOpacity(0)),
          ),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Sort'),
              ),
            );
          },
          child: const Icon(Icons.sort),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black.withOpacity(0)),
          ),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Filter'),
              ),
            );
          },
          child: const Icon(Icons.filter_alt_outlined),
        ),
      ],
    );
  }
}
class HistoryList extends StatelessWidget {

  const HistoryList({
    required this.content1,
    required this.content2,
    required this.content3,
  });

  final Widget content1;
  final Widget content2;
  final Widget content3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: content1,
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: content2,
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: content3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HistorySubList extends StatelessWidget {

  const HistorySubList({
    required this.image,
    required this.textTitle,
    required this.textStar,
    required this.textPrice,
  });

  final String image;
  final String textTitle;
  final String textStar;
  final String textPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 180,
          width: 120,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
            color: Colors.black,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            height: 20,
            width: 120,
            color: Colors.black,
            child: Text(textTitle, style: const TextStyle(fontSize: 16, color: Colors.white)),
          ),
        ),
        Row(
          children: <Widget>[
            Container(
              height: 20,
              width: 15,
              color: Colors.black,
              child: Text(textStar, style: const TextStyle(fontSize: 13, color: Colors.white)),
            ),
            Container(
              alignment: Alignment.topLeft,
              height: 18,
              width: 15,
              color: Colors.black,
              child: const Icon(Icons.star, size: 10, color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Container(
                height: 20,
                width: 60,
                color: Colors.black,
                child: Text(textPrice, style: const TextStyle(fontSize: 13, color: Colors.white)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ListHeading extends StatelessWidget {

  const ListHeading({
    required this.timeStamp,
  });

  final String timeStamp;

  @override
  Widget build(BuildContext context) {

    final Size screen = MediaQuery.of(context).size;
    final double width = screen.width;
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    height: 30,
                    width: 170,
                    color: Colors.black,
                    child: Text(timeStamp, style: const TextStyle(fontSize: 20, color: Colors.grey)),
                  ),
                ],
              ),
              SizedBox(width: width - 240),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Container(
                      height: 30,
                      width: 40,
                      color: Colors.black,
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Icon(Icons.arrow_forward, color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ListHeadingDownload extends StatelessWidget {

  const ListHeadingDownload({
    required this.timeStamp,
  });

  final String timeStamp;

  @override
  Widget build(BuildContext context) {

    final Size screen = MediaQuery.of(context).size;
    final double width = screen.width;
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    height: 30,
                    width: 170,
                    color: Colors.black,
                    child: Text(timeStamp, style: const TextStyle(fontSize: 19, color: Colors.white)),
                  ),
                ],
              ),
              SizedBox(width: width - 260),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Container(
                      height: 30,
                      width: 40,
                      color: Colors.black,
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Icon(Icons.arrow_forward, color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SettingsHeading extends StatelessWidget {

  const SettingsHeading({
    required this.textHeading,
  });

  final String textHeading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              height: 20,
              child: Text(textHeading, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
                  textAlign: TextAlign.start),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsList extends StatelessWidget {

  const SettingsList({
    required this.firstInput,
    required this.secondInput,
  });

  final String firstInput;
  final String secondInput;

  @override
  Widget build(BuildContext context) {

    final Size screen = MediaQuery.of(context).size;
    final double width = screen.width;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 20,
                width: 120,
                color: Colors.black,
                child: Text(firstInput, style: const TextStyle(fontSize: 16, color: Colors.white), textAlign: TextAlign.start),
              ),
            ],
          ),
          SizedBox(width: width - 330),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 20,
                  width: 140,
                  color: Colors.black,
                  child: Text(secondInput, style: const TextStyle(fontSize: 14, color: Colors.white), textAlign: TextAlign.end),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 20,
                  width: 15,
                  color: Colors.black,
                  child: const Icon(Icons.arrow_forward_ios_outlined, size: 13, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}