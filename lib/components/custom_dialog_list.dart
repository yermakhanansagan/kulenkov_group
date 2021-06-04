import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kulenkov_group/constants/colors.dart';

import 'action_button.dart';
// для диалога с предложениями от магазина
// посмотрел и понял что нужно передавать именно модель
class Shop {
  final String shopName;
  final double shopRating;
  final int reviewQuantity; // количество отзывов
  final List<Detail> offerDetails; // товары которые в предложений

  Shop(this.shopName, this.shopRating, this.reviewQuantity,
      this.offerDetails);
}
// создал 2 временные модели
class Detail {
  final String detailName;
  final String detailDescription;
  final int price;

  Detail(this.detailName, this.detailDescription, this.price);
}

class CustomDialogList extends StatefulWidget {
  final Shop shop;

  const CustomDialogList({Key key, this.shop}) : super(key: key);

  @override
  _CustomDialogListState createState() => _CustomDialogListState();
}

class _CustomDialogListState extends State<CustomDialogList> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: (BorderRadius.circular(6)),
              color: Color(white),
            ),
            padding: EdgeInsets.only(top: 30, bottom: 20, left: 12, right: 12),
            child: Column(
              children: [
                Text(
                  widget.shop.shopName,
                  textAlign: TextAlign.center,
                ),
                Row( // парт со звездочками
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RatingBar( // https://pub.dev/packages/flutter_rating_bar

                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      initialRating: widget.shop.shopRating,
                      itemCount: 5,
                      itemSize: 12,
                      itemPadding: EdgeInsets.symmetric(horizontal: 2.5),
                      ignoreGestures: true,
                      ratingWidget: RatingWidget(
                        empty: Image.asset("assets/Vector-2.png"),
                        half: Image.asset("assets/Vector-1.png"),
                        full: Image.asset("assets/Vector.png"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 7.5),
                      child: Text("(${widget.shop.reviewQuantity})"),
                    ),
                  ],
                ),
                Container(  // кнопка написать
                  margin: EdgeInsets.symmetric(vertical: 16),
                  height: 36,
                  width: 304,
                  child: ActionButton(
                    labelText: "Write",
                    color: green,
                  ),
                ),
                Container(
                  child: Text(widget.shop.offerDetails.length.toString() + " offers:"),
                ),
                ListView.builder( // детали которые в предложений
                  shrinkWrap: true,
                  itemCount: widget.shop.offerDetails.length,
                  itemBuilder: (context, index) {
                    final detailItem = widget.shop.offerDetails[index];
                    return Column(
                      children: [
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(detailItem.detailName),
                            ),
                            Text(detailItem.price.toString() + " T")
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                          child: Align(
                            child: Text(
                              detailItem.detailDescription,
                            ),
                          ),
                        ),
                        Container(
                          height: 36,
                          width: 304,
                          child: ActionButton(
                            labelText: "Choose",
                            isGradient: true,
                            gradientColor1: first_color,
                            gradientColor2: second_color,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
