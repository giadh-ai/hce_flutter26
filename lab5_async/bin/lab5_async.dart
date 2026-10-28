import 'dart:async';
import 'dart:convert';
import 'dart:io';

class SanPham {
  const SanPham({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
  });

  final int id;
  final String title;
  final num price;
  final String category;

  factory SanPham.fromJson(Map<String, dynamic> json) {
    return SanPham(
      id: json['id'] as int,
      title: json['title'] as String,
      price: json['price'] as num,
      category: json['category'] as String,
    );
  }
}

Future<String> taiDuLieuNguoiDung(int id) async {
  print('Dang tai du lieu nguoi dung $id...');
  await Future.delayed(Duration(seconds: 3)); // gia lap do tre mang
  return 'Nguoi dung #$id: Nguyen Van A';
}

Future<List<SanPham>> taiDuLieuSanPham() async {
  final client = HttpClient();
  try {
    final request = await client.getUrl(
      Uri.parse('https://fakestoreapi.com/products'),
    );
    final response = await request.close();

    if (response.statusCode != HttpStatus.ok) {
      throw HttpException(
        'Tai san pham that bai: HTTP ${response.statusCode}',
        uri: request.uri,
      );
    }

    final responseBody = await response.transform(utf8.decoder).join();
    final decoded = jsonDecode(responseBody);
    if (decoded is! List) {
      throw const FormatException('Du lieu API khong phai la danh sach');
    }

    return decoded.map((item) {
      if (item is! Map) {
        throw const FormatException('Du lieu san pham khong hop le');
      }
      return SanPham.fromJson(Map<String, dynamic>.from(item));
    }).toList();
  } finally {
    client.close();
  }
}

void inBangSanPham(List<SanPham> sanPham) {
  final cacDong = sanPham
      .map(
        (item) => [
          item.id.toString(),
          item.title,
          item.price.toStringAsFixed(2),
          item.category,
        ],
      )
      .toList();
  const tieuDe = ['ID', 'Ten san pham', 'Gia', 'Danh muc'];
  final doRongCot = List.generate(tieuDe.length, (index) {
    return cacDong.fold(tieuDe[index].length, (width, row) {
      return row[index].length > width ? row[index].length : width;
    });
  });

  String taoDuongKe() =>
      '+${doRongCot.map((width) => '-' * (width + 2)).join('+')}+';
  String taoDong(List<String> cells) =>
      '| ${List.generate(cells.length, (index) => cells[index].padRight(doRongCot[index])).join(' | ')} |';

  print(taoDuongKe());
  print(taoDong(tieuDe));
  print(taoDuongKe());
  for (final row in cacDong) {
    print(taoDong(row));
  }
  print(taoDuongKe());
}



//-------------------------------------


Stream<int> demNguoc(int tu) async* {
  for (var i = tu; i >= 0; i--) {
  await Future.delayed(Duration(seconds: 1));
  yield i;
  }
}

void main(List<String> arguments) async {

await for (final giaTri in demNguoc(5)) {
print('Con lai: $giaTri');
}



  print('Bat dau chuong trinh');
  var soGiay = 0;
  final boDem = Timer.periodic(const Duration(seconds: 1), (_) {
    soGiay++;
    print('Da troi qua $soGiay giay');
  });

  try {
    final ketQua1 = await taiDuLieuNguoiDung(7);
    print(ketQua1);
    print('------------------');

    //-----------------------

    final batDau = DateTime.now();
    final ketQua = await Future.wait([
      taiDuLieuNguoiDung(1),
      taiDuLieuNguoiDung(2),
      taiDuLieuNguoiDung(3),
    ]);
    print(ketQua);
    print(
      'Tong thoi gian: ${DateTime.now().difference(batDau).inSeconds}  giay',
    );

    print('Dang tai danh sach san pham tu API...');
    final sanPham = await taiDuLieuSanPham();
    inBangSanPham(sanPham);

    throw Exception('Ngoai le thu nghiem');
  } catch (e) {
    print('Da xay ra loi: $e');
  } finally {
    boDem.cancel();
  }
}
