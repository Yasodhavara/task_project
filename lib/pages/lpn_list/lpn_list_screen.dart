import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_project/pages/lpn_list/lpn_list_viewmodel.dart';
import 'package:task_project/serviceLocator.dart';

class LpnListScreen extends StatefulWidget {
  LpnListScreen({super.key});

  @override
  State<LpnListScreen> createState() => _LpnListScreenState();
}

class _LpnListScreenState extends State<LpnListScreen> {
  final _lpnListViewModel = serviceLocator.get<LpnListViewmodel>();
  final List<DropdownMenuEntry<String>> dropDownItems = const [
    DropdownMenuEntry(value: '1', label: 'WH-Inbound Storage'),
    DropdownMenuEntry(value: '2', label: 'A2T9001<->A2T9002'),
    DropdownMenuEntry(value: '3', label: 'A2T9002<->A2T9003'),
    DropdownMenuEntry(value: '4', label: 'A2T9003<->A2T9004'),
  ];
  late double padding = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    _lpnListViewModel.dispose();
    super.dispose();
  }

  void init() {
    super.initState();
    padding = MediaQuery.of(context).size.height * 0.016;
  }

  void displayAlert(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (ctx) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            backgroundColor: Colors.white,
            contentPadding: EdgeInsets.zero,
            content: FutureBuilder(
                future: _lpnListViewModel.getBinMappingListData(),
                builder: (ctx, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Text("error ${snapshot.error}");
                  } else {
                    return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          tableHeader(),
                          Container(
                            height: 1,
                            color: Colors.grey.withOpacity(0.2),
                          ),
                          kIsWeb ? dropDownSection() : SizedBox(),
                          kIsWeb
                              ? numOfRowsSelectionSection()
                              : mobileDropDownSection(),
                          binListTable(),
                          paginationSection(),
                          Container(
                            height: 1,
                            color: Colors.grey.withOpacity(0.2),
                            margin: EdgeInsets.symmetric(vertical: 24),
                          ),
                          tableFooter(),
                        ],
                      ),
                    );
                  }
                }),
          );
        });
  }

  Widget tableHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            decoration: const BoxDecoration(
              border: Border(left: BorderSide(color: Colors.teal, width: 3)),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height * 0.016),
            child: const Text(
              "Bin List",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.cancel)),
      ],
    );
  }

  Widget dropDownSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Table(
            border: const TableBorder.symmetric(inside: BorderSide.none),
            children: [
              const TableRow(children: [
                Padding(
                    padding: EdgeInsets.only(top: 16, left: 16),
                    child: Text("Storage Area")),
                Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text("Storage Type")),
                Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text("Storage Selection")),
                Padding(padding: EdgeInsets.only(top: 16), child: Text("Bins")),
              ]),
              TableRow(children: [
                Container(
                  padding: const EdgeInsets.only(top: 16, left: 16),
                  child: DropdownMenu<String>(
                    // expandedInsets: EdgeInsets.only(top: 10),
                    initialSelection: dropDownItems[0].value,
                    dropdownMenuEntries: dropDownItems,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: DropdownMenu<String>(
                      hintText: 'Storage Type',
                      dropdownMenuEntries: dropDownItems),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: DropdownMenu<String>(
                    hintText: 'Storage Selection',
                    dropdownMenuEntries: dropDownItems,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: DropdownMenu<String>(
                    initialSelection: dropDownItems[1].value,
                    dropdownMenuEntries: dropDownItems,
                  ),
                ),
              ]),
            ],
          ),
        ),
        Container(
            height: 45,
            width: 25,
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
                color: Colors.teal.withOpacity(0.8),
                borderRadius: BorderRadius.circular(4)),
            child: const Icon(
              Icons.filter_alt_off,
              color: Colors.white,
            )),
      ],
    );
  }

  Widget numOfRowsSelectionSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 16, top: 24, bottom: 10),
          child: const Row(
            children: [
              Text("Show: "),
              DropdownMenu<String>(
                initialSelection: "4",
                dropdownMenuEntries: [
                  DropdownMenuEntry(value: "4", label: "1"),
                  DropdownMenuEntry(value: "5", label: "5"),
                  DropdownMenuEntry(value: "10", label: "10"),
                ],
              ),
              Text(" Items per page")
            ],
          ),
        ),
        Container(
          margin:
              const EdgeInsets.only(left: 16, top: 24, bottom: 10, right: 16),
          child: Row(
            children: [
              const Text(
                "Global Search:  ",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.30,
                  height: 35,
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 16),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey.withOpacity(0.2))),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey.withOpacity(0.2))),
                    ),
                  ))
            ],
          ),
        ),
      ],
    );
  }

  Widget mobileDropDownSection() {
    return Container(
      margin: const EdgeInsets.only(left: 16, top: 24, bottom: 24),
      child: const Row(
        children: [
          Text("Show: "),
          DropdownMenu<String>(
            initialSelection: "4",
            dropdownMenuEntries: [
              DropdownMenuEntry(value: "4", label: "4"),
              DropdownMenuEntry(value: "5", label: "5"),
              DropdownMenuEntry(value: "10", label: "10"),
            ],
          ),
          Text(" Items")
        ],
      ),
    );
  }

  Widget binListTable() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(10)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
            headingRowColor: WidgetStateProperty.resolveWith((ctx) {
              return Colors.teal[100]?.withOpacity(0.1);
            }),
            dividerThickness: 0,
            columns: const [
              DataColumn(
                label: Text(
                  "Bin Number",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  "Occupied/Capacity",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  "Storage Area",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  "Storage Type",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  "Storage Section",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  "Status",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
            rows: List.generate(_lpnListViewModel.binListData!.length, (index) {
              final item = _lpnListViewModel.binListData![index];
              return DataRow(
                color: WidgetStateProperty.resolveWith((ctx) {
                  if (index % 2 == 1) {
                    return Colors.teal[100]?.withOpacity(0.1);
                  } else {
                    return Colors.transparent;
                  }
                }),
                cells: [
                  DataCell(Text(
                    item.binNumber ?? "",
                    style: const TextStyle(color: Colors.teal),
                  )),
                  DataCell(Text("${item.pkgQuantity}/${item.quantity}" ?? "")),
                  DataCell(Text(item.storageLocation ?? "")),
                  DataCell(Text(item.storageType ?? "")),
                  DataCell(Text(item.storageSection ?? "")),
                  DataCell(Text(item.binStatus ?? "")),
                ],
              );
            })),
      ),
    );
  }

  Widget paginationSection() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.keyboard_double_arrow_left,
              color: Colors.grey.shade500,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.grey.shade500,
            ),
          ),
          SizedBox(
            width: 20,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: Colors.teal.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              child: const Text("1",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500)),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.grey.shade500,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.keyboard_double_arrow_right,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }

  Widget tableFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.016,
              bottom: MediaQuery.of(context).size.height * 0.024,
              right: MediaQuery.of(context).size.width * 0.016),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
            child: const Text("Cancel",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w500)),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: FutureBuilder(
              future: _lpnListViewModel.getLpnListData(),
              builder: (ctx, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text("error ${snapshot.error}");
                } else {
                  return Container(
                    margin: kIsWeb
                        ? EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.height * 0.05,
                            vertical: MediaQuery.of(context).size.height * 0.03)
                        : const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              "Global Search:  ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.30,
                                height: 35,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 16),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Colors.grey.withOpacity(0.2))),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                Colors.grey.withOpacity(0.2))),
                                  ),
                                ))
                          ],
                        ),
                        Text("${MediaQuery.of(context).size.height} ff ${MediaQuery.of(context).size.width}}"),
                        SingleChildScrollView(
                          scrollDirection: MediaQuery.of(context).size.width < 1360 ? Axis.horizontal : Axis.vertical,
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color: Colors.grey[200] ?? Colors.red),
                                borderRadius: BorderRadius.circular(10)),
                            child: SingleChildScrollView(
                              scrollDirection:
                                  kIsWeb ? Axis.vertical : Axis.horizontal,
                              child: DataTable(
                                headingRowColor:
                                    WidgetStateProperty.resolveWith((ctx) {
                                  return Colors.teal[100]?.withOpacity(0.1);
                                }),
                                dividerThickness: 0,
                                columns: const [
                                  DataColumn(
                                    label: Row(
                                      children: [
                                        Text(
                                          "LPN Number",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(Icons.filter_alt_outlined),
                                      ],
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "LPN Type",
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "Storage Area",
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "Quantity",
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Row(
                                      children: [
                                        Text(
                                          "SKU Description",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(Icons.filter_alt_outlined),
                                      ],
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "Destination",
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "Actions",
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                                rows: List.generate(
                                    _lpnListViewModel.lpnListdata!.length,
                                    (index) {
                                  final item =
                                      _lpnListViewModel.lpnListdata![index];
                                  return DataRow(
                                    color: WidgetStateProperty.resolveWith((ctx) {
                                      if (index % 2 == 1) {
                                        return Colors.teal[100]?.withOpacity(0.1);
                                      } else {
                                        return Colors.transparent;
                                      }
                                    }),
                                    cells: [
                                      DataCell(Text(item.lpnNumber ?? "")),
                                      DataCell(Text(item.lpnType ?? "")),
                                      DataCell(Text(item.storageLocation ?? "")),
                                      DataCell(Text(item.quantity ?? "")),
                                      DataCell(Text(
                                          '${item.skuCode} - ${item.skuDescription}')),
                                      DataCell(SizedBox(
                                        height: 35,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(left: 16),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey
                                                        .withOpacity(0.2))),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey
                                                        .withOpacity(0.2))),
                                          ),
                                        ),
                                      )),
                                      DataCell(IconButton(
                                        onPressed: () {
                                          displayAlert(context);
                                        },
                                        icon: const Icon(
                                          Icons.manage_search_rounded,
                                          color: Colors.teal,
                                        ),
                                      )),
                                    ],
                                  );
                                }),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          height: 1,
                          color: Colors.grey.withOpacity(0.2),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.teal.withOpacity(0.5),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5))),
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.teal.withOpacity(0.5),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              child: const Text("Save All",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }
              }),
        ));
  }
}
