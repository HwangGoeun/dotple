import 'package:dotple/constants/variable.dart';
import 'package:dotple/model/category_model.dart';
import 'package:dotple/provider/category_provider.dart';
import 'package:dotple/screens/category/category_add.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  // List<Category> categories = [];
  bool delete = false;
  bool isChecked = false;
  bool reorderStarted = false;
  int? reorderItemIndex;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Category> categoryList =
        context.watch<CategoryProvider>().categoryList;

    return Scaffold(
      appBar: AppBar(
        title: const Text("카테고리 관리"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (delete) {
                    int i;
                    for (i = 0; i < categoryList.length; i++) {
                      if (categoryList[i].checked == true) {
                        context
                            .read<CategoryProvider>()
                            .deleteCategory(categoryList[i].name);
                      }
                    }
                  }
                  delete = !delete;
                });
              },
              child: delete ? const Text("확인") : const Text("삭제"),
            ),
          )
        ],
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            for (int index = 0; index < categoryList.length; index++)
              delete
                  ?
                  // start of category delete
                  ListTile(
                      key: Key('$index'),
                      leading: Icon(
                        Icons.circle,
                        color: categoryList[index].color,
                      ),
                      title: Text(categoryList[index].name),
                      trailing: Checkbox(
                        value: categoryList[index].checked,
                        onChanged: (value) {
                          setState(() {
                            categoryList[index].checked = value!;
                            // if (categoryList[index].checked = value) {
                            //   context
                            //       .read<CategoryProvider>()
                            //       .addDeleteCategory(
                            //         categoryList[index].name,
                            //         categoryList[index].color!,
                            //       );
                            // }
                          });
                        },
                      ),
                    ) // end of category delete
                  :
                  // start of category list
                  ListTile(
                      key: Key('$index'),
                      leading: Icon(
                        Icons.circle,
                        color: categoryList[index].color,
                      ),
                      title: Text(categoryList[index].name),
                      trailing: GestureDetector(
                        onTap: () {
                          setState(() {
                            reorderStarted = true;
                            reorderItemIndex = index;
                          });
                        },
                        child: const Icon(Icons.drag_handle),
                      ),
                    ), // end of category list
            if (!delete)
              ListTile(
                key: const Key('add_button'),
                title: const Text('추가하기'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CategoryAdd(),
                    ),
                  );
                },
              ),
          ],
          // onReorder: (int oldIndex, newIndex) {
          //   setState(() {
          //     if (oldIndex < newIndex) {
          //       newIndex -= 1;
          //     }
          //     final Category item = categoryList.removeAt(oldIndex);
          //     categoryList.insert(newIndex, item);
          //     reorderStarted = false;
          //   });
          // },
        ),
      ),
    );
  }
}
