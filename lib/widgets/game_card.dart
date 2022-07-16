import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:game/support/colors.dart';
import 'package:game/support/images.dart';
import 'package:get/get.dart';


class GameCard extends StatelessWidget {
  var value;
  String imag;
   GameCard(this.value,  this.imag, {Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 50,
      shadowColor: MyColors.black,
      color: MyColors.lightGray,
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image:  DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(imag),
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),

          Text(value.title,style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Text("Platform: "+value.platform),
          SizedBox(height: 10,),

          Text("Genre: "+value.genre),
          SizedBox(height: 10,),
          if(value.editorsChoice =="Y")
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image:  DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(MyImages.editor),
              ),
            ),
          ),

          SizedBox(height: 10,),

          RatingBar.builder(
            initialRating: value.score/2,
            minRating: 1,
            ignoreGestures: true,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 20,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          )
        ],
      ),
    );
  }


}
