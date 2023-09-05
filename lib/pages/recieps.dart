import 'package:flutter/material.dart';
import 'package:smart_chef/models/get_recieps.dart';
import 'package:lottie/lottie.dart';

class Recieps extends StatefulWidget {
  final String ingredient;
  const Recieps({super.key, required this.ingredient});

  @override
  State<Recieps> createState() => _ReciepsState();
}

class _ReciepsState extends State<Recieps> {
  @override
  Widget build(BuildContext context) {
    print(widget.ingredient);
    var res = getRecipes(widget.ingredient);
    print(res);
    return Center(
      child: Card(
          child: FutureBuilder(
        future: getRecipes(widget.ingredient),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: Lottie.network(
                'https://assets9.lottiefiles.com/packages/lf20_kxsd2ytq.json',
              ),
            );
          } else {
            return GridView.builder(
              itemCount: snapshot.data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                var recipe =
                    snapshot.data[index].reciep; // Corrected variable name
                print(recipe);
                return Text('Done!');
              },
            );
          }
        },
      )),
    );
  }
}
