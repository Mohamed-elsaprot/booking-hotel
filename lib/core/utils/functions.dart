import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants.dart';
import 'package:location/location.dart';

void customSnackBar(BuildContext ctx,String text){
  ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
          backgroundColor:scaffoldColor,
          content: Row(
              children:[
                const Icon(Icons.error_outline,color: lightColor,),
                const SizedBox(width: 15,),
                Text(text.length< 50? text :'error > 50 letters',style: const TextStyle(color: Colors.white,),overflow: TextOverflow.ellipsis,softWrap: true,),
              ],
            ),
          )
  );
}

Future<void> launchLink( BuildContext ctx, String? url)async{
  if(url!=null){
    Uri uri =Uri.parse(url);
    if(await canLaunchUrl(uri)){
      await launchUrl(uri);
    }else {
      customSnackBar(ctx,'  can\'t launch the link');
    }
  }
}

sendLoactionData({required BuildContext ctx})async{
  Location location= Location();
  bool _serviceEnabled;
  PermissionStatus _permissionStatusGranted;
  LocationData _locationData;

  _serviceEnabled = await location.serviceEnabled();
  if(!_serviceEnabled){
    _serviceEnabled = await location.requestService();
    if(! _serviceEnabled){return ;}
  }

  _permissionStatusGranted = await location.hasPermission();
  if(_permissionStatusGranted == PermissionStatus.denied){
    _permissionStatusGranted = await location.requestPermission();
    if(_permissionStatusGranted != PermissionStatus.granted){
      return ;
    }
  }
  _locationData = await location.getLocation();
  print('${_locationData.latitude} / ${_locationData.longitude}');
  goToMaps(ctx: ctx,x: _locationData.latitude,y:_locationData.latitude);
}

goToMaps({double? x=0,double? y=0, required BuildContext ctx})async{

  String mapLocationUrl = "https://www.google.com/maps/search/?api=1&query=$x,$y";
  launchLink(ctx, mapLocationUrl);
}

MaterialColor generateMaterialColor(Color color){
  final Map<int,Color> swatch={};
  for(int i=0;i<10;i++){
    late int key;
    if(i==0) {key=50;} else {key=i*100;}

    final double op= (0.1*i)+0.1;
    swatch[key]=Color.fromRGBO(color.red, color.green, color.blue, op);

  }
  return MaterialColor(color.value, swatch);
}

