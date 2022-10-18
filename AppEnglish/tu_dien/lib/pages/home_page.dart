import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:tu_dien/models/english_today.dart';
import 'package:tu_dien/values/app_colors.dart';
import 'package:tu_dien/values/app_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
int _currenIndex = 0;
late PageController _pageController;
List<EnglishToday> words = [];
List<int> fixedListRandom({int len=1, int max=120, int min =1})
{
  if(len >max ||len < min){
    return [];
  }
  List<int> newList = [];
  Random random = Random();
  int count = 1;
  while(count <= len){
    int val = random.nextInt(max);
    if(newList.contains(val)){
      continue;
    }
    else{
      newList.add(val);
      count ++;
    }
  }
  return newList;
}

getEnglishToday(){
  List <String> newList=[];

  List <int>rans = fixedListRandom(len :5, max: nouns.length);
  rans.forEach((index) {
    newList.add(nouns[index]);
   });

   words= newList.map((e) => EnglishToday(noun: e,))
   .toList();
}


@override
  void initState() {
     _pageController=PageController(viewportFraction: 0.9);
    super.initState();
    getEnglishToday();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color.secondColor,
      appBar: AppBar(
        backgroundColor: color.secondColor,
        elevation: 0,
        title: Text(
          "English today",
          style: AppStyles.h4.copyWith(color: color.textColer),
        ),
        leading: InkWell(
          onTap: () {},
          // ignore: prefer_const_constructors
          child: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
    

        child: Column(children: [
          Container(
              height: size.height * 1 / 10,
            padding: const EdgeInsets.symmetric(horizontal: 24),
              alignment: Alignment.centerLeft,
              child: Text(
                'It is amazing how complete is the delusion that beaty is goodness."',
                style:
                    AppStyles.h5.copyWith(fontSize: 12, color: color.textColer),
              )),

            Container(
              height: size.height * 2/3,
            
              child: PageView.builder(
                controller:  _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currenIndex= index;
                  });
                  
                },
                itemCount: words.length,
                itemBuilder:( (context, index) {

             String firstLetter = words[index].noun != null ? words[index].noun!:''; 
             firstLetter= firstLetter.substring(0,1);
             String leftLetter = words[index].noun != null ? words[index].noun!:''; 
             leftLetter = leftLetter.substring(1,leftLetter.length);
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      // ignore: prefer_const_constructors
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: color.primaryColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26, offset: Offset(3,6),
                            blurRadius: 6
                          )
                        ]

                        , borderRadius: BorderRadius.all(Radius.circular(24))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
                            child: const Icon(Icons.heart_broken_rounded, color: Colors.white,size: 50,)),
                       RichText(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        text: TextSpan(
                        text: firstLetter,
                        style: TextStyle(fontFamily: FontFamily.sen,fontSize: 89,fontWeight: FontWeight.bold,
                        // ignore: prefer_const_literals_to_create_immutables
                        shadows:[
                          // ignore: prefer_const_constructors
                          BoxShadow(
                            color: Colors.black38,
                            offset: Offset(3,6),
                            blurRadius: 6
                          )
                        ]),
                        children: [
                          TextSpan(
                            text: leftLetter,
                             style: TextStyle(fontFamily: FontFamily.sen,fontSize: 56,fontWeight: FontWeight.bold,
                        ),
                          )
                        ]
                       )),
                       Padding(
                         padding: const EdgeInsets.only( top : 24),
                         child: Text('"Think of all the beaty still left around you and be happy"', 
                         style: AppStyles.h4.copyWith(color: color.textColer),
                         ),
                       )
                       
                        ],
                      ),

                    ),
                  );
                  
                }) )),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SizedBox(
                    height: size.height * 1/15,
                    child: Container(
                   padding: const EdgeInsets.symmetric(vertical: 24),
                   alignment: Alignment.center,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection:Axis.horizontal ,
                      itemCount: 5,
                      itemBuilder: ( (context, index) {
                      return bildIndicator(index ==_currenIndex, size);
                    })),
                     ) ),
                )



        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: color.primaryColor,
        onPressed: () {
          print('exchange');
        },
        child: Icon(Icons.currency_exchange_sharp),
      ),
    );
  }


  Widget bildIndicator(bool isActive , Size size){
    return Container(
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      width: isActive ? size.width * 1/5 :24,
      decoration: BoxDecoration(
        color: isActive ? color.lighBlue : color.lighGrey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow:[ BoxShadow(
          color: Colors.black38,offset: const Offset(2,3), blurRadius: 3
       ) ],
      ),
    );
  }
}
