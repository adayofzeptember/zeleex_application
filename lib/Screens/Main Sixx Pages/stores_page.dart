import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeleex_application/bloc/store_indiv_products_animals_bloc/store_indiv_products_animals_bloc.dart';
import '../../Others/Plate.dart';
import '../../bloc/store_all/store_all_bloc.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  ScrollController scController = ScrollController();
  @override
  void initState() {
    context.read<StoreAllBloc>().add(Load_AllStores());
    scController.addListener(() {
      if (scController.position.pixels ==
          scController.position.maxScrollExtent) {
        context.read<StoreAllBloc>().add(Load_AllStores());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 242, 242, 242),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          systemOverlayStyle: const SystemUiOverlayStyle(
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
                    color: const Color.fromARGB(255, 51, 51, 51),
                  ),
                ),
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          centerTitle: true,
          title: const Text(
            "ร้านค้า",
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
        body: BlocBuilder<StoreAllBloc, StoreAllState>(
          builder: (context, state) {
            return Scrollbar(
              thickness: 8,
              radius: const Radius.circular(15),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: GridView.builder(
                    key: const PageStorageKey<String>('storespage'),
                    controller: scController,
                    physics: const ClampingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: MediaQuery.of(context).size.height * 0.35,
                    ),
                    itemCount: (state.isLoading == true)
                        ? state.allstores_data.length + 1
                        : state.allstores_data.length,
                    itemBuilder: (context, index) {
                      if (index == state.allstores_data.length &&
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
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          child: InkWell(
                            onTap: () {
                              print('store id: ' +
                                  state.allstores_data[index].id.toString());

                              context.read<StoreIndivProductsAnimalsBloc>().add(
                                  Load_ProductsInStore(
                                      getStoreID: state.allstores_data[index].id
                                          .toString()));

                              context.read<StoreAllBloc>().add(
                                    Load_StoreInfo(
                                        id: state.allstores_data[index].id
                                            .toString(),
                                        context: context,
                                        title: state.allstores_data[index].title
                                            .toString()),
                                  );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.21,
                                  width: double.infinity,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5)),
                                    child: 
                                    
                                    CachedNetworkImage(
                                      imageUrl:state.allstores_data[index].image,
                                          // 'https://api.zeleex.com/file/497/conversions/image_615362c04cec49738-thumb.jpg',
                                      fit: BoxFit.cover,
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                              Container(
                                        color: const Color.fromARGB(
                                            255, 142, 142, 142),
                                        // height: 200,
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Container(
                                        height: double.infinity,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        child: Image.asset(
                                          'assets/images/store-noimg.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),


                                    
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 5, 0, 0),
                                  child: Text(
                                    state.allstores_data[index].title
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 51, 51, 51)),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 10, 10, 0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: SvgPicture.asset(
                                            'assets/images/pinstore.svg'),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      SizedBox(
                                        height: 50,
                                        width: 120,
                                        child: Text(
                                          state.allstores_data[index].address
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: ZeleexColor.zeleexGreen),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // SizedBox(height: 10),
                                // Padding(
                                //   padding: const EdgeInsets.only(right: 10),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.end,
                                //     children: [
                                //       SvgPicture.asset('assets/images/star.svg'),
                                //       SizedBox(
                                //         width: 5,
                                //       ),
                                //       Text("5 คะแนน")
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        );
                      }
                    }),
              ),
            );
          },
        ));
  }
}
