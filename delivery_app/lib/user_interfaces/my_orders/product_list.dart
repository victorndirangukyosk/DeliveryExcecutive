import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: List.generate(20, (index) => const ProductListItem()),
    );
  }
}

class ProductListItem extends StatelessWidget {
  const ProductListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: NetworkImage(
            'https://media.istockphoto.com/photos/tomato-isolated-on-white-background-picture-id466175630?k=20&m=466175630&s=612x612&w=0&h=TDtEkj1T8-zyM0umkND_I1e9OyO7CZj4_irW-j1GrPg='),
      ),
      title: const Text("Tomatoes"),
      subtitle: const Text("50 Units"),
      trailing: IconButton(
          icon: const Icon(
            Icons.check_circle,
            color: Colors.green,
          ),
          onPressed: () {}),
    );
  }
}
