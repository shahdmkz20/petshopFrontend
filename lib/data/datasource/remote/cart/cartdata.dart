
import '../../../../api_links.dart';
import '../../../../core/class/crud.dart';

class CartData{
  CRUD crud ;
  CartData(this.crud);
  addToCart(String userEmail , String itemId) async{
    var response  = await crud.postData(AppLink.addToCart, {
      "userEmail" :userEmail ,
      "itemId" :itemId ,
    });
    return response.fold((l) => l, (r) => r);
  }

    deleteFromCart(String userEmail , String itemId) async{
    var response  = await crud.postData(AppLink.deleteFromCart, {
      "userEmail" :userEmail ,
      "itemId" :itemId ,
    });
    return response.fold((l) => l, (r) => r);
  }


   getItemCount(String userEmail , String itemId) async{
    var response  = await crud.postData(AppLink.getItemCount, {
      "userEmail" :userEmail ,
      "itemId" :itemId ,
    });
    return response.fold((l) => l, (r) => r);
  }

  
   viewCart(String userEmail ) async{
    var response  = await crud.postData(AppLink.viewCart, {
      "userEmail" :userEmail ,
    });
    return response.fold((l) => l, (r) => r);
  }
}
