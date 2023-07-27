import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:movie_booking/pages/details_screen.dart';
import 'package:movie_booking/utils/dummy_data.dart';
import 'package:movie_booking/utils/mytheme.dart';
// import 'package:movie_booking/widgets/item_block.dart';

class MoviesItems extends StatelessWidget {
  const MoviesItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: 230,
      width: size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (_, i) {
        //   return Hero(
        //     tag: "${movies[i].title}$i",
        //     // child: ItemBlock(
        //     //   model: movies[i],
        //     //   isMovie: true,
        //     //   onTap: (model) {
        //     //     Get.to(() => DetailsScreen(), arguments: [movies[i], i]);
        //     //   },
        //     // ),
        //   );
        return Padding(
          padding: const EdgeInsets.only(top: 10, left: 20.0, right: 10),
          child: GestureDetector(
            onTap: () {
              print(movies[i].title);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    movies[i].bannerUrl,
                    height: 150,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ), 
                const SizedBox(
                  height: 8,
                ),
                Text(
                  movies[i].title,
                  style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.6)),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.favorite, 
                      color: MyTheme.splash,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${movies[i].like}",
                      style: const TextStyle(fontSize: 10),
                    )
                  ],
                )
              ],
            ),
          ),
        );
        },
      ),
    );
  }
}
