abstract class Person {
  String get nama;
  set nama(String nama);

  int get umur;
  set umur(int umur);

  String get no_hp;
  set no_hp(String no_hp);
}

class CivitasAkademik implements Person {
  String? _nama;
  int _umur = 0;
  String? _no_hp;

  CivitasAkademik(this._nama, this._umur, this._no_hp);

  @override
  String get nama => _nama!;
  @override
  set nama(String nama) {
    _nama = nama;
  }

  @override
  int get umur => _umur;
  @override
  set umur(int umur) {
    _umur = umur;
  }

  @override
  String get no_hp => _no_hp!;
  @override
  set no_hp(String no_hp) {
    _no_hp = no_hp;
  }
}

class Mahasiswa extends CivitasAkademik {
  int _sks = 0;
  String? _status;
  double _ips = 0;
  double _ipk = 0;

  Mahasiswa(String nama, int umur, String no_hp, this._sks, this._status,
      this._ips, this._ipk)
      : super(nama, umur, no_hp);

  int get sks => _sks;
  void ambilSKS(int N) {
    if (N >= 2 && N <= 24) {
      _sks += N;
    } else if (N < 2) {
      print("SKS tidak boleh kurang dari 2!");
    } else {
      print("SKS tidak boleh lebih dari 24!");
    }
  }

  String get status => _status!;
  set status(String status) {
    _status = status;
  }

  double get ips => _ips;
  set ips(double ips) {
    _ips = ips;
  }

  double get ipk => _ipk;
  set ipk(double ipk) {
    _ipk = ipk;
  }
}

class Pegawai extends CivitasAkademik {
  int _gaji = 0;

  Pegawai(String nama, int umur, String no_hp, this._gaji)
      : super(nama, umur, no_hp);

  set gaji(int gaji) {
    _gaji = gaji;
  }
}

class Dosen extends Pegawai {
  int _sks_diampu = 0;
  int _tunjangan_kehadiran = 0;

  Dosen(String nama, int umur, int gaji, String no_hp, this._sks_diampu,
      this._tunjangan_kehadiran)
      : super(nama, umur, no_hp, gaji);

  int get sks_diampu => _sks_diampu;
  set sks_diampu(int sks_diampu) {
    _sks_diampu = sks_diampu;
  }

  int getPenghasilan() {
    return _gaji + (_sks_diampu * 40000) + _tunjangan_kehadiran;
  }
}

class DosenLB extends Dosen {
  DosenLB(String nama, int umur, int gaji, String no_hp, int sks_diampu,
      int tunjangan_kehadiran)
      : super(nama, umur, gaji, no_hp, sks_diampu, 0);
}

class DosenTamu extends Dosen {
  DosenTamu(String nama, int umur, int gaji, String no_hp, int sks_diampu,
      int tunjangan_kehadiran)
      : super(nama, umur, 0, no_hp, sks_diampu, tunjangan_kehadiran);
}

class DosenTetap extends Dosen {
  DosenTetap(String nama, int umur, int gaji, String no_hp, int sks_diampu,
      int tunjangan_kehadiran)
      : super(nama, umur, gaji, no_hp, sks_diampu, tunjangan_kehadiran);
}

class Staff extends Pegawai {
  int _cuti = 0;
  int _jumlah_absensi = 0;
  int _tunjangan_kehadiran = 0;

  Staff(String nama, int umur, String no_hp, this._cuti, this._jumlah_absensi)
      : super(nama, umur, no_hp, _cuti);

  int get cuti => _cuti;
  set cuti(int cuti) {
    _cuti = cuti;
  }

  int get jumlah_absensi => _jumlah_absensi;
  void absensi() {
    _jumlah_absensi++;
  }
}
