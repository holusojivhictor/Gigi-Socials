import 'package:flutter/material.dart';
import 'package:gigi_socials/src/widgets.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Size screen = MediaQuery.of(context).size;

    final double height = screen.height;

    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            height: height,
            decoration: const BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage('assets/pictures/nexus_22.png'),
                fit: BoxFit.contain,
              ),
            ),
            child: Column(
              children: <Widget>[
                Expanded(flex: 3, child: Column()),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                const SizedBox(
                                  child: HeaderNew(
                                    text: 'UnchartedMods',
                                    color: Colors.white,
                                    size: 26,
                                    weight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
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
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: ConstrainedBox(
                                    constraints: const BoxConstraints.tightFor(
                                        width: 350, height: 55),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        elevation: MaterialStateProperty.all(2),
                                        backgroundColor: MaterialStateProperty.all(
                                            Colors.deepPurple.shade300),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.pushReplacementNamed(
                                            context, '/firstPage');
                                      },
                                      child: const Text('Get Started',
                                          style: TextStyle(color: Colors.black)),
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
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}