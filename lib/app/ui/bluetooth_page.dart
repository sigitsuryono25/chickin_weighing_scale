import 'package:chickin_weighing_scale/app/ui/partial/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/bluetooth_controller.dart';

class BluetoothPage extends GetView<BluetoothController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:
            appBar(title: "Bluetooh Device", subtitle: "", context: context),
        body: GetBuilder<BluetoothController>(
          builder: (controller) {
            return Column(
              children: [
                StreamBuilder(
                  initialData: controller.listResult,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.requireData.isNotEmpty) {
                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: snapshot.requireData.length,
                            itemBuilder: (BuildContext ctx, int index) {
                              final data = snapshot.requireData;
                              return ListTile(
                                title: Text(data[index].device.name != ""
                                    ? data[index].device.name
                                    : data[index].device.id.id),
                                onTap: () {
                                  controller
                                      .connectToDevice(data[index].device);
                                },
                              );
                            });
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            controller.startScan();
          },
          label: const Text("Rescan"),
          icon: const Icon(Icons.refresh),
        ),
      ),
    );
  }
}
