import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_17/helper/db_helper.dart';
import 'package:pas_mobile_11pplg1_17/models/FavoriteProduct.dart';
import 'package:pas_mobile_11pplg1_17/models/DataProduct.dart';

class FavoriteController extends GetxController {
  var favorites = <FavoriteProduct>[].obs;
  final db = DBHelper();

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final data = await db.getAll();
    favorites.value = data.map((e) => FavoriteProduct.fromMap(e)).toList();
  }

  Future<void> addFavorite(DataProduct p) async {
    final item = FavoriteProduct(
      id: p.id,
      title: p.title,
      image: p.image,
      price: p.price,
    );
    await db.insert(item.toMap());
    await loadFavorites();
  }

  Future<void> removeFavorite(int id) async {
    await db.delete(id);
    await loadFavorites();
  }

  bool isFavorite(int id) {
    return favorites.any((element) => element.id == id);
  }

  void toggleFavorite(DataProduct p) {
    if (isFavorite(p.id)) {
      removeFavorite(p.id);
    } else {
      addFavorite(p);
    }
  }
}
