import 'package:flutter/material.dart';
import 'package:pmsn_practica1/models/dart.dart';
import 'package:pmsn_practica1/pages/details_manga.dart';
import 'package:pmsn_practica1/widgets/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController(viewportFraction: 0.75);

  double _currentPage = 0.0;
  double indexPage = 0.0;

  void _listener() {
    setState(() {
      _currentPage = _pageController.page!;
      if (_currentPage >= 0 && _currentPage < 0.7) {
        indexPage = 0;
      } else if (_currentPage > 0.7 && _currentPage < 1.7) {
        indexPage = 1;
      } else if (_currentPage > 1.7 && _currentPage < 2.7) {
        indexPage = 2;
      } else if (_currentPage > 2.7 && _currentPage < 3.7) {
        indexPage = 3;
      } else if (_currentPage > 3.7 && _currentPage < 4.7) {
        indexPage = 4;
      }
    });
  }

  // Color getColor() {
  //   late final Color color;
  //   if (_currentPage >= 0 && _currentPage < 0.7) {
  //     color = listManga[0].listImage[0].color;
  //   } else if (_currentPage > 0.7 && _currentPage < 1.7) {
  //     color = listManga[1].listImage[0].color;
  //   } else if (_currentPage > 1.7 && _currentPage < 2.7) {
  //     color = listManga[2].listImage[0].color;
  //   }

  //   return color;
  // }

  @override
  void initState() {
    _pageController.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppBar(),
            SizedBox(
              height: 50,
              // child: Padding(
              //   padding: const EdgeInsets.only(left: 16.0),
              //   child: Row(
              //     children: List.generate(
              //       listCategory.length,
              //       (index) => Padding(
              //         padding: const EdgeInsets.only(right: 12.0),
              //         child: Text(
              //           listCategory[index],
              //           style: TextStyle(
              //             fontWeight: FontWeight.w800,
              //             fontSize: 20,
              //             // color: index == 0
              //             //     ? getColor()
              //             //     : const Color.fromARGB(255, 0, 0, 0),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ),
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: listManga.length,
                controller: _pageController,
                itemBuilder: (context, index) {
                  final manga = listManga[index];
                  final listTitle = manga.category.split(' ');
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (context, animation, _) {
                            return DetailsMangaPage(manga: manga);
                          },
                        ),
                      );
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.only(right: index == indexPage ? 30 : 60),
                      child: Transform.translate(
                        offset: Offset(index == indexPage ? 0 : 20, 0),
                        child: LayoutBuilder(builder: (context, constraints) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            margin: EdgeInsets.only(
                              top: index == indexPage ? 1.0 : 50,
                              bottom: 100,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(36),
                              color: Colors.black,
                            ),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                    vertical: 40,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        manga.category,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        manga.name,
                                        style: const TextStyle(
                                          fontSize: 28,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        manga.price,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                      // const SizedBox(height: 4),
                                      // FittedBox(
                                      //   child: Text(
                                      //     '${listTitle[0]} ', // \n${listTitle[0]}
                                      //     style: const TextStyle(
                                      //       color: Colors.white,
                                      //       fontWeight: FontWeight.bold,
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: constraints.maxHeight * 0.3,
                                  left: constraints.maxWidth * 0.0,
                                  right: -constraints.maxWidth * 0.0,
                                  bottom: constraints.maxHeight * 0.1,
                                  child: Hero(
                                    tag: manga.name,
                                    child: Image(
                                      image: AssetImage(
                                        manga.listImage[0].image,
                                      ),
                                    ),
                                  ),
                                ),
                                // Positioned(
                                //   bottom: 0,
                                //   right: 0,
                                //   child: Material(
                                //     color: manga.listImage[0].color,
                                //     borderRadius: const BorderRadius.only(
                                //       topLeft: Radius.circular(36),
                                //       bottomRight: Radius.circular(36),
                                //     ),
                                //     clipBehavior: Clip.antiAliasWithSaveLayer,
                                //     child: InkWell(
                                //       onTap: () {},
                                //       child: const SizedBox(
                                //         height: 100,
                                //         width: 100,
                                //         child: Icon(
                                //           Icons.add,
                                //           size: 40,
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // )
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Container(
            //   height: 120,
            //   padding: const EdgeInsets.all(20),
            //   child: CustomBottomBar(color: getColor()),
            // )
          ],
        ),
      ),
    );
  }
}
