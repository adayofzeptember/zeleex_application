import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeleex_application/bloc/products/products_bloc.dart';
import '../../Main Pages/product_filtered.dart';
import '../../Others/Plate.dart';
import 'package:intl/intl.dart';


class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);
  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final scController = ScrollController();

  @override
  void initState() {
    context.read<ProductsBloc>().add(Load_AllProdutcs());
    scController.addListener(() {
      if (scController.position.pixels ==
          scController.position.maxScrollExtent) {
        context.read<ProductsBloc>().add(Load_AllProdutcs());
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
          "สินค้า",
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
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          return Scrollbar(
            thickness: 8,
            radius: const Radius.circular(15),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: GridView.builder(
                  key: const PageStorageKey<String>('animalspage'),
                  controller: scController,
                  physics: const ClampingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: MediaQuery.of(context).size.height * 0.35,
                  ),
                  itemCount: (state.isLoading == true)
                      ? state.product_list.length + 1
                      : state.product_list.length,
                  itemBuilder: (context, index) {
                    if (index == state.product_list.length &&
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
                      return Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            child: InkWell(
                              onTap: () {
                                print('product id: ' +
                                    state.product_list[index].id.toString());

                                context.read<ProductsBloc>().add(
                                      Load_ProductInfo(
                                        id: state.product_list[index].id
                                            .toString(),
                                        context: context,
                                        title: state.product_list[index].title
                                            .toString(),
                                      ),
                                    );
                                    //  context.read<ProductsBloc>().add(
                                    //   Load_SKUS(
                                    //     id: state.product_list[index].id
                                    //         .toString(),
                                     
                                    //   ),
                                    // );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                        color: ZeleexColor.zeleexGreen,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            topRight: Radius.circular(5))),
                                    height: MediaQuery.of(context).size.height *
                                        0.22,
                                    width: double.infinity,
                                    child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                            topRight: Radius.circular(5)),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              'https://api.zeleex.com/file/534/634e1e245a5d9_275773114_2754272138202414_4661250318203734812_n.jpg',
                                          fit: BoxFit.contain,
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              Container(
                                            color: const Color.fromARGB(
                                                255, 142, 142, 142),
                                            // height: 200,
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      3, 3, 3, 0),
                                              child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.22,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: const Color.fromARGB(
                                                              255,
                                                              211,
                                                              204,
                                                              204)),
                                                      borderRadius:
                                                          const BorderRadius.all(
                                                              Radius.circular(
                                                                  5))),
                                                  alignment: Alignment.center,
                                                  child:
                                                      const Icon(Icons.error_outline)),
                                            ),
                                          ),
                                        )),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 10, 5, 0),
                                    child: Container(
                                      height: 42,
                                      child: Text(
                                        state.product_list[index].title
                                            .toString(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color:
                                              Color.fromARGB(255, 51, 51, 51),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 10, 0, 0),
                                      child: Text(
                                        "฿ " +
                                            NumberFormat("#,###,###").format(
                                                int.parse(state
                                                    .product_list[index].price
                                                    .toString())),
                                        style: const TextStyle(
                                            color: Colors.red, fontSize: 17),
                                      )),
                                  const SizedBox(
                                    height: 8,
                                  )
                                ],
                              ),
                            ),
                          ));
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
          child: SizedBox(
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
                      const Text("ค้นหาจากหมวดหมู่",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      // FutureBuilder<List<Data_Product_Types>>(
                      //   future: future_product_types,
                      //   builder: (context, snapshot) {
                      //     if (snapshot.hasData) {
                      //       List<Data_Product_Types>? data = snapshot.data;

                      //       return ListView.builder(
                      //           physics: NeverScrollableScrollPhysics(),
                      //           shrinkWrap: true,
                      //           itemCount: data!.length,
                      //           itemBuilder: (BuildContext context, int index) {
                      //             return Container(
                      //               child: Column(
                      //                 crossAxisAlignment:
                      //                     CrossAxisAlignment.start,
                      //                 children: <Widget>[
                      //                   InkWell(
                      //                     onTap: () {
                      //                       print(data[index].id.toString());
                      //                       // setState(() {
                      //                       //   typeID =
                      //                       //       data[index].id.toString();
                      //                       // });
                      //                       // print(typeID.toString());
                      //                     },
                      //                     child: Text(
                      //                         data[index].title.toString(),
                      //                         style: TextStyle(
                      //                             fontSize: 17,
                      //                             fontWeight: FontWeight.w500,
                      //                             color: Color.fromARGB(
                      //                                 255, 131, 131, 131))),
                      //                   ),
                      //                   SizedBox(
                      //                     height: 15,
                      //                   )
                      //                 ],
                      //               ),
                      //             );
                      //           });
                      //     } else if (snapshot.hasError) {
                      //       return Text("${snapshot.error}");
                      //     }
                      //     return Container();
                      //   },
                      // ),
                      const Spacer(),
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
                                        side: const BorderSide(
                                            color: ZeleexColor.zeleexGreen),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        initState();
                                      },
                                      child: const Text(
                                        "ยกเลิก",
                                        style: TextStyle(
                                            color: ZeleexColor.zeleexGreen),
                                      ))),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Product_Filtered(
                                                    typeID: 1.toString(),
                                                  )));
                                    },
                                    child: const Text("ตกลง",
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
