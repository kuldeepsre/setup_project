import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:setup_project/ui_design/post_list.dart';
import 'package:setup_project/ui_design/user_list.dart';

import '../dialog/custom_dialog.dart';
import '../utils/date_format_utils.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: 90.91836547851562,
              height: 96.37346649169922,
              decoration: const BoxDecoration(
                borderRadius : BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                color : Color.fromRGBO(74, 183, 182, 1),
              )
          ),
          Container(
              width: 97,
              height: 36,

              child: Stack(
                  children: <Widget>[
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                            width: 97,
                            height: 36,

                            child: Stack(
                                children: <Widget>[
                                  Positioned(
                                      top: 0,
                                      left: 0,
                                      child: Container(
                                          width: 97,
                                          height: 36,
                                          decoration: BoxDecoration(
                                            borderRadius : BorderRadius.only(
                                              topLeft: Radius.circular(12),
                                              topRight: Radius.circular(12),
                                              bottomLeft: Radius.circular(12),
                                              bottomRight: Radius.circular(12),
                                            ),
                                            color : Color.fromRGBO(74, 183, 182, 1),
                                          )
                                          ,
                                        child:  Center(
                                          child: Text('Order Again', textAlign: TextAlign.left, style: TextStyle(
                                              color: Color.fromRGBO(255, 255, 255, 1),
                                              fontFamily: 'DM Sans',
                                              fontSize: 12,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.normal,
                                              height: 1
                                          ),),
                                        ),
                                      )
                                  ),
                                ]
                            )
                        )
                    ),

                  ]
              )
          ),
          Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                borderRadius : BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                color : Color.fromRGBO(74, 183, 182, 1),
              ),
            child: Center(child: Text("+",style: TextStyle(color: Colors.white),),),
          ),
          Text('Order Again', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'DM Sans',
              fontSize: 12,
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1
          ),),
          Text('Default Format: ${DateFormatUtils.formatDefault(now)}'),
          Text('Full Format: ${DateFormatUtils.formatFull(now)}'),


       Center(
         child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Container(
               width: 36,
               height: 36,
               decoration: BoxDecoration(
                 borderRadius : BorderRadius.only(
                   topLeft: Radius.circular(12),
                   topRight: Radius.circular(12),
                   bottomLeft: Radius.circular(12),
                   bottomRight: Radius.circular(12),
                 ),
                 color : Color.fromRGBO(233, 112, 115, 1),
               ),

               child: Center(
                 child: Text('-', textAlign: TextAlign.left, style: TextStyle(
                     color: Color.fromRGBO(255, 255, 255, 1),
                     fontFamily: 'DM Sans',
                     fontSize: 16,
                     letterSpacing: 0,
                     fontWeight: FontWeight.normal,
                     height: 1
                 ),),
               ),
             ),
             SizedBox(width: 10,),
             Container(
               width: 36,
               height: 36,
               decoration: const BoxDecoration(
                 borderRadius : BorderRadius.only(
                   topLeft: Radius.circular(12),
                   topRight: Radius.circular(12),
                   bottomLeft: Radius.circular(12),
                   bottomRight: Radius.circular(12),
                 ),
                 color : Color.fromRGBO(74, 183, 182, 1),
               ),
               child: Center(child: Text("+",style: TextStyle(color: Colors.white),),),
             ),
           ],
         ),
       ),



          Container(
            width: MediaQuery.of(context).size.width*.90,
            height: MediaQuery.of(context).size.height*.05,
            decoration: const BoxDecoration(
              borderRadius : BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              color : Color.fromRGBO(74, 183, 182, 1),
            ),
            child: const Center(
              child: Text('Order Again', textAlign: TextAlign.left, style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'DM Sans',
                  fontSize: 16,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1
              ),),
            ),
          ),
          Text('Short Format: ${DateFormatUtils.formatShort(now)}'),
          Text('Custom Format: ${DateFormatUtils.formatCustom(now)}'),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  UserListPage()),
              );
            },
            child: const Text('View Users'),
          ),
          Container(
              width: 130,
              height: 36,

              child: Stack(
                  children: <Widget>[
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                            width: 130,
                            height: 36,
                            decoration: BoxDecoration(
                              borderRadius : BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                              color : Color.fromRGBO(200, 236, 216, 1),
                              border : Border.all(
                                color: Color.fromRGBO(253, 170, 93, 1),
                                width: 1,
                              ),
                            )
                        )
                    ),Positioned(
                        top: 6,
                        left: 30,
                        child: Text('Add to cart', textAlign: TextAlign.center, style: TextStyle(
                            color: Color.fromRGBO(253, 170, 93, 1),
                            fontFamily: 'Lato',
                            fontSize: 14,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1.5714285714285714
                        ),)
                    ),
                  ]
              )
          ),

          SizedBox(height: 4,),
          Text('Final Total : ₹ 123', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'DM Sans',
              fontSize: 16,
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1.375
          ),),SizedBox(height: 4,),
          Text('Delivered', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(19, 171, 134, 1),
              fontFamily: 'Lato',
              fontSize: 10,
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1
          ),),
          Text('Delivered', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(19, 171, 134, 1),
              fontFamily: 'Lato',
              fontSize: 10,
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1
          ),),
          SizedBox(height: 4,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 20,
                width: MediaQuery.of(context).size.width*.90,
                decoration: BoxDecoration(
                  borderRadius : BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  color : Color.fromRGBO(255, 255, 255, 1),
                  border : Border.all(
                    color: Color.fromRGBO(232, 239, 243, 1),
                    width: 1,
                  ),
                )
            ),
          ),
          SizedBox(height: 4,),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  PostListPage()),
              );
            },
            child: const Text('View Posts'),
          ),
          ElevatedButton(
            onPressed: () {
              showCustomSnackbar(context,"etrtre6tre");
            },
            child: Text('Show Success Dialog'),
          ),
        ],
      ),
    );
  }
}
