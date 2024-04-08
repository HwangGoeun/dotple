import 'package:dotple/constants/variable.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  var category_list = List<int>.generate(50, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("카테고리 관리"),
      ),
      body: Center(
        child: SizedBox(
          width: screenWidth * 0.9,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: category_list.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: screenHeight / 20,
                alignment: Alignment.center,
                // margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(5),
                  border: Border.all(),
                  // color: Colors.amber,
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.circle,
                        color: Colors.amber,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        '${category_list[index]}',
                        style: const TextStyle(),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
