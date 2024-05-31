import 'package:dotple/constants/constants.dart';
import 'package:dotple/constants/variable.dart';
import 'package:dotple/model/category_model.dart';
import 'package:dotple/provider/category_provider.dart';
import 'package:dotple/screens/category/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:provider/provider.dart';

class CategoryAdd extends StatefulWidget {
  const CategoryAdd({super.key});

  @override
  State<CategoryAdd> createState() => _CategoryAddState();
}

class _CategoryAddState extends State<CategoryAdd> {
  ColorSwatch? _tempMainColor;
  // Color? _tempShadeColor;
  ColorSwatch? _mainColor = Colors.red;
  // final Color? _shadeColor = Colors.blue[800];
  // List<Category> _categories = categoryList;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();
  }

  void _openDialog(String title, Widget content) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(title),
          content: content,
          actions: [
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: const Text("취소"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _mainColor = _tempMainColor;
                });
              },
              child: const Text("확인"),
            ),
          ],
        );
      },
    );
  }

  // void _openColorPicker() async {
  //   _openDialog(
  //     "카테고리 색상 선택",
  //     MaterialColorPicker(
  //       selectedColor: _shadeColor,
  //       onColorChange: (color) => setState(() {
  //         _tempShadeColor = color;
  //       }),
  //       onMainColorChange: (color) => setState(() {
  //         _tempMainColor = color;
  //       }),
  //       onBack: () {},
  //     ),
  //   );
  // }

  void _openMainColorPicker() async {
    _openDialog(
        "Main Color picker",
        MaterialColorPicker(
          selectedColor: _mainColor,
          allowShades: false,
          onMainColorChange: (color) => setState(() {
            _tempMainColor = color;
            category_color = color!;
          }),
        ));
  }

  late TextEditingController _controller;

  String? _category_name;
  ColorSwatch? category_color = Colors.red;
  // ColorSwatch? category_color = _mainColor;
  void _checkInputValue() {
    String? inputValue = _controller.text.trim();
    if (inputValue.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('값을 입력해주세요.'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      setState(() {
        _category_name = inputValue;
        context.read<CategoryProvider>().addCategory(
              _category_name!,
              category_color!,
            );
      });
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Category> categoryList =
        context.watch<CategoryProvider>().categoryList;

    return Scaffold(
      appBar: AppBar(
        title: const Text("카테고리 추가/수정"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.05, horizontal: screenWidth * 0.05),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // category name
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("카테고리 이름"),
                SizedBox(
                  width: screenWidth * 0.9,
                  child: TextFormField(
                    controller: _controller,
                    // onChanged: (value) {
                    //   setState(() {
                    //     _category_name = value;
                    //   });
                    // },
                  ),
                ),
              ],
            ), // end of category name
            // color picker
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("색상"),
                IconButton(
                  onPressed: _openMainColorPicker,
                  icon: Icon(
                    Icons.circle,
                    color: _mainColor,
                  ),
                ),
              ],
            ), // end of color picker
            TextButton(
                onPressed: () {
                  _checkInputValue();
                },
                child: const Text("확인"))
          ],
        ),
      ),
    );
  }
}
