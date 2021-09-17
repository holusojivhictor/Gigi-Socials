import 'package:flutter/material.dart';
import 'package:gigi_socials/src/widgets.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {

    final Size screen = MediaQuery.of(context).size;
    final double width = screen.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Profile', textAlign: TextAlign.center),
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Edit'),
              ),
            );
          },
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            child: const Icon(Icons.edit),
        ),
        actions: <Widget>[
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black),
            ),
            onPressed: () {},
            child: const Icon(Icons.link),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Column(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  border: Border(
                    bottom: BorderSide(color: Colors.white, width: .5),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    color: Colors.black,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Container(
                                color: Colors.white.withOpacity(0),
                                child: CircleAvatar(
                                  radius: 60,
                                  backgroundColor: Colors.white.withOpacity(0),
                                  child: Image.asset('assets/pictures/256_16.png'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                height: 30,
                                width: 160,
                                color: Colors.white.withOpacity(0),
                                child: const Text('NemusObsidian', style: TextStyle(fontSize: 24, color: Colors.white),
                                    textAlign: TextAlign.center),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: ConstrainedBox(
                                constraints: const BoxConstraints.tightFor(height: 25),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    elevation: MaterialStateProperty.all(2),
                                    backgroundColor: MaterialStateProperty.all(Colors.black),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
                                        side: const BorderSide(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text('obsidiannemus@gmail.com', style: TextStyle(color: Colors.white, fontSize: 13)),
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
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: const <Widget>[
                            SizedBox(
                              height: 25,
                              child: Text('ACCOUNT & PROFILE', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
                                  textAlign: TextAlign.start),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  height: 20,
                                  width: 120,
                                  color: Colors.black,
                                  child: const Text('Current User', style: TextStyle(fontSize: 16, color: Colors.white), textAlign: TextAlign.start),
                                ),
                              ],
                            ),
                            SizedBox(width: width - 410),
                            Padding(
                              padding: const EdgeInsets.only(left: 180),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    height: 20,
                                    width: 80,
                                    color: Colors.black,
                                    child: const Text('nemusObsidian', style: TextStyle(fontSize: 14, color: Colors.white)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const DividerNew(thickness: .2),
                      const SettingsList(
                        firstInput: 'Membership Plan',
                        secondInput: '',
                      ),
                      const DividerNew(thickness: .2),
                      const SettingsList(
                        firstInput: 'Change Email',
                        secondInput: 'obsidiannemus@gmail.com',
                      ),
                      const DividerNew(thickness: .2),
                      const SettingsList(
                        firstInput: 'Change Password',
                        secondInput: '',
                      ),
                      const DividerNew(thickness: .2),
                      const SettingsHeading(
                        textHeading: 'GENERAL',
                      ),
                      const SettingsList(
                        firstInput: 'Language',
                        secondInput: 'English',
                      ),
                      const DividerNew(thickness: .2),
                      const SettingsHeading(
                        textHeading: 'APP EXPERIENCE',
                      ),
                      const SettingsList(
                        firstInput: 'Stream Quality',
                        secondInput: '',
                      ),
                      const DividerNew(thickness: .2),
                      const SettingsList(
                        firstInput: 'Notifications',
                        secondInput: '',
                      ),
                      const DividerNew(thickness: .2),
                      const SettingsHeading(
                        textHeading: 'PRIVACY',
                      ),
                      const SettingsList(
                        firstInput: 'Security Settings',
                        secondInput: '',
                      ),
                      const DividerNew(thickness: .2),
                      const SettingsHeading(
                        textHeading: 'ABOUT',
                      ),
                      const SettingsList(
                        firstInput: 'Need Help?',
                        secondInput: '',
                      ),
                      const DividerNew(thickness: .2),
                      const SettingsList(
                        firstInput: 'Log Out',
                        secondInput: '',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}