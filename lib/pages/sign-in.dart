import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tutorial/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class Sign_in extends StatelessWidget {
  const Sign_in({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:
            BoxDecoration(color: Theme.of(context).colorScheme.background),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..shader = LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Theme.of(context).colorScheme.primary,
                          Theme.of(context).colorScheme.secondary
                        ]).createShader(Rect.fromLTRB(
                        0, 0, 500, 80)), // Adjust the rectangle size as needed
                ),
              ),
            ),
            Container(
                height: 300,
                width: 500,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5), // Shadow color
                        spreadRadius: 5, // Spread radius
                        blurRadius: 500, // Blur radius
                        offset: Offset(0, 3), // Offset
                      ),
                    ],
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Theme.of(context).colorScheme.background,
                          Theme.of(context).colorScheme.background,
                        ]),
                    // color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.all(4.0),
                    //       child: Text(
                    //         "Username",
                    //         style: TextStyle(
                    //           color: Colors.black,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                          decoration: InputDecoration(
                              hintText: "Username",
                              hintStyle: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: 14,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface),
                                  borderRadius: BorderRadius.circular(10)),
                              fillColor: Theme.of(context).colorScheme.surface,
                              filled: true)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.all(4.0),
                    //       child: Text("Password"),
                    //     ),
                    //   ],
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: 14,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface),
                                  borderRadius: BorderRadius.circular(10)),
                              fillColor: Theme.of(context).colorScheme.surface,
                              filled: true)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        //push  homepage to router here
                        Navigator.pushNamed(context, '/homepage');
                      },
                      child: Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "Sign - in",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    )

                    //Sign in
                    //username - text
                    //username - input
                    //password - text
                    //password - input
                  ],
                )),
          ],
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xffF7F8F8),
            borderRadius: BorderRadius.circular(12),
          ),
          child: SvgPicture.asset(
            'icons/back-button-svgrepo-com.svg',
            height: 20,
            width: 20,
          ),
        ),
      ),
      title: Text(
        'Sign-in',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xffF7F8F8),
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset(
              'icons/three-dots-svgrepo-com.svg', //replace with the dark theme icon
              height: 20,
              width: 20,
            ),
          ),
        )
      ],
      backgroundColor: Colors.white,
    );
  }
}
