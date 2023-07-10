import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickytour/core/utils/api_service.dart';
import 'package:pickytour/core/utils/functions.dart';
import 'package:pickytour/features/admin_interface/presentation/view/admin_screen.dart';
import 'core/utils/routers.dart';
import 'constants.dart';
import 'core/utils/service_locator.dart';
import 'features/auth/data/auth_repo_implementation.dart';
import 'features/auth/presntation/manager/auth_cubit.dart';

void main()async{
  setupGetItService();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // List ordersList=[];
  // CollectionReference orders =//kMessagesCollections
  // FirebaseFirestore.instance.collection('mo').doc('1').collection('11');
  // await orders.add({'moo':'sdsd','eldeeb':{'1':1,'2':2,'3':3}, 'date':'${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}'});
  // orders.orderBy('eldeeb', descending: true).snapshots().listen((event) {
  //   ordersList.clear();
  //   for(var doc in event.docs) {
  //     print('------');
  //     print(doc.data());
  //     doc['eldeeb'].forEach((k,v) {print(v);});
  //   }
  // });

  //runApp(const PickyTourApp());
  runApp( AdminScreen(apiService: ApiService(Dio()),));

}

class PickyTourApp extends StatelessWidget {
  const PickyTourApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AuthCubit(
                getIt.get<AutheRepoImpl>()
          )
        ),
      ],
      child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'picky tour',
          theme: ThemeData(
            primarySwatch: generateMaterialColor(const Color(0xff62CDFF),),
            scaffoldBackgroundColor: scaffoldColor,
          ),
          routerDelegate: AppRouter.router.routerDelegate,
          routeInformationParser: AppRouter.router.routeInformationParser,
        ),
    );
  }
}