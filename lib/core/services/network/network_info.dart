abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> get isConnected async {
    // TODO: implement actual connectivity check using connectivity_plus or internet_connection_checker
    return true; 
  }
}
