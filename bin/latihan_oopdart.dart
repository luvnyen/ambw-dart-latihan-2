import 'dart:io';
import 'class.dart';

// ASUMSI:
// 1. Dosen tidak dapat melakukan absensi, sehingga tunjangan kehadiran langsung ditambahkan dengan gaji dan SKS diampu dikali Rp40.000,00
// 2. Total gaji Staff didapatkan dari jumlah absensi yang dalam satuan hari dibagi dengan 30 (1 bulan) lalu dikali dengan gaji untuk mendapatkan total gaji ditambah dengan tunjangan kehadiran yang dikalikan dengan jumlah absensi

void main(List<String> arguments) {
  print(
      "\nGaji dasar akan disamakan untuk seluruh pegawai agar mempermudah pengecekan test case.");
  stdout.write("Input gaji dasar untuk seluruh pegawai: ");
  String? n = stdin.readLineSync();
  int gajiDasar = int.parse(n!);

  print("\n===================================");
  print("Test Case: Objek CivitasAkademika");
  print("===================================");
  CivitasAkademika civitasAkademika =
      new CivitasAkademika("John Doe", 20, "08123456789");
  print(
      "Nama: ${civitasAkademika.nama}\nUmur: ${civitasAkademika.umur}\nNomor Telepon: ${civitasAkademika.noHP}");

  print("\n===================================");
  print("Test Case: Objek Mahasiswa");
  print("===================================");
  Mahasiswa mahasiswa =
      new Mahasiswa("John Doe", 20, "08123456789", 105, "aktif", 3.65, 3.88);
  print(
      "Nama: ${mahasiswa.nama}\nUmur: ${mahasiswa.umur}\nNomor Telepon: ${mahasiswa.noHP}\nSKS: ${mahasiswa.sks}\nStatus: ${mahasiswa.status}\nIPS: ${mahasiswa.ips}\nIPK: ${mahasiswa.ipk}");
  mahasiswa.ambilSKS(10);
  print(
      "Jumlah SKS yang setelah ditambah: ${mahasiswa.sks}"); // Jumlah SKS setelah penambahan: 115
  mahasiswa.ambilSKS(0); // Jumlah SKS yang diambil tidak boleh kurang dari 2!
  mahasiswa.ambilSKS(25); // Jumlah SKS yang diambil tidak boleh lebih dari 24!

  print("\n===================================");
  print("Test Case: Objek Pegawai");
  print("===================================");
  Pegawai pegawai =
      new Pegawai("John Doe", 20, "08123456789", gajiDasar, 50000);
  print(
      "Nama: ${pegawai.nama}\nUmur: ${pegawai.umur}\nNomor Telepon: ${pegawai.noHP}\nGaji Dasar: ${pegawai.gaji}\nTunjangan Kehadiran: ${pegawai.tunjanganKehadiran}");
  pegawai.tunjanganKehadiran = 70000;
  print("Tunjangan kehadiran setelah diubah: ${pegawai.tunjanganKehadiran}");
  pegawai.tunjanganKehadiran =
      -1; // Tunjangan kehadiran tidak boleh bernilai negatif!

  print("\n===================================");
  print("Test Case: Objek Dosen");
  print("===================================");
  Dosen dosen = new Dosen("John Doe", 20, "08123456789", gajiDasar, 50000, 21);
  print(
      "Nama: ${dosen.nama}\nUmur: ${dosen.umur}\nNomor Telepon: ${dosen.noHP}\nGaji Dasar: ${dosen.gaji}\nTunjangan Kehadiran: ${dosen.tunjanganKehadiran}\nSKS Diampu: ${dosen.sksDiampu}");

  print("\n===================================");
  print("Test Case: Objek DosenLB");
  print("===================================");
  DosenLB dosenLB =
      new DosenLB("John Doe", 20, "08123456789", gajiDasar, 50000, 21);
  print(
      "Nama: ${dosenLB.nama}\nUmur: ${dosenLB.umur}\nNomor Telepon: ${dosenLB.noHP}\nGaji Dasar: ${dosenLB.gaji}\nTunjangan Kehadiran: ${dosenLB.tunjanganKehadiran}\nSKS Diampu: ${dosenLB.sksDiampu}");
  print("Penghasilan: ${dosenLB.getPenghasilan()}");

  print("\n===================================");
  print("Test Case: Objek DosenTamu");
  print("===================================");
  DosenTamu dosenTamu =
      new DosenTamu("John Doe", 20, "08123456789", gajiDasar, 50000, 21);
  print(
      "Nama: ${dosenTamu.nama}\nUmur: ${dosenTamu.umur}\nNomor Telepon: ${dosenTamu.noHP}\nGaji Dasar: ${dosenTamu.gaji}\nTunjangan Kehadiran: ${dosenTamu.tunjanganKehadiran}\nSKS Diampu: ${dosenTamu.sksDiampu}");
  print("Penghasilan: ${dosenTamu.getPenghasilan()}");

  print("\n===================================");
  print("Test Case: Objek DosenTetap");
  print("===================================");
  DosenTetap dosenTetap =
      new DosenTetap("John Doe", 20, "08123456789", gajiDasar, 50000, 21);
  print(
      "Nama: ${dosenTetap.nama}\nUmur: ${dosenTetap.umur}\nNomor Telepon: ${dosenTetap.noHP}\nGaji Dasar: ${dosenTetap.gaji}\nTunjangan Kehadiran: ${dosenTetap.tunjanganKehadiran}\nSKS Diampu: ${dosenTetap.sksDiampu}");
  print("Penghasilan: ${dosenTetap.getPenghasilan()}");

  print("\n===================================");
  print("Test Case: Objek Staff");
  print("===================================");
  Staff staff = new Staff("John Doe", 20, "08123456789", gajiDasar, 10000, 193);
  print(
      "Nama: ${staff.nama}\nUmur: ${staff.umur}\nNomor Telepon: ${staff.noHP}\nGaji Dasar: ${staff.gaji}\nTunjangan Kehadiran: ${staff.tunjanganKehadiran}\nJumlah Absensi: ${staff.jumlahAbsensi}");
  staff.absensi();
  print("Jumlah absensi setelah melakukan absensi 1x: ${staff.jumlahAbsensi}");
  for (var i = 0; i < 13; i++) {
    staff.cuti(); // Jatah cuti telah habis!
  }
  print("Sisa jatah cuti: ${staff.jatahCuti}");
  print("Total Gaji: ${staff.getTotalGaji()}");
}
