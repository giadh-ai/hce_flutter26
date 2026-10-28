import 'package:oop_demo/oop_demo.dart' as oop_demo;


abstract class Boss1 {
void napTien(double soTien);
}

abstract class Boss2 {
bool rutTien(double soTien);
}

abstract class ATaiKhoan implements  Boss1, Boss2
{

}

abstract class TaiKhoan extends ATaiKhoan {
  final String chuTaiKhoan;
  double soDu;
 
  
  TaiKhoan(this.chuTaiKhoan, {this.soDu = 0});
 
  // void napTien(double soTien) {
  //   soDu += soTien;
  //   print('$chuTaiKhoan nap $soTien, so du moi: $soDu');
  // }

  //abstract void napTien(double soTien);
  
  @override
  bool rutTien(double soTien) {
    if (soTien > soDu) {
      print('$chuTaiKhoan rut that bai: khong du so du');
      return false;
    }
    soDu -= soTien;
    return true;
  }
 
  @override
  String toString() => 'TaiKhoan($chuTaiKhoan, so du: $soDu)';



}


class TaiKhoanTietKiem extends TaiKhoan 
{  
  TaiKhoanTietKiem(super.chuTaiKhoan);

  // @override
  // bool rutTien(double soTien) {
  //   print('Khong thich cho rut tien day');
  //   return false;
  // }
 @override
void napTien(double soTien) {
    soDu += soTien;
    print('$chuTaiKhoan nap $soTien, so du moi: $soDu');
  }

}

void main(List<String> arguments) {
  
    // TaiKhoan tk2= new TaiKhoan("Tran Van B");
    // tk2.napTien(2000000);
    // tk2.rutTien(10000);
    
  print("------------------");
  TaiKhoan tk4= TaiKhoanTietKiem("Tran Thi E");
   tk4.napTien(2000000);
   tk4.rutTien(10000);
  print(tk4.toString());

 






}
