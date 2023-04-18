// import 'dart:io';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:prapa/blocs/not_write/not_write_bloc.dart';
// import 'package:prapa/utils/colors_app.dart';

// class PageNotWrite extends StatefulWidget {
//   const PageNotWrite({Key? key}) : super(key: key);

//   @override
//   State<PageNotWrite> createState() => _PageNotWriteState();
// }

// class _PageNotWriteState extends State<PageNotWrite> {
//   ScrollController scController = ScrollController();

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     context.read<NotWriteBloc>().add(LoadData());
//     scController.addListener(() {
//       if (scController.position.pixels == scController.position.maxScrollExtent) {
//         context.read<NotWriteBloc>().add(LoadData());
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('build not write');
//     return 
    
//     BlocBuilder<NotWriteBloc, NotWriteState>(
//       builder: (context, state) {
//         return 
//         ListView.builder(
//           controller: scController,
//           itemCount: (state.isLoading == true) ? state.notWrite.length + 1 : state.notWrite.length,
//           itemBuilder: (BuildContext context, int index) {
//             if (index == state.notWrite.length && state.isLoading == true) {
//               return Padding(
//                 padding: const EdgeInsets.all(75.0),
//                 child: Center(child: (Platform.isAndroid) ? const CircularProgressIndicator() : const CupertinoActivityIndicator()),
//               );
//             }
//             return Padding(
//               padding: const EdgeInsets.fromLTRB(12, 4, 4, 12),
//               child: Container(
//                 height: 150,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Colors.white,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 0,
//                       blurRadius: 1,
//                       offset: const Offset(0, 0), // changes position of shadow
//                     ),
//                   ],
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'เลข ป.${state.notWrite[index].waterNumber}',
//                             overflow: TextOverflow.ellipsis,
//                             maxLines: 1,
//                             style:
//                                 const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 240, 41, 27)),
//                           ),
//                           SizedBox(
//                             width: 200,
//                             child: Text(
//                               "${state.notWrite[index].customerName}",
//                               overflow: TextOverflow.ellipsis,
//                               maxLines: 1,
//                               style:
//                                   const TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 83, 83, 83), fontSize: 18),
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               const Text(
//                                 'ที่อยู่:',
//                                 style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 83, 83, 83)),
//                               ),
//                               const SizedBox(width: 3),
//                               SizedBox(
//                                 width: 180,
//                                 child: Text(
//                                   "${state.notWrite[index].customerAddress}",
//                                   overflow: TextOverflow.ellipsis,
//                                   maxLines: 1,
//                                   style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               const Text(
//                                 'มาตรวัดน้ำ:',
//                                 style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 83, 83, 83)),
//                               ),
//                               const SizedBox(width: 3),
//                               Container(
//                                 decoration: const BoxDecoration(
//                                     borderRadius: BorderRadius.all(Radius.circular(5)), color: Color.fromARGB(255, 221, 221, 221)),
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(left: 5, right: 5),
//                                   child: Text(
//                                     "${state.notWrite[index].meterNumber}",
//                                     style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black),
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(width: 5),
//                               const Text(
//                                 'เขต',
//                                 style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 83, 83, 83)),
//                               ),
//                               const SizedBox(width: 3),
//                               Container(
//                                 decoration: const BoxDecoration(
//                                     borderRadius: BorderRadius.all(Radius.circular(5)), color: Color.fromARGB(255, 221, 221, 221)),
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(left: 5, right: 5),
//                                   child: Text(
//                                     "${state.notWrite[index].areaNumber}",
//                                     style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       InkWell(
//                         onTap: (() {}),
//                         child: Container(
//                           width: 130,
//                           height: 200,
//                           decoration:
//                               const BoxDecoration(color: AppColors.thisGreen, borderRadius: BorderRadius.all(Radius.circular(10))),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 'assets/images/meter.png',
//                                 height: 75,
//                                 width: 75,
//                               ),
//                               const SizedBox(height: 8),
//                               const Text(
//                                 'จดมาตรวัดน้ำ',
//                                 style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }