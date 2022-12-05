class SepatuInfo{
  late int id;
  late String nama;
  late String gambar;
  late String sepatu;

  SepatuInfo(String gambar,int id, String nama, String sepatu){
    this.id=id;
    this.gambar=gambar;
    this.nama=nama;
    this.sepatu=sepatu;

  }

  SepatuInfo.fromJson(Map json)
      :id=json['id'],
        nama=json['nama'],
        gambar=json['gambar'],
        sepatu=json['sepatu'];
  Map toJson(){
    return {
      'id':id,
      'nama':nama,
      'gambar':gambar,
      'sepatu':sepatu,

    };
  }

}