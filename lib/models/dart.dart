import 'package:flutter/material.dart';
import 'package:pmsn_practica1/models/manga.dart';

final listCategory = ['Shonen', 'Seinen', 'Shojo', '', ''];

final listManga = [
  Manga('Berserk Manga', 'Seinen', '\$120.0', 5, [
    ImageManga(
      'assets/berserk/berserk1.jpg',
      Colors.black,
    ),
    ImageManga(
      'assets/berserk/berserk2.jpg',
      Colors.black,
    ),
    ImageManga(
      'assets/berserk/berserk3.jpg',
      Colors.black,
    ),
    ImageManga(
      'assets/berserk/berserk4.jpg',
      Colors.black,
    ),
    ImageManga(
      'assets/berserk/berserk5.jpg',
      Colors.black,
    ),
  ]),
  Manga('Naruto Manga', 'Manga', '\$120.0', 5, [
    ImageManga(
      'assets/naruto/naruto1.jpg',
      Colors.black,
    ),
    ImageManga(
      'assets/naruto/naruto2.jpg',
      Colors.black,
    ),
    ImageManga(
      'assets/naruto/naruto3.jpg',
      Colors.black,
    ),
    ImageManga(
      'assets/naruto/naruto4.jpg',
      Colors.black,
    ),
    ImageManga(
      'assets/naruto/naruto5.jpg',
      Colors.black,
    ),
  ]),
  Manga('Vinland Saga Manga', 'Manga', '\$120.0', 5, [
    ImageManga(
      'assets/vinlandsaga/vs1.jpg',
      const Color.fromRGBO(45, 50, 78, 1.0),
    ),
    ImageManga(
      'assets/vinlandsaga/vs2.jpg',
      const Color.fromRGBO(102, 139, 174, 1.0),
    ),
    ImageManga(
      'assets/vinlandsaga/vs3.jpg',
      const Color.fromRGBO(224, 149, 99, 1.0),
    ),
    ImageManga(
      'assets/vinlandsaga/vs4.jpg',
      const Color.fromRGBO(178, 205, 221, 1.0),
    ),
    ImageManga(
      'assets/vinlandsaga/vs5.jpg',
      const Color.fromRGBO(56, 57, 78, 1.0),
    ),
  ]),
  Manga('Chainsaw Man Manga', 'Manga', '\$120.0', 5, [
    ImageManga(
      'assets/chainsawman/chainsawman1.jpg',
      const Color.fromRGBO(232, 86, 39, 1.0),
    ),
    ImageManga(
      'assets/chainsawman/chainsawman2.jpg',
      const Color.fromRGBO(147, 210, 189, 1.0),
    ),
    ImageManga(
      'assets/chainsawman/chainsawman3.png',
      const Color.fromRGBO(114, 191, 127, 1.0),
    ),
    ImageManga(
      'assets/chainsawman/chainsawman4.png',
      const Color.fromRGBO(3, 145, 170, 1.0),
    ),
    ImageManga(
      'assets/chainsawman/chainsawman5.jpg',
      const Color.fromRGBO(253, 248, 180, 1.0),
    ),
  ]),
  Manga('Bleach Manga', 'Manga', '\$120.0', 5, [
    ImageManga(
      'assets/bleach/bleach1.jpg',
      Colors.black,
    ),
    ImageManga(
      'assets/bleach/bleach2.jpg',
      Colors.black,
    ),
    ImageManga(
      'assets/bleach/bleach3.jpg',
      Colors.black,
    ),
    ImageManga(
      'assets/bleach/bleach4.jpg',
      Colors.black,
    ),
    ImageManga(
      'assets/bleach/bleach5.jpg',
      Colors.black,
    ),
  ]),
];
