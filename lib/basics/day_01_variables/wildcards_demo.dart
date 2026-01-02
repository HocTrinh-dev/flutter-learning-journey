void main() {
  print('--- DART WILDCARD VARIABLES (Dart 3.7+) ---');

  // 1. Local Variable (Biến cục bộ)
  // Khai báo bao nhiêu cái _ cũng được, không bị lỗi trùng tên.
  var _ = 100;
  int _ = 200;
  String _ = "Hello";

  // print(_); // LỖI NGAY: Local variable '_' can't be referenced.
  // (Vì nó là Wildcard, không phải biến, nên không gọi ra dùng được)

  // 2. Trong vòng lặp (For loop)
  // Trước đây: for (var i = 0; ...). Giờ không cần i thì dùng _
  var list = ['A', 'B', 'C'];
  print("Chạy vòng lặp 3 lần (không quan tâm phần tử là gì):");
  for (var _ in list) {
    print("Keep working...");
  }

  // 3. Trong hàm Callback (Cực kỳ hữu ích cho Flutter)
  // Ví dụ: Một hàm trả về (String name, int age) nhưng ta không cần cả 2.

  // Giả lập hàm xử lý
  void handleUser(void Function(String, int) callback) {
    callback("Tèo", 25);
  }

  // Cách dùng mới: Dùng 2 cái _ thoải mái
  handleUser((_, _) {
    print("Đã xử lý xong user (không quan tâm tên tuổi)");
  });

  // 4. Try-Catch
  try {
    throw Exception("Lỗi test");
  } catch (_) {
    // Không cần biến 'e' hay 'stackTrace'
    print("Đã bắt được lỗi, nhưng không thèm đọc nội dung lỗi.");
  }
}
