import 'package:flutter/material.dart';
import 'package:flutter_pos_ecommerce/core/router/app_router.dart';
import 'package:flutter_pos_ecommerce/module/ecommerce/data/datasources/auth_local_datasource.dart';
import 'package:flutter_tawk/flutter_tawk.dart';
import 'package:go_router/go_router.dart';

class ChatPageEcommerce extends StatefulWidget {
  const ChatPageEcommerce({super.key});

  @override
  State<ChatPageEcommerce> createState() => _ChatPageEcommerceState();
}

class _ChatPageEcommerceState extends State<ChatPageEcommerce> {
  // Future<String> _initializePage() async {
  //   await Future.delayed(const Duration(seconds: 3));
  //   final authData = await AuthLocalDatasource().getAuthData();
  //   final role = authData?.user?.roles;
  //   final name = authData?.user?.name;
  //   final email = authData?.user?.email;
  //   if (role == 'owner' || role == 'kasir') {
  //     return name.toString();
  //   } else if (role == 'member') {
  //     return name.toString();
  //   } else {
  //     return email.toString();
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // _initializePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Tawk(
        directChatLink:
            'https://tawk.to/chat/6642c15e9a809f19fb3097d8/1htqc6mpr',
        visitor: TawkVisitor(
          name: "dayat",
          email: 'dayat12@gmail.com',
        ),
      ),
    );
  }
}
