import 'package:flutter/material.dart';
import 'package:datesify/infodate.dart';

class Search extends  StatefulWidget {
  Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}
class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(30),
            child: Column(
                children: [

                  DecoratedBox(
                      decoration: BoxDecoration(
                        color:const Color(0xFFC8A18F).withOpacity(0.68), //background color of dropdown button
                        borderRadius: BorderRadius.circular(30), //border raiuds of dropdown button
                      ),

                      child:Padding(
                          padding: const EdgeInsets.only(left:30, right:30),
                          child:DropdownButton<dynamic>(
                            onChanged: (value){ //get value when changed
                            },
                            items: [//add items in the dropdown
                              getItem(0, 'Ajwa'),
                              getItem(1, 'Medjool'),
                              getItem(2, 'Rutab'),
                              getItem(3, 'Nabtat Ali'),
                              getItem(4, 'Galaxy'),
                              getItem(5, 'Meneifi'),
                              getItem(6, 'Sugaey'),
                              getItem(7, 'Shaishe'),
                              getItem(8, 'Sokari')
                            ],
                            hint: const Text('Search',
                              style: TextStyle(
                                color: Color(0xFFFFEADA),
                                fontFamily: "Inter-Regular",
                                letterSpacing: 5,
                                fontSize: 20,
                              ),),
                            icon: const Padding( //Icon at tail, arrow bottom is default icon
                              padding: EdgeInsets.only(left:20),
                              child:Icon(Icons.search, color: Colors.white,),
                            ),
                            iconEnabledColor: Colors.white, //Icon color
                            style: const TextStyle(  //te
                              fontFamily: "Inter-Regular",
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 3, //font size on dropdown button
                            ),

                            dropdownColor: const Color(0xFFC8A18F), //dropdown background color
                            underline: Container(), //remove underline
                            isExpanded: true, //make true to make width 100%
                          )
                      )
                  ),

                ]
            )
        );
  }

  DropdownMenuItem getItem(int id, String title) {
    return DropdownMenuItem(
      value: title,
      child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => datesinfo(id)));// navigate code...
          },
          child: Text(title)
      ),
    );
  }

}

class datesinfo extends StatelessWidget {
  int dateID;
  datesinfo(this.dateID);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(elevation: 0,),
      body:
      Stack(
        children: [
          ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(30, 50, 40, 20),
                        child:
                        Text((infoDates[dateID].name).toUpperCase(),
                          style: TextStyle(
                            letterSpacing: 3,
                            fontFamily: 'Inter-SemiBold',
                            fontSize: 28,
                            color: Color(0xFFFFEADA),
                            height: 1,
                          ),),
                      ),
                      SizedBox(
                        width: 200,
                        child: Text((infoDates[dateID].funfact), style: TextStyle(fontFamily: "Inter-Light", color: Color(0xFFFFEADA), fontSize: 15,), ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 300,
                    child: Image.asset((infoDates[dateID].dateimage), width: 120),
                  ),
                ],
              ),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      topLeft: Radius.circular(40.0)
                  ),
                ),
                child: Column(

                  children: [
                    SizedBox(height:50),
                    Container(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      width: double.infinity,
                      child: Text(
                        'Origins',
                        style: TextStyle(
                          letterSpacing: 1.5,
                          fontSize: 20.0,
                          color: Colors.black,
                          fontFamily: "Inter-SemiBold",
                          fontWeight: FontWeight.bold,),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      width: double.infinity,
                      child: Text(
                        (infoDates[dateID].origins),
                        style: TextStyle(
                          letterSpacing: 1.5,
                          fontSize: 15.0,
                          color: Colors.black,
                          fontFamily: "Inter-Light",),
                      ),
                    ),
                    SizedBox(height:30),
                    Container(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      width: double.infinity,
                      child: Text(
                        'Colour',
                        style: TextStyle(
                          letterSpacing: 1.5,
                          fontSize: 20.0,
                          color: Colors.black,
                          fontFamily: "Inter-SemiBold",
                          fontWeight: FontWeight.bold,),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      width: double.infinity,
                      child: Text(
                        (infoDates[dateID].colors),
                        style: TextStyle(
                          letterSpacing: 1.5,
                          fontSize: 15.0,
                          color: Colors.black,
                          fontFamily: "Inter-Light",),
                      ),
                    ),
                    SizedBox(height:30),
                    Container(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      width: double.infinity,
                      child: Text(
                        'Texture',
                        style: TextStyle(
                          letterSpacing: 1.5,
                          fontSize: 20.0,
                          color: Colors.black,
                          fontFamily: "Inter-SemiBold",
                          fontWeight: FontWeight.bold,),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      width: double.infinity,
                      child: Text(
                        (infoDates[dateID].texture),
                        style: TextStyle(
                          letterSpacing: 1.5,
                          fontSize: 15.0,
                          color: Colors.black,
                          fontFamily: "Inter-Light",),
                      ),
                    ),
                    SizedBox(height:30),
                    Container(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      width: double.infinity,
                      child: Text(
                        'Taste',
                        style: TextStyle(
                          letterSpacing: 1.5,
                          fontSize: 20.0,
                          color: Colors.black,
                          fontFamily: "Inter-SemiBold",
                          fontWeight: FontWeight.bold,),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      width: double.infinity,
                      child: Text(
                        (infoDates[dateID].taste),
                        style: TextStyle(
                          letterSpacing: 1.5,
                          fontSize: 15.0,
                          color: Colors.black,
                          fontFamily: "Inter-Light",),
                      ),
                    ),
                    SizedBox(height:30),
                    Container(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      width: double.infinity,
                      child: Text(
                        'Benefits',
                        style: TextStyle(
                          letterSpacing: 1.5,
                          fontSize: 20.0,
                          color: Colors.black,
                          fontFamily: "Inter-SemiBold",
                          fontWeight: FontWeight.bold,),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      width: double.infinity,
                      child: Text(
                        (infoDates[dateID].benefits),
                        style: TextStyle(
                          letterSpacing: 1.5,
                          fontSize: 15.0,
                          color: Colors.black,
                          fontFamily: "Inter-Light",),
                      ),
                    ),
                    SizedBox(height:30),
                    Container(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      width: double.infinity,
                      child: Text(
                        'Expiration',
                        style: TextStyle(
                          letterSpacing: 1.5,
                          fontSize: 20.0,
                          color: Colors.black,
                          fontFamily: "Inter-SemiBold",
                          fontWeight: FontWeight.bold,),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      width: double.infinity,
                      child: Text(
                        (infoDates[dateID].expiration),
                        style: TextStyle(
                          letterSpacing: 1.5,
                          fontSize: 15.0,
                          color: Colors.black,
                          fontFamily: "Inter-Light",),
                      ),
                    ),
                    SizedBox(height:50),
                  ],),
                width: double.infinity,
                alignment: Alignment.center,

              ),
            ],
          ),

        ],
      ),
    );
  }
}
