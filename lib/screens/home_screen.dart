import "package:deals_dray/constants.dart";
import "package:deals_dray/widgets/rounded_icon.dart";
import "package:flutter/material.dart";
import 'package:carousel_slider/carousel_slider.dart';
import "../widgets/app_bar_container.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80.0), // Default AppBar height
        child: AppBarContainer(),
      ),
      floatingActionButton: TextButton(
        style: kChatButtonStyle,
        onPressed: () {},
        child: const SizedBox(
          height: 30,
          width: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Icon(Icons.message), Text("Chat")],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              items: imgList
                  .map(
                    (item) => SizedBox(
                      child: Center(
                        child:
                            Image.network(item, fit: BoxFit.cover, width: 1000),
                      ),
                    ),
                  )
                  .toList(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.lightBlueAccent,
                        Colors.lightBlue,
                        Colors.blueAccent
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "KYC Pending",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    const Text(
                      "You need to provide the required\n documents for your account activation.",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        "Click Here",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                  4,
                  (index) => RoundedIcons(
                      iconName: iconNameList[index],
                      iconColor: iconColor[index],
                      icon: iconList[index])),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 380,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.lightBlue, Colors.lightBlue.shade200]),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "EXCLUSIVE FOR YOU",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_right_alt,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                width: 170,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.network(
                                      exclusiveOfferImageList[index],
                                      fit: BoxFit.fitWidth,
                                    ),
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "₹ 5000",
                                          style: TextStyle(color: Colors.green),
                                        ),
                                        Text("Vivo15 (iron,256GB)"),
                                      ],
                                    ),
                                  ],
                                )),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
