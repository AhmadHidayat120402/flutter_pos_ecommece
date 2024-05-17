import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/responses/cost_response_model.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/responses/product_response_model.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/home/models/product_quantity.dart';
import 'package:flutter_pos_ecommerce/module/pos/presentation/order/models/order_model.dart';
import 'package:sqflite/sqflite.dart';

class ProductLocalDatasource {
  ProductLocalDatasource._init();

  static final ProductLocalDatasource instance = ProductLocalDatasource._init();

  final String tableProducts = 'products';
  // final String tableOrder = 'orders';
  // final String tableOrderItem = 'order_items';

  static Database? _database;

  //                "id": 8,
  //               "category_id": 2,
  //               "name": "Mr. Jamel Collier Jr.",
  //               "price": 35,
  //               "stock": 29,
  //               "image": "https://via.placeholder.com/640x480.png/008800?text=nam",
  //               "is_available": 1,
  //               "description": "Amet quasi est ad non. Qui voluptates nesciunt amet hic vel et sapiente. Omnis rem odit veniam unde fuga aspernatur.",
  //               "deleted_at": null,
  //               "created_at": "2024-02-26T03:39:25.000000Z",
  //               "updated_at": "2024-02-26T03:39:25.000000Z"

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableProducts (
      id INTEGER PRIMARY KEY,
      productId INTEGER,
      categoryId INTEGER,
      categoryName TEXT,
      name TEXT,
      price INTEGER,
      stock INTEGER,
      image TEXT,
      isAvailable INTEGER,
      description TEXT,
      createdAt TEXT,
      updatedAt TEXT,
      is_sync INTEGER DEFAULT 0
      )
    ''');

    // await db.execute('''
    //   CREATE TABLE orders (
    //     id INTEGER PRIMARY KEY AUTOINCREMENT,
    //     nominal INTEGER,
    //     payment_method TEXT,
    //     total_item INTEGER,
    //     id_kasir INTEGER,
    //     nama_kasir TEXT,
    //     is_sync INTEGER DEFAULT 0
    //   )
    // ''');
    await db.execute('''
      CREATE TABLE orders (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        address_id INTEGER DEFAULT 1,
        payment_amount INTEGER,
        subtotal INTEGER,
        tax INTEGER,
        discount INTEGER,
        service_charge INTEGER,
        total_cost INTEGER,
        payment_method TEXT,
        total_item INTEGER,
        id_kasir INTEGER,
        nama_kasir TEXT,
        transaction_time TEXT,
        is_sync INTEGER DEFAULT 0
      )
    ''');

    //  await db.execute('''
    //   CREATE TABLE order_items (
    //     id INTEGER PRIMARY KEY AUTOINCREMENT,
    //     id_order INTEGER,
    //     id_product INTEGER,
    //     quantity INTEGER,
    //     price INTEGER
    //   )
    // ''');

    await db.execute('''
      CREATE TABLE order_items (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        id_order INTEGER,
        id_product INTEGER,
        quantity INTEGER,
        price INTEGER
      )
    ''');
  }

  // Future<int> saveOrder(OrderModel order) async {
  //   final db = await instance.database;
  //   int id = await db.insert('orders', order.toMapForLocal());
  //   for (var orderItem in order.orders) {
  //     await db.insert('order_items', orderItem.toMapForLocal(id));
  //   }
  //   return id;
  // }

  Future<void> saveOrder(OrderModel order) async {
    final db = await instance.database;
    int id = await db.insert('orders', order.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    print("order id: $id");
    print('subtotal ${order.subtotal}');
    print('tax ${order.tax}');
    print('discount ${order.discount}');
    print('service_charge ${order.serviceCharge}');
    print('total_cost ${order.total_cost}');
    print('order to map : ${order.toMap()}');

    for (var item in order.orderItems) {
      await db.insert('order_items', item.toLocalMap(id),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

//get order by isSync = 0
  // Future<List<OrderModel>> getOrderByIsSync() async {
  //   final db = await instance.database;
  //   final result = await db.query('orders', where: 'is_sync = 0');

  //   return result.map((e) => OrderModel.fromLocalMap(e)).toList();
  // }

  //get data order
  Future<List<OrderModel>> getOrderByIsNotSync() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps =
        await db.query('orders', where: 'is_sync = ?', whereArgs: [0]);
    final results = List.generate(
      maps.length,
      (i) {
        return OrderModel.fromMap(maps[i]);
      },
    );
    print('order model from map $results');
    return results;
  }

  Future<List<OrderModel>> getOrderByIsSync() async {
    final db = await instance.database;
    final result = await db.query('orders', where: 'is_sync = 0');

    return result.map((e) => OrderModel.fromLocalMap(e)).toList();
  }

  //get all orders
  Future<List<OrderModel>> getAllOrder() async {
    final db = await instance.database;
    final result = await db.query('orders', orderBy: 'id DESC');
    return result.map((e) => OrderModel.fromLocalMap(e)).toList();
  }

  Future<List<OrderModel>> getAllOrders(
    DateTime start,
    DateTime end,
  ) async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      "orders",
      // where: 'transaction_time BETWEEN ? AND ?',
      // whereArgs: [
      //   DateFormat.yMd().format(start),
      //   DateFormat.yMd().format(end)
      // ],
    );
    return List.generate(maps.length, (i) {
      return OrderModel.fromMap(maps[i]);
    });
  }

  //get order item by order id
  Future<List<ProductQuantity>> getOrderItemByOrderId(int orderId) async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db
        .query('order_items', where: 'id_order = ?', whereArgs: [orderId]);
    final result = List.generate(maps.length, (i) {
      return ProductQuantity.fromLocalMap(maps[i]);
    });
    print('result get $result');
    return result;
  }

  Future<void> updateOrderIsSync(int orderId) async {
    final db = await instance.database;
    await db.update('orders', {'is_sync': 1},
        where: 'id = ?', whereArgs: [orderId]);
    print('order id di sqlite $orderId');
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = dbPath + filePath;

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('pos30.db');
    return _database!;
  }

// insert product
  Future<Product> insertProduct(Product product) async {
    final db = await instance.database;
    int id = await db.insert(
      tableProducts,
      product.toLocalMap(),
    );
    return product.copyWith(id: id);
  }

  //insert data product from list product
  Future<void> insertAllProduct(List<Product> products) async {
    final db = await instance.database;
    for (var product in products) {
      await db.insert(tableProducts, product.toLocalMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
      print('insert success ${product.name}');
    }
  }

  //get all data product
  Future<List<Product>> getAllProduct() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(tableProducts);
    return List.generate(maps.length, (i) {
      return Product.fromLocalMap(maps[i]);
    });
  }

  // Future<Either<String, ProductResponseModel>> getAllProduct() async {
  //   try {
  //     final db = await instance.database;
  //     final List<Map<String, dynamic>> maps = await db.query(tableProducts);
  //     final List<Product> products = List.generate(maps.length, (i) {
  //       return Product.fromLocalMap(maps[i]);
  //     });
  //   final data<Map<String, dynamic>> = ProductResponseModel(data: products);
  //     return Right(ProductResponseModel.fromMap(data));
  //     // return ProductResponseModel(data: products);
  //   } catch (e) {
  //     return ProductResponseModel(data: [], message: e.toString());
  //   }
  // }

  //remove all data product
  Future<void> deleteAllProducts() async {
    final db = await instance.database;
    await db.delete(tableProducts);
  }
}
