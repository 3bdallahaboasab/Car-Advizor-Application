import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class CheckConnectionNetwork {
  Future<bool> get isConnected;
}

class CheckConnectionNetworkImplement implements CheckConnectionNetwork {
  final InternetConnectionChecker checker;

  CheckConnectionNetworkImplement({required this.checker});

  @override
  Future<bool> get isConnected => checker.hasConnection;
}
