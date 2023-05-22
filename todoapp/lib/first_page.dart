// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'image_class.dart';
import 'login_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    // ignore: prefer_const_constructors, duplicate_ignore
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // ignore: prefer_const_constructors
      home: First(),
    );
  }
}

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body:
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Center(
                child: Text(
                  "Lets Begin!",
                  style: GoogleFonts.fredoka(
                      fontSize: 50,
                      fontWeight: FontWeight.normal,
                      color: Colors.black87),
                ),
              ),
            ),
            AspectRatio(
              aspectRatio: 0.90,
              child: PageView.builder(
                  itemCount: dataList.length,
                  // physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return carouselView(index);
                  }),
            ),
            SizedBox(height: 40,),

            //-----------------scroller-------------------------------------------
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: List.generate(
            //     3,
            //     (index) => Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: AnimatedContainer(
            //         duration: Duration(milliseconds: 100),
            //         width: index == currentPage ? 40 : 20,
            //         height: 20,
            //         decoration: BoxDecoration(
            //             color:
            //                 (index == currentPage) ? Colors.black : Colors.grey,
            //             borderRadius: BorderRadius.circular(20)),
            //       ),
            //     ),
            //   ),
            // ),

            SizedBox(
              height: 20,
            ),

            //---------------------Get started------------------------
            InkWell(
              onTap: openLoginPage,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 70),
                decoration: BoxDecoration(color: Colors.white30,
                  boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade400,
                      offset: Offset(4, 8),
                      blurRadius: 8,
                      spreadRadius: 1),
                    BoxShadow(
                      color: Colors.grey.shade50,
                      blurRadius: 6,
                      offset: Offset(-3, -6),
                      spreadRadius: 1
                    )
                ], borderRadius: BorderRadius.circular(60),

                ),
                child: Text(
                  "Get Started!",
                  style: GoogleFonts.montserrat(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),

            //-------------login button-------------
            Text(
              "Login",
              style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
    );
  }

  //----------------creating crousel view--------------
  Widget carouselView(int index) {
    return carouselCard(dataList[index]);
  }

  Widget carouselCard(ImageModel img) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              // borderRadius: BorderRadius.circular(),
              image: DecorationImage(
                  image: AssetImage(
                    img.imageName,
                  ),
                  scale: 1),
              boxShadow: const [
                // BoxShadow(
                //     offset: Offset(0,0),
                //     blurRadius: 50,
                //     color: Colors.black26,
                //     spreadRadius: 10),
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Text(
            img.title,
            style: GoogleFonts.montserrat(
                color: Colors.black87,
                fontSize: 40,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            img.content,
            style: GoogleFonts.fredoka(
                color: Colors.grey, fontSize: 20, fontWeight: FontWeight.normal),
          ),
        ),
      ],
    );
  }

  // --------function to navigate to new page from inkwell-----------------------
  openLoginPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
