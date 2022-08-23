// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:real_estate/screens/Youtube.dart';
import 'package:flutter/material.dart';
import 'package:real_estate/customs/BorderIcon.dart';
import 'package:real_estate/customs/BorderBox.dart';
import 'package:real_estate/utils/constants.dart';
import 'package:real_estate/utils/widget_functions.dart';
import 'package:real_estate/utils/custom_functions.dart';
import 'package:real_estate/customs/OptionButton.dart';
import 'package:real_estate/utils/sample_data.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    final double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalSpace(padding),
                  Padding(
                    padding: sidePadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BorderBox(
                          height: 50,
                          width: 50,
                          child: Icon(Icons.menu, color: COLOR_BLACK),
                        ),
                        BorderBox(
                          height: 50,
                          width: 50,
                          child: Icon(Icons.settings, color: COLOR_BLACK),
                        )
                      ],
                    ),
                  ),
                  addVerticalSpace(padding),
                  Padding(
                    padding: sidePadding,
                    child: Text(
                      "city",
                      style: themeData.textTheme.bodyText2,
                    ),
                  ),
                  addVerticalSpace(10),
                  Padding(
                    padding: sidePadding,
                    child: Text("San Fransisco",
                        style: themeData.textTheme.headline1),
                  ),
                  Padding(
                      padding: sidePadding,
                      child: Divider(
                        height: padding,
                        color: COLOR_GREY,
                      )),
                  addVerticalSpace(10),
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children:
                          // [
                          //   ChoiceOption(text: "1hkjhkjhkjhkjhkhkj"),
                          //   ChoiceOption(text: "2"),
                          //   ChoiceOption(text: "3"),
                          //   ChoiceOption(text: "4"),
                          //   ChoiceOption(text: "5"),
                          //   ChoiceOption(text: "6"),
                          // ]
                          ["1", "2", "3", "4", "5", "6"]
                              .map((filter) => ChoiceOption(text: filter))
                              .toList(),
                    ),
                  ),
                  addVerticalSpace(10),
                  Expanded(
                    child: Padding(
                      padding: sidePadding,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: RE_DATA.length,
                        itemBuilder: (context, index) {
                          return RealEstateItem(itemData: RE_DATA[index]);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 20,
                width: size.width,
                child: Center(
                  child: OptionButton(
                    text: "Map View",
                    icon: Icons.map_rounded,
                    width: size.width * 0.35,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class ChoiceOption extends StatelessWidget {
//   final String text;
//   const ChoiceOption({Key key,@required this.text}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20.0),
//         color: COLOR_GREY.withAlpha(25),
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 13),
//       child: Text(text,style: themeData.textTheme.headline5,),
//     );
//   }
// }

class ChoiceOption extends StatelessWidget {
  final String text;

  const ChoiceOption({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: COLOR_GREY.withAlpha(25),
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      margin: const EdgeInsets.only(left: 20),
      child: Text(
        text,
        style: themeData.textTheme.headline5,
      ),
    );
  }
}

class RealEstateItem extends StatelessWidget {
  final dynamic itemData;

  const RealEstateItem({Key? key, this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Youtube(
              url:itemData["url"],
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image.asset(itemData["image"])),
                Positioned(
                  top: 15,
                  right: 35,
                  child: BorderIcon(
                    height: 0.5,
                    width: 0.5,
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Icon(
                      Icons.favorite_border,
                      color: COLOR_BLACK,
                    ),
                  ),
                ),
              ],
            ),
            addVerticalSpace(15),
            Row(
              children: [
                Text(
                  formatCurrency(itemData["amount"]),
                  style: themeData.textTheme.headline1,
                ),
                addHorizontalSpace(10),
                Text(
                  "${itemData["address"]}",
                  style: themeData.textTheme.bodyText2,
                )
              ],
            ),
            addVerticalSpace(10),
            Text(
              "${itemData["bedrooms"]} bedrooms / ${itemData["bathrooms"]} bathrooms / ${itemData["area"]} sqft",
              style: themeData.textTheme.headline5,
            )
          ],
        ),
      ),
    );
  }
}
