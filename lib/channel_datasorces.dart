import 'dart:convert';
import 'package:flutter_pos_ecommerce/core/constants/global_variable.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/auth_local_datasource.dart';
import 'package:http/http.dart' as http;

Future<String> createNewChannel() async {
  final authData = await AuthLocalDatasource().getAuthData();
  final response = await http.post(
    Uri.parse('${GlobalVariable.baseUrl}/api/send-message'), // Ganti dengan URL endpoint Anda
    headers: {
       'Authorization': 'Bearer ${authData?.accessToken}',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
    },
    body: {
      
    },
  );

  if (response.statusCode == 201) {
    final jsonResponse = json.decode(response.body);
    return jsonResponse['channel_id']; // Channel ID diperoleh dari respons API
  } else {
    throw Exception('Failed to create new channel');
  }
}
