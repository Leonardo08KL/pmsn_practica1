import 'package:flutter/material.dart';
import 'package:pmsn_practica1/models/manga.dart';
import 'package:pmsn_practica1/widgets/custom_button.dart';
import 'package:pmsn_practica1/widgets/transition.dart';

class DetailsMangaPage extends StatefulWidget {
  const DetailsMangaPage({super.key, required this.manga});

  final Manga manga;

  @override
  State<DetailsMangaPage> createState() => _DetailsMangaPageState();
}

class _DetailsMangaPageState extends State<DetailsMangaPage> {
  int valueIndexColor = 0;
  int valueIndexSize = 0;

  double sizeManga(int index, Size size) {
    switch (index) {
      // case 0:
      //   return (size.height * 0.09);
      // // case 1:
      // //   return (size.height * 0.07);
      // // case 2:
      // //   return (size.height * 0.05);
      // // case 3:
      // //   return (size.height * 0.04);
      default:
        return (size.height * 0.04);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Theme(
      data: ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
            title: Positioned(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FittedBox(
              child: Text(
                widget.manga.category,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
          ),
        )),
        body: Stack(
          children: [
            Positioned(
              top: -size.height * 0.15,
              right: -size.height * 0.20,
              child: TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 250),
                  tween: Tween(begin: 0, end: 1),
                  builder: (context, value, __) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      height: value * (size.height * 0.5),
                      width: value * (size.height * 100),
                      decoration: BoxDecoration(
                        color: widget.manga.listImage[valueIndexColor].color,
                        shape: BoxShape.rectangle,
                      ),
                    );
                  }),
            ),
            // Positioned(
            //   top: kToolbarHeight,
            //   left: 16,
            //   right: 16,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       CustomButton(
            //         onTap: () => Navigator.pop(context),
            //         child: const Icon(
            //           Icons.arrow_back_rounded,
            //           color: Colors.black,
            //         ),
            //       ),
            //       IconButton(
            //         onPressed: () {},
            //         icon: const Icon(Icons.favorite),
            //       )
            //     ],
            //   ),
            // ),
            // Positioned(
            //   // top: size.height * 0.05,
            //   right: 0,
            //   left: 0,
            //   child: Padding(
            //     padding: const EdgeInsets.all(10.0),
            //     child: FittedBox(
            //       child: Text(
            //         widget.manga.category,
            //         style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           color: const Color.fromARGB(255, 255, 255, 255),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 250),
              top: size.height * 0.05,
              right: sizeManga(valueIndexSize, size),
              left: sizeManga(valueIndexSize, size),
              child: Hero(
                tag: widget.manga.name,
                child: Image(
                  height: size.height * 0.5,
                  image: AssetImage(
                    widget.manga.listImage[valueIndexColor].image,
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.6,
              left: 16,
              right: 16,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: ShakeTransition(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.manga.category,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                widget.manga.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      ShakeTransition(
                        left: false,
                        child: Text(
                          widget.manga.price,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ShakeTransition(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        Row(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              color: widget.manga.punctuation > index
                                  ? widget
                                      .manga.listImage[valueIndexColor].color
                                  : Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'VOLUMEN',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: List.generate(
                            widget.manga.listImage.length,
                            (index) => GestureDetector(
                              onTap: () {
                                valueIndexColor = index;
                                setState(() {});
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 15),
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: index == valueIndexSize
                                        ? Colors.white
                                        : widget.manga
                                            .listImage[valueIndexColor].color,
                                  ),
                                ),
                                child: CustomButton(
                                  onTap: () {
                                    valueIndexSize = index;
                                    valueIndexColor = index;
                                    setState(() {});
                                  },
                                  color: index == valueIndexSize
                                      ? widget.manga.listImage[valueIndexColor]
                                          .color
                                      : Colors.white,
                                  child: Text(
                                    '${index + 1}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22,
                                      color: index == valueIndexSize
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // ShakeTransition(
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       const Text(
                      //         'COLOR',
                      //         style: TextStyle(
                      //           fontWeight: FontWeight.w600,
                      //           fontSize: 16,
                      //         ),
                      //       ),
                      //       const SizedBox(height: 8),
                      //       Row(
                      //         children: List.generate(
                      //           widget.manga.listImage.length,
                      //           (index) => GestureDetector(
                      //             onTap: () {
                      //               valueIndexColor = index;
                      //               setState(() {});
                      //             },
                      //             child: Container(
                      //               margin: const EdgeInsets.only(right: 8),
                      //               height: 30,
                      //               width: 30,
                      //               decoration: BoxDecoration(
                      //                 color:
                      //                     widget.manga.listImage[index].color,
                      //                 shape: BoxShape.circle,
                      //                 border: index == valueIndexColor
                      //                     ? Border.all(
                      //                         color: Colors.white, width: 2)
                      //                     : null,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      ShakeTransition(
                        left: false,
                        child: CustomButton(
                          onTap: () {},
                          width: 200,
                          color: widget.manga.listImage[valueIndexColor].color,
                          child: Container(
                            padding: EdgeInsets.all(
                                5), // Añade un espacio interno alrededor del texto
                            child: Text(
                              'BUY',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
