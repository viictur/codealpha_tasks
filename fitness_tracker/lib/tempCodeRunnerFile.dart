Future<String> getServerTime() async {
    // simulate delay
    await Future.delayed(Duration(seconds: 2));
    return 'DateTime.now()'; // returns DateTime wrapped in Future
  }