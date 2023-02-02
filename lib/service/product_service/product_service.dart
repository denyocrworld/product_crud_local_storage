import 'package:hyper_ui/core.dart';

class ProductService {
  static List products = [];
  static add(Map newProduct) {
    newProduct["id"] = DateTime.now().millisecondsSinceEpoch;
    products.add(newProduct);
    saveToLocalStorage();
  }

  static delete(Map product) {
    products.remove(product);
    saveToLocalStorage();
  }

  static update({
    required int id,
    required Map value,
  }) {
    var index = products.indexWhere((product) => product["id"] == id);
    products[index] = value;
    saveToLocalStorage();
  }

  static saveToLocalStorage() {
    mainStorage.put("products", products);
  }

  static loadFromLocalStorage() {
    products = mainStorage.get("products") ?? [];
  }
}
