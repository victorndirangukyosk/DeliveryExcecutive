import 'package:delivery_app/configuration/configuration.dart';
import 'package:delivery_app/user_interfaces/settings/item_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingsPage extends StatelessWidget {
  Future<PackageInfo> _getPackageInfo() {
    return PackageInfo.fromPlatform();
  }

  Widget _arrow() {
    return Icon(
      Icons.arrow_forward_ios,
      size: 20.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        color: (brightness == Brightness.light)
            ? Color(0xFFF7F7F7)
            : Color(0xFF000000),
        child: FutureBuilder<PackageInfo>(
            future: _getPackageInfo(),
            builder:
                (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
              if (snapshot.hasError) {
                return const Text('ERROR');
              } else if (!snapshot.hasData) {
                return const Text('Loading...');
              }

              final data = snapshot.data!;

              return ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      color: (brightness == Brightness.light)
                          ? Color(0xFFF7F7F7)
                          : Color(0xFF000000),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 16),
                            child: Text(
                              'App Settings',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF999999)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          // ItemCard(
                          //   title: 'Settings Item 01',
                          //   color: (brightness == Brightness.light)
                          //       ? Colors.white
                          //       : Theme.of(context).scaffoldBackgroundColor,
                          //   rightWidget:
                          //       Container(child: CupertinoActivityIndicator()),
                          //   callback: () {
                          //     print('Tap Settings Item 01');
                          //   },
                          //   textColor: Colors.amber,
                          // ),
                          // SizedBox(
                          //   height: 40,
                          // ),
                          Container(
                            padding: EdgeInsets.only(left: 16),
                            child: Text(
                              'Others',
                              style: TextStyle(
                                  fontFamily: 'NotoSansJP',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF999999)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ItemCard(
                            title: 'App Name',
                            color: (brightness == Brightness.light)
                                ? Colors.white
                                : Theme.of(context).scaffoldBackgroundColor,
                            // rightWidget: ,
                            callback: () {
                              print('Tap Settings Item 08');
                            },
                            textColor: Colors.black,
                            rightWidget: Container(
                                child: Text('${data.appName}',
                                    style: TextStyle(
                                      color: Palette.orangeColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ))),
                          ),
                          ItemCard(
                            title: 'Package Name',
                            color: (brightness == Brightness.light)
                                ? Colors.white
                                : Theme.of(context).scaffoldBackgroundColor,
                            callback: () {
                              print('');
                            },
                            textColor: Colors.black,
                            rightWidget: Container(
                                child: Text('${data.packageName}',
                                    style: TextStyle(
                                      color: Palette.orangeColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ))),
                          ),
                          ItemCard(
                              title: 'version',
                              color: (brightness == Brightness.light)
                                  ? Colors.white
                                  : Theme.of(context).scaffoldBackgroundColor,
                              rightWidget: Center(
                                child: Text('${data.version}',
                                    style: TextStyle(
                                      color: Palette.orangeColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    )),
                              ),
                              callback: () {},
                              textColor: Colors.black),
                          ItemCard(
                              title: 'Build Number',
                              color: (brightness == Brightness.light)
                                  ? Colors.white
                                  : Theme.of(context).scaffoldBackgroundColor,
                              rightWidget: Center(
                                child: Text('${data.buildNumber}',
                                    style: TextStyle(
                                      color: Palette.orangeColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    )),
                              ),
                              callback: () {},
                              textColor: Colors.black),
                          SizedBox(
                            height: 200,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
