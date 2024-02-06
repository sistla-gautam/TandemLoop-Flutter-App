import 'package:flutter/material.dart';

class CategoryModels {
  String name;
  String author;
  Color backgroundColor;
  String backgroundImage;
  bool availability;

  CategoryModels({
    required this.name,
    required this.author,
    required this.backgroundColor,
    required this.backgroundImage,
    required this.availability,
  });

  static List<CategoryModels> getCategories() {
    List<CategoryModels> categories = [];

    categories.add(CategoryModels(
        name: "book1",
        availability: true,
        author: "author1",
        backgroundImage: 'https://picsum.photos/201',
        backgroundColor: Color(0xff1D1D1D)));

    categories.add(CategoryModels(
        name: "book2",
        author: "author2",
        availability: false,
        backgroundImage: 'https://picsum.photos/202',
        backgroundColor: Color(0xff1D1D1D)));

    categories.add(CategoryModels(
        name: "book3",
        author: "author3",
        availability: true,
        backgroundImage: 'https://picsum.photos/203',
        backgroundColor: Color(0xff1D1D1D)));

    categories.add(CategoryModels(
        name: "book4",
        author: "author4",
        availability: true,
        backgroundImage: 'https://picsum.photos/204',
        backgroundColor: Color(0xff1D1D1D)));

    categories.add(CategoryModels(
        name: "book5",
        author: "author5",
        availability: true,
        backgroundImage: 'https://picsum.photos/205',
        backgroundColor: Color(0xff1D1D1D)));

    return categories;
  }
}
