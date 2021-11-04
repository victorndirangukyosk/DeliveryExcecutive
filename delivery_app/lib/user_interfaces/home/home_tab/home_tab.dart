import 'package:delivery_app/configuration/configuration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          CupertinoButton(
              child: Icon(
                CupertinoIcons.person,
                size: 40,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              onPressed: () {
                ///User account dialog
                showCupertinoModalPopup(
                    context: context,
                    builder: (context) => Center(
                          child: Card(
                            elevation: ConstantValues.elevationValue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    ConstantValues.borderRadiusValue)),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                CircleAvatar(
                                  backgroundImage: NetworkImage("url"),
                                ),
                                UserAccountsDrawerHeader(
                                    accountName: Text("Samuel Baraka"),
                                    accountEmail:
                                        Text("sababuvercetti@gmail.com"))
                              ],
                            ),
                          ),
                        ));
              })
        ],
      ),
      body: CustomScrollView(
        slivers: [
          ///App bar

          ///Main Content starts here

          SliverFillRemaining(
            child: Column(
              children: [
                HomeAction(
                  label: "My orders",
                  onTap: () {},
                ),
                HomeAction(
                  label: "Start trip",
                  onTap: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HomeAction extends StatelessWidget {
  final String? label;
  final Function()? onTap;
  const HomeAction({Key? key, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Palette.greenColor.withOpacity(0.5),
      child: SizedBox(
        height: 200,
        child: GridTile(
          child: InkWell(
            splashColor: Palette.orangeColor,
            onTap: onTap,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/logo.png'),
                Expanded(child: Container()),
                Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(
                                ConstantValues.borderRadiusValue),
                            bottomRight: Radius.circular(
                                ConstantValues.borderRadiusValue))),
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            label!,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          CupertinoButton(
                              onPressed: onTap,
                              child: const Icon(Icons.arrow_forward_ios))
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(ConstantValues.borderRadiusValue)),
    );
  }
}
