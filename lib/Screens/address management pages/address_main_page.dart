import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zeleex_application/bloc/address%20management/address_management_bloc.dart';
import '../../Others/Plate.dart';
import 'address_add_page.dart';
// ignore_for_file: type=lint
class Address_Manage_Page extends StatelessWidget {
  Address_Manage_Page({Key? key}) : super(key: key);

  bool checkDefault = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.light,
              statusBarColor: ZeleexColor.zeleexGreen,
            ),
            automaticallyImplyLeading: false,
            backgroundColor: ZeleexColor.zeleexGreen,
            elevation: 0.0,
            centerTitle: true,
            title: const Text(
              "จัดการที่อยู่",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            leading: IconButton(
              onPressed: () async {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            )),
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: BlocBuilder<AddressManagementBloc, AddressManagementState>(
            builder: (context, state) {
              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: DottedBorder(
                      color: ZeleexColor.zeleexGreen,
                      dashPattern: [8, 4],
                      strokeWidth: 2,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              duration: const Duration(milliseconds: 250),
                              type: PageTransitionType.fade,
                              child: Address_New_Page(),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  style: BorderStyle.none,
                                  color: ZeleexColor.zeleexGreen)),
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Text(
                              "+ เพิ่มที่อยู่",
                              style: TextStyle(
                                  color: ZeleexColor.zeleexGreen, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      strokeCap: StrokeCap.round,
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: state.address_data.length,
                      itemBuilder: (BuildContext context, int index) {
                        var getDf = state.address_data[index].defaultStatus;
                        if (getDf == '1') {
                          checkDefault = true;
                        } else {
                          checkDefault = false;
                        }
                        return Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Color.fromARGB(
                                            255, 206, 206, 206)))),
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 20, 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                              'assets/images/pin.svg'),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            state.address_data[index].name
                                                .toString(),
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 51, 51, 51),
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            checkDefault ? '(ที่อยู่หลัก)' : '',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red),
                                          )
                                        ],
                                      ),
                                      PopupMenuButton(
                                          onSelected: (result) {
                                            if (result == 0) {
                                              context
                                                  .read<AddressManagementBloc>()
                                                  .add(EditLoad_Address(
                                                      edit_addressID: state
                                                          .address_data[index]
                                                          .id
                                                          .toString(), context: context));

                      
                                              // Navigator.push(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //       builder: (context) =>
                                              //           Address_Edit_Page(),
                                              //     ));
                                            }
                                          },
                                          child: Icon(Icons.more_vert),
                                          itemBuilder: (BuildContext context) {
                                            return [
                                              PopupMenuItem(
                                                value: 0,
                                                child: Text(
                                                  'แก้ไข',
                                                  style: TextStyle(
                                                      color: ZeleexColor
                                                          .zeleexGreen),
                                                ),
                                              ),
                                              PopupMenuItem(
                                                onTap: () {
                                                  context
                                                      .read<
                                                          AddressManagementBloc>()
                                                      .add(DeleteAddress(
                                                          addressID: state
                                                              .address_data[
                                                                  index]
                                                              .id
                                                              .toString()));
                                                },
                                                child: Text(
                                                  'ลบ',
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                              ),
                                            ];
                                          }),
                                    
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          25, 0, 0, 0),
                                      child: Container(
                                        width: 250,
                                        child: Row(
                                          children: [
                                            Text('เบอร์โทร: '),
                                            Text(
                                              state.address_data[index].phone
                                                  .toString(),
                                            ),
                                          ],
                                        ),
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          25, 0, 0, 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.address_data[index].address
                                                .toString(),
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 130, 130, 130)),
                                          ),
                                          Text(
                                              state.address_data[index]
                                                      .district
                                                      .toString() +
                                                  ' ' + 
                                                      state.address_data[index].city
                                                      .toString() + ' ' + 
                                                  state.address_data[index]
                                                      .province
                                                      .toString()
                                              ,
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 130, 130, 130))),
                                          Text(
                                              state.address_data[index].postcode
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 130, 130, 130))),
                                        ],
                                      )),
                                  SizedBox(
                                    height: 5,
                                  )
                                ],
                              ),
                            ));
                      })
                ],
              );
            },
          ),
        ));
  }
}
