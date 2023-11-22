import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:odev6/app/data/constants/color_constants.dart';
import 'package:odev6/app/data/constants/images_constants.dart';
import 'package:odev6/app/data/constants/text_constants.dart';
import 'package:odev6/app/data/entity/news_model.dart';

import 'news_detail.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final images = [
    ImageConst.l1,
    ImageConst.l2,
    ImageConst.l3,
    ImageConst.l4,
  ];

  Future<List<NewsModel>> news() async {
    final newsList = <NewsModel>[];
    final n1 = NewsModel(
      image: ImageConst.n1,
      title: TextConst.n1title,
      description: TextConst.n1description,
    );
    final n2 = NewsModel(
      image: ImageConst.n2,
      title: TextConst.n2title,
      description: TextConst.n2description,
    );
    final n3 = NewsModel(
      image: ImageConst.n3,
      title: TextConst.n3title,
      description: TextConst.n3description,
    );
    newsList.add(n1);
    newsList.add(n2);
    newsList.add(n3);
    return newsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        leading: const Icon(
          Icons.search,
          color: ColorConst.logoColor,
        ),
        title: Image.asset(ImageConst.logo, height: 55),
        backgroundColor: ColorConst.appbarColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return CarouselSlider.builder(
                    itemCount: images.length,
                    itemBuilder: (context, index, realIndex) {
                      final urlImages = images[index];
                      return buildImage(urlImages, index);
                    },
                    options: CarouselOptions(
                      height: 230,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                      //enlargeStrategy: CenterPageEnlargeStrategy.height,
                      //enlargeCenterPage: true,
                    ));
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 230,
              child: FutureBuilder<List<NewsModel>>(
                future: news(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final newsList = snapshot.data!;
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: newsList.length,
                      itemBuilder: (context, index) {
                        final news = newsList[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewsDetail(news: news),
                              ),
                            );
                          },
                          child: Card(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.all(6),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            padding: const EdgeInsets.all(1),
                                            color: ColorConst.titleContainerColor,
                                            child: Text(
                                              news.title,
                                              style: const TextStyle(color: ColorConst.logoColor),
                                            )),
                                        const SizedBox(height: 5),
                                        Text(
                                          news.description,
                                          maxLines: 5,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset(
                                    news.image,
                                    height: 90,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
        //margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 50),
        color: Colors.grey,
        child: Image.asset(
          urlImage,
          fit: BoxFit.cover,
        ),
      );
}
