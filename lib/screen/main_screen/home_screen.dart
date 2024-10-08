import 'package:flutter/material.dart';
import 'package:lati_marvel_movies/helper/consts.dart';
import 'package:lati_marvel_movies/helper/function_helper.dart';
import 'package:lati_marvel_movies/model/movies_model.dart';
import 'package:lati_marvel_movies/provider/movie_provider.dart';
import 'package:lati_marvel_movies/widget/custom-icon-appbar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<MovieProvider>(context, listen: false).getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(builder: (context, moviesConsumer, child) {
      return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
            actions: [
              CustomIconAppBar(
                  assets: "assets/icons/InboxIcon.png", onTab: () {}),
              CustomIconAppBar(
                  assets: "assets/icons/FavoriteButton.png", onTab: () {})
            ],
            title: Image.asset(
              "assets/logo/marvelLogo.png",
              width: getSize(context).width * 0.25,
            )),
        body: AnimatedSwitcher(
          duration: animationDuration,
          child: moviesConsumer.error
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline_outlined,
                          color: mainColor,
                          size: getSize(context).width * 0.33),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "SOMTHING WENT WRONG!",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              : GridView.builder(
                  padding: EdgeInsets.all(24),
                  itemCount: moviesConsumer.process
                      ? 12
                      : moviesConsumer.listmovies.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.7),
                  itemBuilder: (context, index) {
                    return AnimatedSwitcher(
                      duration: animationDuration,
                      child: moviesConsumer.process
                          ? Center(child: CircularProgressIndicator()) //
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Stack(
                                children: [
                                  Image.network(
                                    moviesConsumer.listmovies[index].coverUrl,
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    top: 0,
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                              colors: [
                                            Colors.black,
                                            Colors.transparent
                                          ])),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              height: 100,
                                            ),
                                            Text(
                                              Duration(
                                                      minutes: moviesConsumer
                                                          .listmovies[index]
                                                          .duration)
                                                  .toString()
                                                  .substring(0, 4),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 10),
                                            ),
                                            Text(
                                              moviesConsumer
                                                  .listmovies[index].title,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    );
                  }),
        ),
      );
    });
  }
}
 // other way to do it 
// class MovieCardWithGridTile extends StatelessWidget {
//   const MovieCardWithGridTile({super.key, required this.movieModel});
//   final MoviesModel movieModel;
//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(8),
//       child: GridTile(
//         child: Container(
//           decoration: BoxDecoration(color: Colors.black12),
//           child: Image.network(
//             movieModel.coverUrl,
//             fit: BoxFit.cover,
//           ),
//         ),
//         footer: Container(
//           decoration: BoxDecoration(
//               gradient: LinearGradient(
//                   begin: Alignment.bottomCenter,
//                   end: Alignment.topCenter,
//                   colors: [Colors.black, Colors.transparent])),
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 100,
//                 ),
//                 Text(
//                   Duration(minutes: movieModel.duration)
//                       .toString()
//                       .substring(0, 4),
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.normal,
//                       fontSize: 15),
//                 ),
//                 Text(
//                   movieModel.title,
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }




