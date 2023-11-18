import 'package:flutter/material.dart';
import 'package:odev6/app/data/entity/news_model.dart';

import '../../data/constants/color_constants.dart';
import '../../data/constants/images_constants.dart';

class NewsDetail extends StatefulWidget {
  final NewsModel news;

  const NewsDetail({
    Key? key,
    required this.news,
  }) : super(key: key);

  @override
  State<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.search,
          color: ColorConst.logoColor,
        ),
        title: Image.asset(ImageConst.logo, height: 55),
        backgroundColor: ColorConst.appbarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.news.description,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              widget.news.title,
              style: const TextStyle(color: ColorConst.titleContainerColor, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Image.asset(
              widget.news.image,
              fit: BoxFit.cover,
              height: 220,
              // Ensure the image takes up the full width
            ),
          ],
        ),
      ),
    );
  }
}
