abstract class Person {
  String get nama;
  set nama(String nama);

  int get umur;
  set umur(int umur);

  String get noHP;
  set noHP(String noHP);
}

class CivitasAkademik implements Person {
  String? _nama;
  int _umur = 0;
  String? _noHP;

  CivitasAkademik(this._nama, this._umur, this._noHP);

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
  String get noHP => _noHP!;
  @override
  set noHP(String noHP) {
    _noHP = noHP;
  }
}

class Mahasiswa extends CivitasAkademik {
  int _sks = 0;
  String? _status;
  double _ips = 0;
  double _ipk = 0;

  Mahasiswa(String nama, int umur, String noHP, this._sks, this._status,
      this._ips, this._ipk)
      : super(nama, umur, noHP);

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
  int _tunjanganKehadiran = 0;

  Pegawai(
      String nama, int umur, String noHP, this._gaji, this._tunjanganKehadiran)
      : super(nama, umur, noHP);

  set gaji(int gaji) {
    _gaji = gaji;
  }
}

class Dosen extends Pegawai {
  int _sksDiampu = 0;

  Dosen(String nama, int umur, String noHP, int gaji, int tunjanganKehadiran,
      this._sksDiampu)
      : super(nama, umur, noHP, gaji, tunjanganKehadiran);

  int get sksDiampu => _sksDiampu;
  set sksDiampu(int sksDiampu) {
    _sksDiampu = sksDiampu;
  }

  int getPenghasilan() {
    return _gaji + (_sksDiampu * 40000) + _tunjanganKehadiran;
  }
}

class DosenLB extends Dosen {
  DosenLB(String nama, int umur, String noHP, int gaji, int tunjanganKehadiran,
      int sksDiampu)
      : super(nama, umur, noHP, gaji, 0, sksDiampu);
}

class DosenTamu extends Dosen {
  DosenTamu(String nama, int umur, String noHP, int gaji,
      int tunjanganKehadiran, int sksDiampu)
      : super(nama, umur, noHP, 0, tunjanganKehadiran, sksDiampu);
}

class DosenTetap extends Dosen {
  DosenTetap(String nama, int umur, String noHP, int gaji,
      int tunjanganKehadiran, int sksDiampu)
      : super(nama, umur, noHP, gaji, tunjanganKehadiran, sksDiampu);
}

class Staff extends Pegawai {
  int _jatahCuti = 12;
  int _jumlahAbsensi = 0;

  Staff(String nama, int umur, String noHP, int gaji, int tunjanganKehadiran,
      this._jatahCuti, this._jumlahAbsensi)
      : super(nama, umur, noHP, gaji, tunjanganKehadiran);

  int get jatahCuti => _jatahCuti;
  void cuti() {
    if (_jatahCuti > 0) {
      _jatahCuti--;
    } else {
      print("Jatah cuti telah habis!");
    }
  }

  int get jumlahAbsensi => _jumlahAbsensi;
  void absensi() {
    _jumlahAbsensi++;
  }

  int getTotalGaji() {
    return _gaji + (_jumlahAbsensi * _tunjanganKehadiran);
  }
}
