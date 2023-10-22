import 'package:flutter/material.dart';
import 'package:smart_chef/models/constants.dart';
import 'package:smart_chef/models/get_recieps.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_chef/pages/reciepsDescription.dart';

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
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                var recipe = snapshot.data[index].reciep;
                var ingredients =
                    snapshot.data[index].ingredients; // Corrected variable name
                var recUrl = snapshot.data[index].recUrl;
                print(recUrl);
                return GestureDetector(
                    onTap: () {
                      print(recipe);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Description(recUrl: recUrl)));
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.more_sharp,
                        color: mainColor,
                      ),
                      title: Text(
                        recipe,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        ingredients,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 129, 129, 129)),
                      ),
                    ));
              },
            );
          }
        },
      )),
    );
  }
}
