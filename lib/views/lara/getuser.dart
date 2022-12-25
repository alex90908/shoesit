class UserInfo{
  late int id;
  late String nama;
  late String email;
  late String nohp;

  UserInfo(String gambar,int id, String nama, String sepatu){
    this.id=id;
    this.email=email;
    this.nama=nama;
    this.nohp=nohp;

  }

  UserInfo.fromJson(Map json)
      :id=json['id'],
        nama=json['nama'],
        email=json['email'],
        nohp=json['nohp'];
  Map toJson(){
    return {
      'id':id,
      'nama':nama,
      'email':email,
      'nohp':nohp,

    };
  }

}