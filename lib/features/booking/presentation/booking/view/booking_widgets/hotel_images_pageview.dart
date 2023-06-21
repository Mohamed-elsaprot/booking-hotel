import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pickytour/test_data.dart';

class HotelImages extends StatefulWidget {
  const HotelImages({Key? key, required this.imgsUrl,}) : super(key: key);
  final List<String> imgsUrl;
  @override
  State<StatefulWidget> createState() {
    return _HotelImagesState();
  }
}

class _HotelImagesState extends State<HotelImages> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          onPageChanged: (newVal) {
            setState(() {
              index = newVal;
            });
          },
          children: widget.imgsUrl.map((e) =>
          CachedNetworkImage(
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.error_outline,),
                Text(
                  'No Image Found.',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            imageUrl: e,
            fit: BoxFit.fill,
          )
          ).toList(),
        ),
        SafeArea(child: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: (){
            GoRouter.of(context).pop();
          },
        )),
        Align(
            alignment: Alignment.bottomCenter,
            child: Counter(index: index,circleNum: widget.imgsUrl.length,),
        )
      ],
    );
  }
}

class Counter extends StatelessWidget {
  const Counter({Key? key, required this.index, required this.circleNum}) : super(key: key);
  final int index;
  final int circleNum;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for(int i=0; i<circleNum;i++)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 6),
            child: buildContainer(i),
          )
      ],
    );
  }

  Widget buildContainer( int i) {
    return index == i
        ? const Icon(Icons.circle,color: Colors.white,size: 16,)
        : const Icon(Icons.circle,color: Colors.black38,size: 13,);
  }
}

