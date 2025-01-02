
// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:social_app/shared_in_app/custom_widgets/vhSpace.dart';


Widget buildArticleItem(context, var list) =>
// InkWell(
//       // onTap: () {
//       //   navigateTo(context, WebViewScreen(list['url']));
//       // },
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 120.0,
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('${list['urlToImage']}'),
                ),
              ),
            ),
            HSpace(),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${list['title']}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  VSpace(),
                  Text(
                    '${list['publishedAt']}',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
