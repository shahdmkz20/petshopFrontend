
import '../../../../api_links.dart';
import '../../../../core/class/crud.dart';

class ItemsData{
  CRUD crud ;
  ItemsData(this.crud);
  getData(String id) async{
    var response  = await crud.postData(AppLink.items, {'id' :  id.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
