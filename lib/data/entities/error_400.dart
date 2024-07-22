class Error400 {
  final String? message;
  final String? title;
  final DebugInfo? debugInfo;

  Error400({this.message, this.title, this.debugInfo});

  factory Error400.fromJson(Map<String, dynamic> json) {
    return Error400(
        message: json['message'] ?? "",
        title: json['title'] ?? "",
        debugInfo: DebugInfo.fromJson(json["debug_info"] ?? {}));
  }
}

class DebugInfo {
  String? correlationId;

  DebugInfo({this.correlationId});

  factory DebugInfo.fromJson(Map<String, dynamic> json) {
    return DebugInfo(correlationId: json["correlation-id"] ?? "");
  }
}
