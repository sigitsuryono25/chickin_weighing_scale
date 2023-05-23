import 'package:chickin_weighing_scale/app/ui/theme/app_color.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constant.dart';
import '../../utils/utils.dart';
import '../controller/form_tally_controller.dart';
import '../data/source/local/database/model/barang_masuk.dart';
import 'partial/app_bar.dart';
import 'partial/table_helper.dart';

class FormTallyPage extends GetView<FormTallyController> {
  FormTallyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(
            title: "Form Tally",
            subtitle: "${controller.itemModel?.type} dari ${controller.itemModel?.from} ke ${controller.itemModel?.taskName}",
            context: context),
        body: SingleChildScrollView(
          child: GetBuilder<FormTallyController>(
            builder: (tallyController) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    FutureBuilder<Stream<List<BarangMasukEntity>>>(
                      future: tallyController.getSavedData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return StreamBuilder(
                            stream: snapshot.requireData,
                            builder: (_, ss) {
                              if (!ss.hasData) {
                                return const Text("Belum ada Data");
                              } else {
                                final barang = ss.requireData;
                                controller.hasData = barang.isNotEmpty;
                                print(controller.hasData);
                                if (barang.isEmpty) {
                                  return const Text(
                                    "Belum ada data",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22.0),
                                  );
                                } else {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: 300,
                                        child: tableDetail(
                                            barang, tallyController),
                                      ),
                                      const Center(
                                        child: Text(
                                          "Edit/Hapus, Tahan 1 Baris",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  );
                                }
                              }
                            },
                          );
                        } else {
                          return const Center(
                            child: Text(
                              "Belum ada Data",
                            ),
                          );
                        }
                      },
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("No"),
                              TextField(
                                controller: tallyController.noController,
                                readOnly: true,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Jenis"),
                              Obx(
                                () => DropdownButtonFormField2(
                                    value: controller.selectedJenis.value == ""
                                        ? controller.items[0]
                                        : controller.selectedJenis.value,
                                    hint: const Text("Pilih Jenis"),
                                    decoration: const InputDecoration(
                                        contentPadding:
                                            EdgeInsets.fromLTRB(0, 20, 8, 20),
                                        border: OutlineInputBorder()),
                                    items: tallyController.items
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      tallyController.selectedJenis.value =
                                          value.toString();
                                    }),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Ekor"),
                              TextField(
                                controller: tallyController.ekorController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              Obx(() {
                                if (tallyController.isEkorEmpty.value) {
                                  return const Text(
                                    "Ekor tidak boleh kosong",
                                    style: TextStyle(color: Colors.red),
                                  );
                                } else {
                                  return Container();
                                }
                              })
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Bobot (kg)"),
                                    Obx(
                                      () => TextField(
                                        readOnly: tallyController.on.value,
                                        controller:
                                            tallyController.bobotController,
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                    Obx(() {
                                      if (tallyController.isBobotEmpty.value) {
                                        return const Text(
                                          "Bobot tidak boleh kosong",
                                          style: TextStyle(color: Colors.red),
                                        );
                                      } else {
                                        return Container();
                                      }
                                    }),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Auto ?",
                                    style: TextStyle(
                                        color: global_palette_gray_900),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: 70,
                                    child: Obx(
                                      () => Switch(
                                          onChanged: (val) {
                                            tallyController.toggle();
                                            tallyController.sharedPref().then(
                                                  (value) => value.setBool(
                                                      Constant
                                                          .IS_AUTO_VALUE_BOBOT,
                                                      tallyController.on.value),
                                                );

                                            tallyController.sharedPref().then(
                                                  (value) => print(
                                                    value.getBool(Constant
                                                        .IS_AUTO_VALUE_BOBOT),
                                                  ),
                                                );
                                          },
                                          value: tallyController.on.value),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Tanggal Produksi"),
                              TextField(
                                controller:
                                    tallyController.tanggalProduksiController,
                                readOnly: true,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.calendar_today),
                                    onPressed: () {
                                      dateTimePicker(
                                          context,
                                          (dateTime) => {
                                                if (dateTime != null)
                                                  setSelectedDateToController(
                                                      formattedDateTime(
                                                          dateTime,
                                                          format: "dd/MM/yyyy"),
                                                      tallyController
                                                          .tanggalProduksiController)
                                              },
                                          isUsingTime: false);
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                tallyController.populateInput();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: buttonColor,
                              ),
                              child: const Text("Update Data",
                                  style: TextStyle(color: black)),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
