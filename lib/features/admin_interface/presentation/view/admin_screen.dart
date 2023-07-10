import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pickytour/core/utils/api_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pickytour/core/utils/functions.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({
    Key? key,
    required this.apiService,
  }) : super(key: key);
  final ApiService apiService;


  @override
  Widget build(BuildContext context) {
    int x = 0;
    // CollectionReference orders =//kMessagesCollections
    // FirebaseFirestore.instance.collection('mo');
    //  orders.add({'moo':'sdsd','eldeeb':123});
    return MaterialApp(
      home: Scaffold(
        body: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (ctx,index){
            return Slidable(
                startActionPane: ActionPane(
                  // dismissible: DismissiblePane(
                  //   onDismissed: (){},
                  // ),
                    motion: const StretchMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context)async{
                          //for(int i=1; i<=10;i++)print(i);
                          //goToMaps(ctx: context);
                          await sendLoactionData(ctx:context);
                        },
                        label: 'delete',
                        icon: Icons.delete,
                        backgroundColor: Colors.red,
                      )
                    ]
                ),
                child: ListTile(
                  title: Text('mohamed'),
                  subtitle: Text('mo@gmail.com'),
                  leading: const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/monkey.jpg')
                  ),
                  onTap: (){},
                ));
          },
          separatorBuilder: (context,index)=> const Divider(height: 5,color: Colors.cyan,thickness: .5,),
        ),
      ),
    );
  }
}
