import 'package:dotple/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GroupInput extends StatelessWidget {
  String title;
  double boxHegith;
  int textfieldHeight;
  final String? Function(String?)? validator;
  Function(String?) onchanged;
  // GlobalKey<FormState> formKey;

  GroupInput({
    super.key,
    required this.title,
    required this.validator,
    required this.boxHegith,
    required this.textfieldHeight,
    required this.onchanged,
    // required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: boxHegith,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 234, 231, 231),
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // start of title
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(title),
          ),
          // end of title

          // start of textfield
          SizedBox(
            // height: textfieldHeight,
            child: TextFormField(
              decoration: InputDecoration(
                isDense: true,
                // border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                border: InputBorder.none,
                // InputDecoration(
                //     contentPadding: EdgeInsets.only(
                //   bottom: 10,
                // ))),
              ),
              validator: validator,
              // (value) {
              //   if (value == null || value.isEmpty) {
              //     return "값을 입력해주세요.";
              //   }
              //   return null;
              // },
              maxLines: textfieldHeight,
              onChanged: onchanged,
            ),
          ),
          // end of textfield
        ],
      ),
    );
  }
}

class GroupInputFrame extends StatelessWidget {
  String title, hint;
  double boxHegith;
  int textfieldHeight;
  // final String? Function(String?)? validator;
  // Function(String?) onchanged;
  // GlobalKey<FormState> formKey;

  GroupInputFrame({
    super.key,
    required this.title,
    required this.hint,
    // required this.validator,
    required this.boxHegith,
    required this.textfieldHeight,
    // required this.onchanged,
    // required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: boxHegith,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 234, 231, 231),
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // start of title
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(title),
          ),
          // end of title

          // start of textfield
          SizedBox(
            // height: textfieldHeight,
            child: TextFormField(
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Colors.white,

                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                border: InputBorder.none,
                hintText: hint,

                // InputDecoration(
                //     contentPadding: EdgeInsets.only(
                //   bottom: 10,
                // ))),
              ),
              // validator: validator,
              // (value) {
              //   if (value == null || value.isEmpty) {
              //     return "값을 입력해주세요.";
              //   }
              //   return null;
              // },
              maxLines: textfieldHeight,
              // onChanged: onchanged,
            ),
          ),
          // end of textfield
        ],
      ),
    );
  }
}
