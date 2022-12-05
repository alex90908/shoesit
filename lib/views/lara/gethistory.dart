class HistoryInfo{
  late int id;
  late String nama;
  late int no_hp;
  late String alamat;
  late String gambar;
  late int harga;

  HistoryInfo(String gambar,int id, String nama, int no_hp, String alamat, int harga){
    this.id=id;
    this.gambar=gambar;
    this.nama=nama;
    this.no_hp=no_hp;
    this.alamat=alamat;
    this.harga=harga;
  }

  HistoryInfo.fromJson(Map json)
      :id=json['id'],
        nama=json['nama'],
        gambar=json['gambar'],
        no_hp=json['no_hp'],
        alamat=json['alamat'],
        harga=json['harga'];
  Map toJson(){
    return {
      'id':id,
      'nama':nama,
      'gambar':gambar,
      'no_hp':no_hp,
      'alamat':alamat,
      'harga':harga,
    };
  }

}