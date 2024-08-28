import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iamport_flutter/iamport_payment.dart';
import 'package:iamport_flutter/model/payment_data.dart';

class Payment extends StatelessWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, Object>;
    final userCode = arguments['userCode']! as String;
    final data = arguments['data']! as PaymentData;

    return IamportPayment(
      appBar: AppBar(
        title: const Text('아임포트 결제'),
        centerTitle: true,
        titleTextStyle: const TextStyle(fontSize: 24, color: Colors.white),
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: Get.back,
        ),
      ),
      initialChild: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/iamport-logo.png'),
              const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
              const Text('잠시만 기다려주세요...', style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
      userCode: userCode,
      data: data,
      callback: (Map<String, String> result) async {
        await Get.offNamed<Map<String, String>>(
          '/payment-result',
          arguments: result,
        );
      },
    );
  }
}
