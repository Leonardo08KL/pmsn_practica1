import 'package:flutter/material.dart';

class ImageManga {
  ImageManga(
    this.image,
    this.color,
  );
  final String image;
  final Color color;
}

class Manga {
  Manga(
    this.name,
    this.category,
    this.price,
    this.punctuation,
    this.listImage,
  );
  final String name;
  final String category;
  final String price;
  final int punctuation;
  final List<ImageManga> listImage;
}
