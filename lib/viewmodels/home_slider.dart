class BannerItem {
  String id;
  String imageUrl;
  BannerItem({required this.id, required this.imageUrl});
  factory BannerItem.fromJson(Map<String, dynamic> json) {
    print('teyodebug: BannerItem.fromJson called with json: $json');
    print('teyodebug: JSON keys available: ${json.keys}');
    
    // 尝试多种可能的字段名
    String idValue = json["id"] ?? "";
    String imageUrlValue = json["imgUrl"] ?? "沒有啊******************";
    
    print('teyodebug: Parsed id: $idValue');
    print('teyodebug: Parsed imageUrl: $imageUrlValue');
    
    return BannerItem(
      id: idValue,
      imageUrl: imageUrlValue,
    );
  }
}
