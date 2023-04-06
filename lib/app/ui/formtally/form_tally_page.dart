import 'package:chickin_weighting_scale/app/controller/form_tally_controller.dart';
import 'package:chickin_weighting_scale/app/theme/app_color.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../partial/app_bar.dart';
import '../partial/table_helper.dart';

class FormTallyPage extends GetView<FormTallyController> {
  FormTallyPage({super.key});

  final controllers = Get.put(FormTallyController());
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];

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
            initState: (state) {
              Get.find<FormTallyController>().initDummyData();
            },
            builder: (tallyController) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 250,
                      child: tallyController.listBarangMasuk.isEmpty
                          ? const Center(child: Text("Belum ada Data"))
                          : tableDetail(tallyController),
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
                                  hint: const Text("Pilih Jens"),
                                  decoration: const InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(0, 20, 8, 20),
                                      border: OutlineInputBorder()),
                                  items: items.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (value) {})
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Bobot (kg)"),
                              TextField(
                                controller: tallyController.bobotController,
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
                              onPressed: () {},
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
