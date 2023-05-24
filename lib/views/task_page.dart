import 'dart:convert';

import 'package:chickin_weighing_scale/shared/constants/ColorConstants.dart';
import 'package:chickin_weighing_scale/shared/helpers/DateExtension.dart';
import 'package:chickin_weighing_scale/views/partial/AppBar.dart';
import 'package:chickin_weighing_scale/views/partial/TableHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';

import '../controllers/task/task_controller.dart';
import '../models/entity/BarangMasukEntity.dart';
import '../shared/utils.dart';
import '../routes/Routes.dart';

class TaskTimbangPage extends GetView<TaskController> {
  TaskTimbangPage({super.key});

  final globalKeyFab = GlobalKey<ExpandableFabState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: appBarWithSubtitleLeftRightIcon(
          title: "Task Timbang",
          subtitle:
              "${controller.itemModel?.type} dari ${controller.itemModel?.from} ke ${controller.itemModel?.taskName}",
          context: context,
          rightIcon: Obx(
            () => Icon(controller.icons.value,
                color: controller.iconColors.value),
          ),
        ),
        body: Container(
          color: layer0,
          child: SingleChildScrollView(
            controller: controller.hideButtonController,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GetBuilder<TaskController>(
                    builder: (controller) {
                      return Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Waktu Kedatangan Kendaraan"),
                                TextField(
                                  controller:
                                      controller.waktuKedatanganKendaraan,
                                  readOnly: true,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Suhu"),
                                TextField(
                                  controller: controller.suhu,
                                  readOnly: true,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Nomor Segel"),
                                TextField(
                                  controller: controller.noSegel,
                                  readOnly: true,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Waktu Timbang"),
                                TextField(
                                  controller: controller.waktuTimbang,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        dateTimePicker(
                                            context,
                                            (dateTime) => {
                                                  if (dateTime != null)
                                                    controller
                                                            .waktuTimbang.text =
                                                        dateTime
                                                            .formattedDateTime()
                                                });
                                      },
                                      icon: const Icon(Icons.calendar_today),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Waktu Selesai Timbang"),
                                TextField(
                                  controller: controller.waktuTimbangSelesai,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    suffixIcon: IconButton(
                                      icon: const Icon(Icons.calendar_today),
                                      onPressed: () {
                                        dateTimePicker(
                                            context,
                                            (dateTime) => {
                                                  if (dateTime != null)
                                                    controller
                                                            .waktuTimbangSelesai
                                                            .text =
                                                        dateTime
                                                            .formattedDateTime()
                                                });
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Tabel Ringkasan"),
                              SizedBox(
                                height: 300,
                                child: FutureBuilder<
                                    Stream<List<BarangMasukEntity>>>(
                                  future: controller.getAllDataBarang(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return StreamBuilder(
                                          stream: snapshot.requireData,
                                          builder: (_, ss) {
                                            if (!ss.hasData) return Container();
                                            final barang = ss.requireData;
                                            if (barang.isEmpty) {
                                              return const Center(
                                                child: Text(
                                                  "Belum ada data",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 22.0),
                                                ),
                                              );
                                            } else {
                                              return tableRingkasan(barang);
                                            }
                                          });
                                    } else {
                                      return Container();
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    ;
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: buttonColor,
                                  ),
                                  child: const Text("Submit Data",
                                      style: TextStyle(color: black)),
                                ),
                              )
                            ],
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: Obx(
          () => Visibility(
            visible: controller.isVisible.value,
            child: ExpandableFab(
              child: const Icon(Icons.play_arrow_rounded),
              key: globalKeyFab,
              type: ExpandableFabType.up,
              overlayStyle:
                  ExpandableFabOverlayStyle(color: gray700.withOpacity(0.5)),
              children: [
                FloatingActionButton.extended(
                  heroTag: "form-tally",
                  onPressed: () {
                    final state = globalKeyFab.currentState;
                    if (state?.isOpen == true) {
                      state?.toggle();
                    }
                    Get.toNamed(Routes.FORM_TALLY,
                        arguments: jsonEncode(controller.itemModel?.toJson()));
                  },
                  label: const Text("Form Tally"),
                  icon: const Icon(Icons.add),
                ),
                FloatingActionButton.extended(
                  heroTag: "add-device",
                  onPressed: () {
                    final state = globalKeyFab.currentState;
                    if (state?.isOpen == true) {
                      state?.toggle();
                    }
                    Get.toNamed(Routes.BLUETOOTH);
                  },
                  tooltip: "Add Bluetooth Device",
                  label: const Text("Add Device"),
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
