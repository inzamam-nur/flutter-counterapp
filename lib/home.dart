import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  int count=0;
  @override
  Widget build(BuildContext context) {

    Size defaultSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xFFE7E6E6),
        centerTitle: true,
        title:const Text("Inzamams 1st App", style: TextStyle(fontWeight: FontWeight.bold))),
      body: SafeArea(

        child: SizedBox(
          height: defaultSize.height,
          width: defaultSize.width,
          child: Column(

            children: [

               Stack(
                 clipBehavior: Clip.none,
                 alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Dismissible(
                      background: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 20.0),
                        color: Color(0xFFC6F7FD)),
                        direction: DismissDirection.horizontal,
                        confirmDismiss: (DismissDirection direction) {
                           if(direction == DismissDirection.startToEnd){setState(() {count--;});}
                           if(direction == DismissDirection.endToStart){setState(() {count++;});}
                      return Future.value(false);
                      },
                         key: UniqueKey(),
                         child: Container(
                        height: 200,
                        width: defaultSize.width,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Color(0xFFC6F7FD),
                        ),
                        child:  Text("$count",style:const TextStyle(fontSize: 100,fontWeight: FontWeight.bold,color: Colors.white),),
                      ),
                    ),

                  /*  GestureDetector(
                      onHorizontalDragUpdate: (details) {
                        int sensitivity = 8;
                        // Swiping in right direction.
                        if (details.delta.dx > sensitivity) {
                          setState(() {
                            count++;
                          });
                        }

                        // Swiping in left direction.
                        if (details.delta.dx < -sensitivity) {
                          setState(() {
                            count--;
                          });
                        }
                      },
                      child: Container(
                        height: 200,
                        width: defaultSize.width,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Color(0xFFC6F7FD),
                        ),
                        child:  Text("$count",style:const TextStyle(fontSize: 100,fontWeight: FontWeight.bold,color: Colors.white),),
                        ),
                    ),*/
                    Positioned(
                       bottom: -40,
                      child: Container(
                        width: 250,
                        height: 80,
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        decoration: BoxDecoration( color:const Color(0xFF3B3E3F), borderRadius: BorderRadius.circular(50),),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /*GestureDetector(
                              onTap: (){
                                setState(() {
                                  count++;
                                });
                              },
                              child: Container(
                                height: 60,
                                width: 60,
                                margin:const EdgeInsets.all(10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color:const Color(0xFFFB3F3F),
                                ),
                                child: const Text("+",style:TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.white)),
                              ),
                            ),*/
                            /*InkWell(
                              onTap: (){
                                setState(() {
                                    count--;
                                });
                              },
                              child: Container(
                                height: 60,
                                width: 60,
                                margin:const EdgeInsets.all( 10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color:const Color(0xFF1BC995),
                                ),
                                child:Center(child: const Text("-",style:TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.white))),
                              ),
                            )*/
                            ClipOval(

                              child: Material(
                                color: Colors.red,
                                // Button color
                                child: InkWell(
                                  splashColor: Colors.blue, // Splash color
                                  onTap: () {
                                    setState(() {
                                      count++;
                                    });
                                  },
                                  child: SizedBox(width: 56, height: 56, child: Icon(Icons.add,size: 32,color: Colors.white,)),
                                ),
                              ),
                            ),
                            ElevatedButton(onPressed:(){
                              setState(() {
                                count--;
                              });
                            }, child: const Text('-')),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  count--;
                                });
                              },
                              child: const ClipOval(
                                child: Material(
                                  color: Colors.blue, // Button color
                                  child: SizedBox(width: 56, height: 56, child: Icon(Icons.remove,size: 32,color: Colors.white,)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],

                ),
             Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 20,top: 60,bottom: 10),
              child: const Text("DO SOMETHING !!",textAlign: TextAlign.left,style: TextStyle(fontSize: 20),),
            ),
             Container(
               margin:const EdgeInsets.all(16),
               padding:const EdgeInsets.all(20),

               decoration:  BoxDecoration(color:const  Color(0xFFE3F9FC),borderRadius: BorderRadius.circular(16),
                   boxShadow: const [
                 BoxShadow(
                     color: Color(0xFFC7C7C7),
                     spreadRadius: -1,
                     blurRadius: 5
                 )
               ]),


               child: Column(


                 children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   
                   children: [
                     customBtn(defaultSize,title: '+5 ', onTap: (){
                       setState(() {
                         count=count+5;
                       });
                     }),
                     customBtn(defaultSize,title: '-5 ',radius:const BorderRadius.only(topRight: Radius.circular(20)), onTap: (){setState(() {
                        count = count-5;
                     });}),
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     customBtn(defaultSize,title: '+10 ',radius:BorderRadius.only(bottomLeft: Radius.circular(20)), onTap: (){setState(() {
                       count=count+10;
                     });}),
                     customBtn(defaultSize,title: '-10 ',radius:const BorderRadius.only(bottomRight: Radius.circular(20)), onTap: (){
                       setState(() {
                           count = count-10;
                       });
                     }),
                   ],
                 ),
                   Container(
                     height: 50,
                     width: defaultSize.width,
                     margin:const EdgeInsets.only(left:7,right: 7),
                     child: customBtn(defaultSize,title: 'Reset ',radius:BorderRadius.circular(0), onTap: (){
                       setState(() {
                         count=0;
                       });
                     }),
                   )
               ],),

             ),



            ],
          ),
        )
      ),
    );
  }

  Widget customBtn(
      Size defaultSize,
      {
        Color bgColor = const Color(0xFFFFFFFF),
        required String title,
        required GestureTapCallback? onTap,
        BorderRadius radius=const BorderRadius.only(topLeft:Radius.circular(20))
      }
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(4),
          width: 130,
          height: 120,
          decoration: BoxDecoration(
              color: bgColor, borderRadius: radius, boxShadow: const [
            BoxShadow(
                color: Color(0xFFC7C7C7),
                spreadRadius: -1,
                blurRadius: 5
            )
          ]),
          child: Text(title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
      ),
    );
  }



}
