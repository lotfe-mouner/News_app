import 'package:app/web_view/web_view.dart';
import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

Widget articleScreenBuilder(list, context,[isSearching = false]) => ConditionalBuilder(
    condition: list.isNotEmpty,
    builder: (_) {
      return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) => buildArticleItem(list[index], context),
        itemCount: 10,
        separatorBuilder: (context, index) => MyDivider(),
      );
    },
    fallback: (context) =>isSearching? Container()  : const Center(child: CircularProgressIndicator()));



Widget buildArticleItem(dynamic article, context) {
  var imageUrl = article['urlToImage'] ??
      'https://flyclipart.com/thumb2/loading-934434.png';
  return InkWell(
    onTap: () => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebViewScreen(
          url: article['url'],
        ),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 20.0),
          Expanded(
            child: SizedBox(
              height: 120.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      article['title'],
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: const TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget MyDivider() => const Padding(padding: EdgeInsets.all(15.0));
