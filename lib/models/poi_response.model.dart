class POIResponse {
  final List<dynamic> items;
  final int skip;
  final int limit;
  final int count;
  final int total;
  final bool morePages;

  const POIResponse(
      {this.items = const [], this.skip = 0, this.limit = 0, this.count = 0, this.total = -1, this.morePages = false});

  factory POIResponse.fromJSON(Map<String, dynamic> json) => POIResponse(
        items: json['items'],
        skip: json['skip'],
        limit: json['limit'],
        count: json['count'],
        total: json['total'],
        morePages: json['more_pages'],
      );
}
