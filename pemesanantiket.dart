// kelas abstrak
abstract class Transportasi {
  String nama;
  double _tarifDasar;

  Transportasi(this.nama, this._tarifDasar);

  // getter

  double get tarifDasar => _tarifDasar;

  // hitung tarif berdasarkan jumlah penumpang
  double hitungTarif(int jumlahPenumpang);

  void tampilInfo() {
    print("transportasi : ${nama}");
    print("tarif dasar : ${_tarifDasar}");
  }
}

// kelas taksi turunan dari Transportasi
class Taksi extends Transportasi {
  double jarak;

  Taksi(String nama, double tarifDasar, this.jarak) : super(nama, tarifDasar);

  @override
  double hitungTarif(int jumlahPenumpang) {
    return tarifDasar * jarak;
  }
}

// kelas bus turunan dari transportasi
class Bus extends Transportasi {
  bool adaWifi;

  Bus(String nama, double tarifDasar, this.adaWifi) : super(nama, tarifDasar);

  @override
  double hitungTarif(int jumlahPenumpang) {
    return (tarifDasar * jumlahPenumpang) + (adaWifi ? 5000 : 0);
  }
}

// kelas pesawat turunan dari transportasi
class Pesawat extends Transportasi {
  String kelas;

  Pesawat(String nama, double tarifDasar, this.kelas) : super(nama, tarifDasar);

  @override
  double hitungTarif(int jumlahPenumpang) {
    double faktor = (kelas == "Bisnis") ? 1.5 : 1.0;
    return tarifDasar * jumlahPenumpang * faktor;
  }
}

// kelas pemesanan
class Pemesanan {
  String namaPelanggan;
  Transportasi transportasi;
  int jumlahPenumpang;
  double total;

  Pemesanan(this.namaPelanggan, this.transportasi, this.jumlahPenumpang)
    : total = transportasi.hitungTarif(jumlahPenumpang);

  void cetakStruk() {
    print("\n==== STRUK PEMESANAN ===");
    print("Nama Pelanggan   : ${namaPelanggan}");
    print("Transportasi     : ${transportasi}");
    print("Jumlah Penumpang : ${jumlahPenumpang}");
    print("Total Tarif      : Rp.${total.toStringAsFixed(0)}");
    print("==================================================");
  }
}

void main() {
  // objek dari transportasi
  var taksi = Taksi("dewa Taxi", 8000, 10);
  var bus = Bus("Eza BUS", 10000, true);
  var pesawat = Pesawat("aprian air plane", 12000, "Bisnis");

  // pemesanan

  var p1 = Pemesanan("dewa", taksi, 5);
  var p2 = Pemesanan("eza", bus, 8);
  var p3 = Pemesanan("aprian", pesawat, 10);

  // tampilkan struk
  p1.cetakStruk();
  p2.cetakStruk();
  p3.cetakStruk();
}
