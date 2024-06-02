import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';


import '../constants/imageassets.dart';
import 'statusrequest.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(ImageAssets.loading, width: 300))
        : statusRequest == StatusRequest.offlineFailure
            ? Center(child: Image.asset(ImageAssets.offline))
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child: Image.asset(ImageAssets.serverError,
                        width: 500, height: 500))
                : statusRequest == StatusRequest.unknownFailure
                    ? Center(
                        child:
                            Image.asset(ImageAssets.unknownError, width: 300))
                    : statusRequest == StatusRequest.failure
                        ? Center(child: Image.asset(ImageAssets.noData))
                        : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(ImageAssets.loading, width: 300))
        : statusRequest == StatusRequest.offlineFailure
            ? Center(child: Image.asset(ImageAssets.offline))
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child: Image.asset(ImageAssets.serverError,
                        width: 500, height: 500))
                : statusRequest == StatusRequest.unknownFailure
                    ? Center(
                        child:
                            Image.asset(ImageAssets.unknownError, width: 300))
                    : widget;
  }
}
