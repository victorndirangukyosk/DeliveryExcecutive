import 'package:auto_route/auto_route.dart';
import 'package:delivery_app/configuration/palette/palette.dart';
import 'package:delivery_app/routes/router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class InvoicePage extends StatefulWidget {
  const InvoicePage({Key? key}) : super(key: key);

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text.rich(TextSpan(
            text: 'Kwik ',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Palette.orangeColor),
            children: [
              TextSpan(
                  text: 'Delivery', style: TextStyle(color: Palette.greenColor))
            ])),
        iconTheme: const IconThemeData(color: Palette.orangeColor),
        actionsIconTheme: const IconThemeData(color: Palette.orangeColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Ready for delivery',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () {
                        AutoRouter.of(context)
                            .push(const CustomerVerification());
                      },
                      icon: const Icon(
                        CupertinoIcons.check_mark,
                        size: 30,
                        color: Palette.greenColor,
                      )),
                )
              ],
            ),
            const Expanded(child: SummaryTileList()),
          ],
        ),
      ),
    );
  }
}

class SummaryTileList extends StatelessWidget {
  const SummaryTileList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: StaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: [
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: Container(
                  // color: Palette.placeholderGrey,
                  decoration: BoxDecoration(
                      border: Border.all(color: Palette.orangeColor),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1,
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Palette.orangeColor),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        Row(
                          children: [],
                        )
                      ],
                    )),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 1,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Palette.orangeColor),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
              // StaggeredGridTile.count(
              //   crossAxisCellCount: 1,
              //   mainAxisCellCount: 1,
              //   child: Container(
              //     decoration: BoxDecoration(
              //         border: Border.all(color: Palette.orangeColor),
              //         borderRadius: BorderRadius.all(Radius.circular(20))),
              //   ),
              // ),
              // StaggeredGridTile.count(
              //   crossAxisCellCount: 1,
              //   mainAxisCellCount: 1,
              //   child: Container(decoration: BoxDecoration(
              //         border: Border.all(color: Palette.orangeColor),
              //         borderRadius: BorderRadius.all(Radius.circular(20))),),
              // ),
              StaggeredGridTile.count(
                crossAxisCellCount: 4,
                mainAxisCellCount: 2,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Palette.orangeColor),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 4,
                mainAxisCellCount: 2,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Palette.orangeColor),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
