import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_chef/models/constants.dart';
import 'package:smart_chef/models/get_recieps.dart';

class Description extends StatefulWidget {
  final String recUrl;
  final String title;
  final String ingredients;
  const Description(
      {super.key,
      required this.recUrl,
      required this.title,
      required this.ingredients});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainColor,
        body: Center(
          child: FutureBuilder(
              future: getDetails(widget.recUrl),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Center(
                    child: Lottie.network(
                      'https://assets9.lottiefiles.com/packages/lf20_kxsd2ytq.json',
                    ),
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final recipeImage = snapshot.data[index].imageUrl;
                        final recipeTitle = widget.title;
                        final firstStep = snapshot.data[index].firstStep;
                        final secondStep = snapshot.data[index].secondStep;
                        print(recipeImage);
                        String inputText = widget.ingredients;
                        List<String> items = inputText
                            .split(',')
                            .map((item) => item.trim())
                            .toList();

                        return Container(
                          height: 680,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(
                                    40.0), // Adjust the radius as needed
                                bottomRight: Radius.circular(
                                    40.0), // Adjust the radius as needed
                              ),
                              color: Colors
                                  .white // Set the background color of the container
                              ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(top: 40),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: 80,
                                      child: ClipOval(
                                          child: recipeImage != ''
                                              ? Image.network(recipeImage)
                                              : Image.asset(
                                                  'lib/images/no_data.jpg')),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, left: 10, right: 10),
                                  child: Text(
                                    recipeTitle,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 40, right: 280),
                                  child: Text(
                                    'Ingredients',
                                    // textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 10, right: 10),
                                    child: Text(widget.ingredients)),
                                const Padding(
                                  padding: EdgeInsets.only(top: 40, right: 320),
                                  child: Text(
                                    'Step 1',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, left: 10, right: 10),
                                  child: Text(
                                    firstStep,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 40, right: 320),
                                  child: Text(
                                    'Step 2',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, left: 10, right: 10),
                                  child: secondStep != null
                                      ? Text(
                                          secondStep,
                                          textAlign: TextAlign.left,
                                        )
                                      : const Text(''),
                                ),
                              ],
                            ),
                          ),
                        );
                        // for(var items in recipe);
                      });
                }
              }),
        ));
  }
}
