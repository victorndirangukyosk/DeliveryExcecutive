import 'package:delivery_app/cubits/crates_qr_cubit/crates_qr_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class CratesPage extends StatefulWidget {
  const CratesPage({Key? key}) : super(key: key);

  @override
  State<CratesPage> createState() => _CratesPageState();
}

class _CratesPageState extends State<CratesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${context.watch<CratesQRCubit>().state.length} Scanned crates'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          var crate = JwtDecoder.decode(
              context.watch<CratesQRCubit>().state[index].code!);
          return ListTile(
            title: Text(crate['serial_number']),
            trailing: IconButton(
                onPressed: () {
                  context
                      .read<CratesQRCubit>()
                      .removeQR(context.watch<CratesQRCubit>().state[index]);
                  setState(() {});
                },
                icon: const Icon(Icons.close)),
          );
        },
        itemCount: context.watch<CratesQRCubit>().state.length,
      ),
      bottomNavigationBar:
          CupertinoButton(child: const Text('Submit'), onPressed: () {}),
    );
  }
}
