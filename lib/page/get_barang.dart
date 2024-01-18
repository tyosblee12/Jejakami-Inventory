//* TODO
// int? albumId;
// int? id;
// String? title;
// String? url;
// String? thumbnailUrl;

// Post({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

// Post.fromJson(Map<String, dynamic> json) {
// albumId = json['albumId'];
// id = json['id'];
// title = json['title'];
// url = json['url'];
// thumbnailUrl = json['thumbnailUrl'];
// }

class Barang {
  final String nama_brg;
  final String id_brg;
  final int stock;
  final int harga;

  const Barang({
    required this.id_brg,
    required this.nama_brg,
    required this.harga,
    required this.stock,
  });

  factory Barang.fromJson(Map<String, dynamic> json) {
    return Barang(
      id_brg: json['id_brg'] as String,
      nama_brg: json['nama_brg'] as String,
      stock: json['stock'],
      harga: json['harga'],
    );
  }
}
