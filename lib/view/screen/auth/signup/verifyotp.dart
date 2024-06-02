import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../controller/auth/signupcontrollers/verifyotp.dart';
import '../../../../core/class/statusrequest.dart';
import '../../../../core/constants/imageassets.dart';
import '../../../reusable/mediumbodytext.dart';
import '../../../widget/auth/signup/verifyotp.dart';

class VerifyOTP extends StatelessWidget {
  const VerifyOTP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyOTPcontrollerImp controller = VerifyOTPcontrollerImp();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '26'.tr,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: controller.statusRequest == StatusRequest.loading
              ? const Text(ImageAssets.loading)
              : Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  child: ListView(
                    children: [
                      Image.asset(
                        ImageAssets.otp,
                        width: 200,
                        height: 200,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MediumBodyText(
                          text: '27'.tr), //enter email to reset password
                      const SizedBox(
                        height: 15,
                      ),
                      const VerifyOTPfield(),
                      SizedBox(height: 10,),
                      InkWell(
                        onTap: (){
                          controller.resendCode();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('resend code ') , 
                            Icon(Icons.redo_sharp) ,
                        ],),
                      )
                    ],
                  ))),
    );
  }
}
