import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Others/Plate.dart';
import 'package:intl/intl.dart';
import '../../bloc/animals/animals_bloc.dart';

class AnimalsPage extends StatefulWidget {
  AnimalsPage({Key? key}) : super(key: key);
  @override
  State<AnimalsPage> createState() => _AnimalsPageState();
}

class _AnimalsPageState extends State<AnimalsPage> {
  final scController = ScrollController();

  @override
  void initState() {
    context.read<AnimalsBloc>().add(Load_AllAnimals());
    scController.addListener(() {
      if (scController.position.pixels ==
          scController.position.maxScrollExtent) {
        context.read<AnimalsBloc>().add(Load_AllAnimals());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 242),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark),
        leading: Builder(
          builder: (context) => IconButton(
            icon: SizedBox(
              child: Visibility(
                visible: false,
                child: SvgPicture.asset(
                  'assets/images/menu.svg',
                  color: Color.fromARGB(255, 51, 51, 51),
                ),
              ),
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        centerTitle: true,
        title: const Text(
          "สัตว์",
          style: TextStyle(
              color: ZeleexColor.zeleexGreen, fontWeight: FontWeight.bold),
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: SizedBox(
                child: SvgPicture.asset(
                  'assets/images/sort.svg',
                ),
              ),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      body: BlocBuilder<AnimalsBloc, AnimalsState>(
        builder: (context, state) {
          return Scrollbar(
            thickness: 8,
            radius: const Radius.circular(15),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: GridView.builder(
                  key: const PageStorageKey<String>('animalspage'),
                  controller: scController,
                  physics: ClampingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: MediaQuery.of(context).size.height * 0.35,
                  ),
                  itemCount: (state.isLoading == true)
                      ? state.animals_data.length + 1
                      : state.animals_data.length,
                  itemBuilder: (context, index) {
                    if (index == state.animals_data.length &&
                        state.isLoading == true) {
                      return const Padding(
                        padding: EdgeInsets.all(75.0),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: ZeleexColor.zeleexGreen,
                          ),
                          //const CupertinoActivityIndicator()
                        ),
                      );
                    } else {
                      return 
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          child: InkWell(
                            onTap: () {
                              print('animals id: ' +
                                  state.animals_data[index].id.toString());
                                   context.read<AnimalsBloc>().add(
                              Load_AnimalInfo(
                                id: state.animals_data[index].id.toString(),
                                context: context,
                                title: state.animals_data[index].title.toString(),
                              ),
                            );
                          
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.22,
                                  width: double.infinity,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5)),
                                      child: 
                                      CachedNetworkImage(
                                        imageUrl: state
                                            .animals_data[index].image
                                            .toString(),
                                        fit: BoxFit.fill,
                                        progressIndicatorBuilder:
                                            (context, url, downloadProgress) =>
                                                Container(
                                          color: Color.fromARGB(
                                              255, 142, 142, 142),
                                          // height: 200,
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Center(
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                3, 3, 3, 0),
                                            child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.22,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Color.fromARGB(
                                                            255,
                                                            211,
                                                            204,
                                                            204)),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5))),
                                                alignment: Alignment.center,
                                                child:
                                                    Icon(Icons.error_outline)),
                                          ),
                                        ),
                                      )),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                  child: Container(
                                    height: 20,
                                    child: Text(
                                      state.animals_data[index].title
                                          .toString(),
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 51, 51, 51),
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 5, 0),
                                  child: Container(
                                    height: 33,
                                    child: Text(
                                      state.animals_data[index].description
                                          .toString(),
                                      // data[index].description.toString(),
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color.fromARGB(
                                              255, 130, 130, 130)),
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 10, 0, 0),
                                    child: Text(
                                      "฿ " +
                                          NumberFormat("#,###,###").format(
                                              int.parse(state
                                                  .animals_data[index].price
                                                  .toString())),
                                      style: TextStyle(color: Colors.red),
                                    )),
                                SizedBox(
                                  height: 8,
                                ),
                                Container()
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  }),
            ),
          );
        },
      ),
      endDrawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white, //desired color
          ),
          child: Container(
            width: MediaQuery.of(context).size.height * 0.3,
            child: Drawer(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    20,
                    0,
                    0,
                    0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.07,
                      ),
                      Text("ค้นหาแบบละเอียด",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      // FutureBuilder<List<Data_AnimalCategory>>(
                      //   future: futureAnimal_types,
                      //   builder: (context, snapshot) {
                      //     if (snapshot.hasData) {
                      //       List<Data_AnimalCategory>? data = snapshot.data;

                      //       return ListView.builder(
                      //           physics: NeverScrollableScrollPhysics(),
                      //           shrinkWrap: true,
                      //           itemCount: data!.length,
                      //           itemBuilder: (BuildContext context, int index) {
                      //             return Column(
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.start,
                      //               children: <Widget>[
                      //                 InkWell(
                      //                   onTap: () {},
                      //                   child: Text(
                      //                       data[index].title.toString(),
                      //                       style: TextStyle(
                      //                           fontSize: 17,
                      //                           fontWeight: FontWeight.w500,
                      //                           color: Color.fromARGB(
                      //                               255, 131, 131, 131))),
                      //                 ),
                      //                 // Text(
                      //                 //     data[3].children![2].title.toString(),
                      //                 //     style: TextStyle(
                      //                 //         fontSize: 17,
                      //                 //         fontWeight: FontWeight.w500,
                      //                 //         color: Color.fromARGB(
                      //                 //             255, 131, 131, 131))),
                      //                 SizedBox(
                      //                   height: 15,
                      //                 ),
                      //               ],
                      //             );
                      //           });
                      //     } else if (snapshot.hasError) {
                      //       return Text("${snapshot.error}");
                      //     }
                      //     return Container();
                      //   },
                      // ),
                      Spacer(),
                      Container(
                          //height: double.infinity,
                          alignment: Alignment.bottomCenter,
                          width: double.infinity,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 20, bottom: 20),
                            child: Row(children: <Widget>[
                              Expanded(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        primary: Colors.white,
                                        side: BorderSide(
                                            color: ZeleexColor.zeleexGreen),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        "รีเซ็ต",
                                        style: TextStyle(
                                            color: ZeleexColor.zeleexGreen),
                                      ))),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("ตกลง",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ))),
                              )
                            ]),
                          ))
                    ],
                  )),
            ),
          )),
    );
  }
}
