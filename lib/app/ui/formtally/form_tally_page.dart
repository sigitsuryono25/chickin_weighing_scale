import 'package:chickin_weighting_scale/app/controller/form_tally_controller.dart';
import 'package:chickin_weighting_scale/app/database/model/barang_masuk.dart';
import 'package:chickin_weighting_scale/app/theme/app_color.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../partial/app_bar.dart';
import '../partial/table_helper.dart';

class FormTallyPage extends GetView<FormTallyController> {
  FormTallyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(
            title: "Form Tally",
            subtitle: "INBOUND dari UNION ke ABF 1",
            context: context),
        body: SingleChildScrollView(
          child: GetBuilder<FormTallyController>(
            builder: (tallyController) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 300,
                      child: FutureBuilder<Stream<List<BarangMasukEntity>>>(
                        future: tallyController.getSavedData(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return StreamBuilder(
                                stream: snapshot.requireData,
                                builder: (_, ss) {
                                  if (!ss.hasData) return Container();
                                  final barang = ss.requireData;
                                  return tableDetail(barang, tallyController);
                                });
                          } else {
                            return const Center(
                              child: Text("Belum ada Data"),
                            );
                          }
                        },
                      ),
                    ),
                    const Center(
                      child: Text("Tekan dan tahan baris yang ingin diedit", style: TextStyle(color: Colors.red),),
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
                              DropdownButtonFormField2(
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
                                    tallyController.selectedJenis = value;
                                  })
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
                              )
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
                                    )
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
                                          onChanged: (val) =>
                                              tallyController.toggle(),
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
