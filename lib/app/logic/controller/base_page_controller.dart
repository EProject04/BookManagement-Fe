


import 'package:frame/app/logic/controller/getx_controller_inject.dart';
import 'package:get/get.dart';

class BaseGetPageController extends BaseGetController{

  var loadState = 0.obs;

  int page = 1;

  var isInit = true;

  var controller;

  showSuccess(List suc){
    loadState.value = suc.isNotEmpty ? 1 : 2;
  }


  showError(){
    loadState.value = 3;
  }

  showLoading(){
    loadState.value = 0;
  }

  // initPullLoading(RefreshController controller){
  //   if(isInit){
  //     this.controller = controller;
  //     requestData(controller);
  //   }
  // }
  //
  // onLoadRefresh(RefreshController controller){
  //   page = 1;
  //   requestData(controller , refresh :Refresh.pull);
  // }
  //
  // onLoadMore(RefreshController controller){
  //   ++ page;
  //   requestData(controller ,refresh :Refresh.down);
  // }
  //
  //
  // void requestData(RefreshController controller , {Refresh refresh = Refresh.first}) {}



}