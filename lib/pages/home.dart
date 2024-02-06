import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tutorial/models/category_models.dart';
import 'package:flutter_tutorial/models/_recomended_books.dart';
import 'package:flutter_tutorial/models/_sponsored_books.dart';
import 'package:flutter_tutorial/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<CategoryModels> categories = [];
  List<RecomendedBooks> books = [];
  List<Sponsored> sponsored = [];

  void _getCategories() {
    categories = CategoryModels.getCategories();
  }

  void _getBooks() {
    books = RecomendedBooks.getRecomendedBooks();
  }

  void _getSponsored() {
    sponsored = Sponsored.getSponsored();
  }

  @override
  Widget build(BuildContext context) {
    _getCategories();
    _getBooks();
    _getSponsored();

    return Scaffold(
        drawer: _drawer(context),
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: appBar(context),
        body: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            searchField(context),
            SizedBox(
              height: 30,
            ),
            _hotSellers(context),
            SizedBox(
              height: 30,
            ),
            _personalRecommendations(context),
            SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text(
                    'Sponsored',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    height: 600,
                    child: ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                    sponsored[index].backgroundImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      sponsored[index].name,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(sponsored[index].author,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontStyle: FontStyle.italic)),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Colors.black,
                                        Colors.transparent,
                                      ])),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              height: 15,
                            ),
                        itemCount: sponsored.length),
                  ),
                )
              ],
            )
          ],
        ));
  }

  Container _drawer(BuildContext context) {
    return Container(
      width: 200,
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                  child: Icon(
                Icons.person,
                color: Theme.of(context).colorScheme.onSurface,
                size: 64,
              )),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/user-profile');
                },
                child: ListTile(
                  title: Text(
                    "P R O F I L E",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 16),
                  ),
                  leading: Icon(
                    Icons.person_2,
                    color: Theme.of(context).colorScheme.onSurface,
                    size: 16,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme();
                },
                child: ListTile(
                  title: Text(
                    "T H E M E",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 16),
                  ),
                  leading: Icon(
                    Icons.brightness_4,
                    color: Theme.of(context).colorScheme.onSurface,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/sign-in');
              },
              child: ListTile(
                title: Text(
                  "L O G O U T",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 16),
                ),
                leading: Icon(
                  Icons.exit_to_app,
                  color: Theme.of(context).colorScheme.onSurface,
                  size: 16,
                ),
              ),
            ),
          ),
          //svg of user icon
          //dark theme / light theme
          //logout button
        ],
      ),
    );
  }

  Column _personalRecommendations(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            'Personal\nRecommendations',
            style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
            height: 200,
            child: ListView.separated(
              itemBuilder: (context, index) {
                // return Text("List view");
                return Container(
                  height: 200,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          fit: BoxFit.scaleDown,
                          image: NetworkImage(books[index].backgroundImage))),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black])),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            books[index].name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            books[index].author + " | " + books[index].genre,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.italic),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                width: 20,
              ),
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 20, right: 20),
              itemCount: books.length,
            ))
      ],
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      // leading: GestureDetector(
      //   onTap: () {
      //     Navigator.pop(context);
      //   },
      //   child: Container(
      //     margin: EdgeInsets.all(10),
      //     alignment: Alignment.center,
      //     decoration: BoxDecoration(
      //       color: Color(0xffF7F8F8),
      //       borderRadius: BorderRadius.circular(12),
      //     ),
      //     child: SvgPicture.asset(
      //       'icons/back-button-svgrepo-com.svg',
      //       height: 20,
      //       width: 20,
      //     ),
      //   ),
      // ),
      title: Text(
        'Books',
        style: TextStyle(
          color: Theme.of(context).colorScheme.onBackground,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      // actions: [
      //   GestureDetector(
      //     onTap: () {},
      //     child: Container(
      //       margin: EdgeInsets.all(10),
      //       alignment: Alignment.center,
      //       decoration: BoxDecoration(
      //         color: Color(0xffF7F8F8),
      //         borderRadius: BorderRadius.circular(12),
      //       ),
      //       child: SvgPicture.asset(
      //         'icons/three-dots-svgrepo-com.svg', //replace with the dark theme icon
      //         height: 20,
      //         width: 20,
      //       ),
      //     ),
      //   )
      // ],
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }

  Column _hotSellers(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            'Hot sellers',
            style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          height: 150,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => SizedBox(
              width: 20,
            ),
            itemBuilder: (context, index) {
              return Container(
                width: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(categories[index].backgroundImage),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Text(
                          categories[index].name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              categories[index].author,
                              style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w100,
                                fontSize: 10,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            if (!categories[index].availability)
                              Container(
                                padding: EdgeInsets.only(top: 5.0, left: 2.0),
                                height: 15,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Colors.red[400],
                                    borderRadius: BorderRadius.circular(9)),
                                child: Text(
                                  "Out of Stock",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                      fontSize: 6),
                                ),
                              )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Container searchField(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0)
      ]),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).colorScheme.surface,
            contentPadding: EdgeInsets.all(10),
            hintText: 'Search Books',
            prefixIcon: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            suffixIcon: Container(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  VerticalDivider(
                    indent: 10,
                    endIndent: 10,
                    color: Theme.of(context).colorScheme.onSurface,
                    thickness: 0.9,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.filter_list,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }
}
