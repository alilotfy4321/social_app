import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

Widget CustomConditionButton(isClicked,count) => Center(
      child: Container(
        height: 40,
        width: 100,
        color: Colors.teal,
        child: ConditionalBuilder(
          condition: isClicked == true && count > 0,
          builder: (context) => Row(children: [
            Expanded(
                child: TextButton(
                    onPressed: () {
                      // setState(() {
                      //   count--;
                      // });
                    },
                    child: Text('-'))),
            Expanded(
                child: TextButton(onPressed: () {}, child: Text('$count'))),
            Expanded(
                child: TextButton(
                    onPressed: () {
                    //   setState(() {
                    //     count++;
                    //   });
                     },
                    child: Text('+'))),
          ]),
          fallback: (context) => TextButton(
              onPressed: () {
                // setState(() {
                //   isClicked = !isClicked;
                //   print(isClicked);
                // });
              },
              child: Text('+')),
        ),
      ),
    );
