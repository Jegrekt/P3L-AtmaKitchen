import 'package:atma_kitchen_app/presentation/pages/home/admin/main_page_admin.dart';
import 'package:atma_kitchen_app/presentation/pages/home/customer/main_page_customer.dart';
import 'package:atma_kitchen_app/presentation/pages/home/manager/main_page_manager.dart';
import 'package:atma_kitchen_app/presentation/pages/home/owner/main_page_owner.dart';
import 'package:flutter/widgets.dart';

class Routes {
  static const Map<String, Widget> routes = {
    'adm': MainPageAdmin(),
    'mo': MainPageManager(),
    'own': MainPageOwner(),
    'c': MainPageCustomer(),
  };
}
