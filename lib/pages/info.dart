import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 25,
              left: 10,
              right: 10,
              bottom: 50,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Info Page',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'To reset the counter, double tap the count.',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'To delete a counter, long press on the count.',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const Divider(),
                const Text(
                  'WearOS Counter',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Created by: Zbejas',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                // todo: text back button
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    'Go Back',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
