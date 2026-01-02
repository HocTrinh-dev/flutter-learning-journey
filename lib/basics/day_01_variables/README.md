# Day 01: Dart Variables

## 1. các biến của dart

- `String`: chuỗi văn bản.
- `int` : số nguyên.
- `double` : số thực.
- `bool` : true/false.
- `dynamic` : Type gì cũng nhận (nên dùng khi nhận JSON lạ).

## 2. Null Safety

- là ngôn ngữ đảm bảo tính an toàn cho giá trị null
- null safety introduces three key change
  1. when u specify a tyle for a variable, parameter, or another relevant component, you can `control whether(kiểm soát dữ liệu)` the type
     allows null. To enable nullability, u add a `?` in the end of the `type declaration(kiểu khai báo)`.
  - `String` : bắt buộc phải có dữ liệu.
  - `String?` : cho phép chứa giá trị `null`
  2. you must initialize variable before using them. Nullable variables default to null, so they are initialize by default.
     Dart dosen't set initial values to non-nullable types. It forces you to set an initial value. Dart dosen't allow you to `observe an uninitialized variable(quan sát một biến chưa được khởi tạo)`. This prevents you from accessing properties or calling methods `where the receiver's type can be null( khi kiểu dữ liệu của đối tượng nhận có thể là null)` but `null` dosen't support the method or property used.
  3. you can't access properties or call methods `on an expression with a nullable type(trên một biểu thức có thể là null)`. The same exception applies where it's property or method that `null supports` like hashcode or toString().
- tại sao cần ? -> để tránh lỗi `Null Reference Exception`

## 3. Default value

- Uninitialized variables that have a nullable type have an initial value of null. Even variables with numeric types are `initially(ban đầu cũng là)` null, because numbers like `everything esle(mọi thứ khác)` in dart are objects
- example:
  - int? Count; (Count == null).
  - int Count = 0; (with non-nullable, you must initialize the value of variable before used them)
- the follơing code is valid because dart can `delect(phát hiện)` that `Count` is non-null by the time it's passed to print() (or any function it's used)
- "Control Flow Analysis" (Phân tích luồng điều khiển)
- example:
  int lineCount;

  if (weLikeToCount) {
  lineCount = countLines();
  } else {
  lineCount = 0;
  }

  print(lineCount);

- Tuy nhiên có 1 trường hợp logic mình thấy đúng mà máy thấy sai - int number;
- example:
  bool isSunny = true;

  // Logic: Nếu trời nắng thì = 1, không nắng (tức là mưa) thì = 0.
  // Rõ ràng là phủ hết các trường hợp rồi đúng không?
  if (isSunny) {
  number = 1;
  }

  if (!isSunny) {
  number = 0;
  }

  // NHƯNG DART SẼ BÁO LỖI Ở ĐÂY! nó chỉ nhìn thấy 2 lệnh `if` riêng biệt.

  print(number);

- Quy tắc vàng: Với biến cục bộ (Local variable) chưa khởi tạo, Dart bắt buộc phải nhìn thấy giá trị được gán ở TẤT CẢ các nhánh logic (If/Else) trước khi biến đó được sử dụng.

## 4. Late variables

- The `late` modifier has two use cases:
  - Declaring a non-nullable variable that's initialized after its declaration.
  - Lazily initializing a variables
- Ofen Dart's control flow analysis can detect when a non-nullable variable is set to a non-null value before it's used, but sometimes analysis fails. Two comon cases are top-level variables and instance variable: Dart often can't `determine whether(xác định liệu)` they're set, so it dosen't try.
- If you're sure that a variable is set before it's used, but Dart disagrees, you can fix the error by making the variable as `late`:
  - NOTICE : If you fail to initialize a late variable, a runtime error occurs (là nếu quên gán giá trị trước khi dùng -> app sập).
- When you mark a variable as `late` but initialize it at it's declartion, then the initializer runs the first time the variable is used. This lazy initializion is `handy(hữu ích/tiện lợi)` `in a couple of cases(trong một vài trường hợp)`:
  - the variable might not be needed, and initializing is costly.
  - you're initialzing an instance variable, and its initializer need access to this

## 5. Final and const

- If you never `intend(ý định)` to change a variable, use final or const, `either instead of(thay cho)` var or `in addition to(kết hợp với)` a type. A final variable can be set only once; a const variable is a compile-time constant. (Const variable `are implicitly(được ngầm định là)` final).
  - NOTE: instance variable can be `final` but not `const`
- Use `const` for variable that you want to be compile-constants. If the const variable is at ther class level, mark it static const. Where you declare the variable, set the value to a compile-time such as a number or string literal, a const variable, or the result of an arithmetic operation on constant numbers:
  class MyConfig {
  // Sai: const apiUrl = "google.com";
  // Đúng: Thuộc về Class, không cần new MyConfig() vẫn gọi được.
  static const apiUrl = "google.com";
  }

  # the difference between const Variable and const Value

  var foo = const [];
  final bar = const [];
  const baz = [];

  - you can `omit(bỏ qua)` `const` from the initialzing expression of a const declaration, like for `baz` above. For details, see `DON'T use const redundantly(một cách thừa thải)`
  - you can change the reference of a non-final, non-const variable, even if it used to have a const value:
    ex: foo = [1, 2, 3];
    - you can't change the value of const variable:
      ex: baz = [42];

- you can define constants that use `type checks and casts (is and as)`, collection if, and spread operators (... and ...?):
- NOTE: Although a final object cannot be modified, its fields can be changed. `In comparison (ngược lại)`, a const object and its fields cannot be changed: they're immutable.

## 6. Wildcard variable

### 1. Khái niệm

- `_` là một **Placeholder** (chỗ giữ chỗ), không phải là biến thông thường.
- Nó có tính chất **Non-binding** (Không ràng buộc):
  - Giá trị gán vào sẽ biến mất (không truy cập lại được).
  - Có thể khai báo nhiều `_` trong cùng một phạm vi (`scope`) mà không lỗi trùng tên.

### 2. Khi nào dùng?

- **Callback:** Khi Widget trả về nhiều tham số mà mình không cần dùng cái nào.
  - Cũ: `(context, index)` hoặc `(_, __)`
  - Mới: `(_, _)`
- **Vòng lặp:** Khi chỉ muốn lặp n lần mà không cần giá trị phần tử (`for (var _ in list)`).
- **Try-Catch:** Khi muốn bắt lỗi để app không crash, nhưng không quan tâm lỗi đó là gì.

### 3. Lưu ý quan trọng

- **Không dùng cho Top-Level:** Biến toàn cục hoặc biến Class (`static`, `member`) không được dùng `_` theo cách này (vì `_` ở level đó có nghĩa là **Private** - chỉ dùng trong nội bộ thư viện).
- **Yêu cầu phiên bản:** Phải đảm bảo SDK Dart trong `pubspec.yaml` hỗ trợ phiên bản tương ứng (3.7 trở lên).
