
import '../../../../api_links.dart';
import '../../../../core/class/crud.dart';

class HomeData{
  CRUD crud ;
  HomeData(this.crud);
  getData() async{
    var response  = await crud.postData(AppLink.home, {});
    return response.fold((l) => l, (r) => r);
  }

    searchData(String search) async{
    var response  = await crud.postData(AppLink.search, {
      "search" : search
    });
    return response.fold((l) => l, (r) => r);
  }

}
