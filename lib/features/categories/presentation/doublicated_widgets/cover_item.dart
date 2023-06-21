import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CoverItem extends StatelessWidget {
  const CoverItem({Key? key, required this.url, required this.function})
      : super(key: key);
  final String url;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: function,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.black45, blurRadius: 5, offset: Offset(5, 5))
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: AspectRatio(
              aspectRatio: 1.3 / 1.1,
              child: CachedNetworkImage(
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
                imageUrl: url,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ));
  }
}

//AspectRatio(
//                   aspectRatio: 1.3/1.1,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       boxShadow: const[
//                         BoxShadow(
//                           color: Colors.black45,
//                           blurRadius: 5,
//                           offset: Offset(5,5)
//                         )
//                       ],
//                       borderRadius: BorderRadius.circular(20),
//                       image:  DecorationImage(
//                         image: NetworkImage(url),
//                           fit: BoxFit.fill
//                       )
//                     ),
//                   ),
//                 ),
