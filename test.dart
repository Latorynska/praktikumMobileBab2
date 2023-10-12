void main() async {
  Hewan h1 = new Hewan();
  Hewan h2 = new Hewan();
  Hewan h3 = new Hewan();
  Hewan h4 = new Hewan();
  h1.berat = 20;
  h2.berat = 30;
  h3.berat = 40;
  h4.berat = 50;

  Mobil m = new Mobil();
  m.kapasitas = 100;
  m.tambahMuatan(h1);
  m.tambahMuatan(h2);
  m.tambahMuatan(h3);
  m.tambahMuatan(h4);

  List<int> dataList = [20, 50, 60, 80, 90];
  dataList = await perkalian(dataList, 3);
  print("hasil perkalian : $dataList");
}

class Mobil {
  double? kapasitas;
  List<Hewan> muatan = [];

  void tambahMuatan(Hewan data) {
    if ((getTotalMuatan() + (data.berat ?? 0)) <= (this.kapasitas ?? 0)) {
      muatan.add(data);
      print("Muatan Berhasil ditambahkan");
    } else {
      print("Muatan sudah penuh");
    }
  }

  double getTotalMuatan() {
    double totalMuatan = 0;
    for (var hewan in this.muatan) {
      totalMuatan += hewan.berat ?? 0;
    }
    return totalMuatan;
  }
}

class Hewan {
  double? berat;
}

Future<List<int>> perkalian(List<int> dataList, int pengali) async {
  List<int> hasil = [];
  for (int data in dataList) {
    int res =
        await Future.delayed((Duration(seconds: 1)), () => data * pengali);
    hasil.add(res);
  }
  return hasil;
}
