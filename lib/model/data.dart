class TestInfo {
  final int position;
  final String? name;
  final String? iconImage;
  final String? description;
  final int number;

  TestInfo(
    this.position,
    this.number, {
    this.name,
    this.iconImage,
    this.description,
  });
}

List<TestInfo> test = [
  TestInfo(
    1,
    11,
    name: 'Colour Vision',
    iconImage: 'assets/colour.png',
    description:
        "Tes Ishihara telah menjadi tes standar yang umum digunakan untuk skrining buta warna. Namun, penting untuk dicatat bahwa hasil tes ini hanya merupakan indikator awal dan mungkin memerlukan tes lanjutan atau konsultasi lebih lanjut dengan dokter mata untuk diagnosis yang akurat.",
  ),
  TestInfo(
    2,
    12,
    name: 'Visual Acuity',
    iconImage: 'assets/va.png',
    description:
        "Tes Visual Acuity adalah metode untuk mengukur kemampuan mata seseorang dalam melihat objek dengan jelas. Tes ini dilakukan untuk menentukan sejauh mana mata dapat membedakan detail dan membentuk gambar yang tajam.  Selama tes, Anda diminta untuk membaca huruf atau angka pada Snellen Chart mulai dari baris terbesar dan berlanjut ke baris yang lebih kecil. Tes ini dilakukan pada jarak tertentu, seperti 20 kaki (6 meter) untuk tes Visual Acuity jarak jauh dan 14-16 inci (35-40 cm) untuk tes Visual Acuity jarak dekat.",
  ),
  TestInfo(
    3,
    13,
    name: '9 Gaze Test',
    iconImage: 'assets/gaze.png',
    description:
        "Dalam tes mata ini, ada 9 posisi pandangan utama yang diperiksa untuk mengevaluasi pergerakan mata secara komprehensif. Aplikasi 9 Gaze menyediakan panduan visual di layar yang membantu dokter atau profesional kesehatan menempatkan mata pasien dengan konsistensi pada setiap posisi pandangan. Hal ini penting untuk memastikan bahwa gambar yang diambil konsisten dan dapat diandalkan. Setelah mengambil foto pada setiap posisi pandangan, 9 Gaze secara otomatis menggabungkan ke-9 foto tersebut menjadi satu gambar komposit.",
  ),
  TestInfo(
    4,
    14,
    name: 'Lapang Pandang',
    iconImage: 'assets/a1.png',
    description:
        'Pemeriksaan deteksi lapang pandang lain yang mudah dan dapat dilakukan dengan cepat yaitu pemeriksaan konfrontasi. Pemeriksaan konfrontasi yang dapat dilakukan dengan pemeriksaan konfrontasi hitung jari. Pasien menutup satu mata dengan telapak tangan mereka tangan dan menatap baik pada dokter hidung atau mata yang berhadapan langsung (untuk contoh, mata kanan pasien menatap ke mata kiri dokter). \n\nDokter kemudian memegang angkat kedua tangan di hemifield superior. Satu di kedua sisi garis tengah vertikal dan masing-masing dengan satu atau dua jari direntangkan, dan bertanya kepada pasien "Berapa jumlah jari saya?" Prosedurnya diulang untuk hemifield inferior. \n\nPasien kemudian diminta untuk menutupi mata lain dan prosedur konfrontasi hemifields superior dan inferior diulang. Meskipun lapang pandang visual yang diuji di hemifields, gangguan bahkan hanya di satu kuadran akan menghasilkan hasil abnormal. \n\nPemeriksaan Skrining konfrontasi dengan penghitungan jari cepat, membutuhkan empat tanggapan dari pasien (panel A sampai D).',
  ),
  TestInfo(
    5,
    15,
    name: 'Ptosis Test',
    iconImage: 'assets/a3.png',
    description:
        'Temuan pada pemeriksaan kelopak mata dapat ditemukan ptosis yang merupakan tanda kelumpuhan saraf oculomotor (CN III). \n\nPtosis dianggap positif pada monokular Ketika margin kelopak mata atas menutupi pupil. Ptosis juga dapat dibandingkan secara binokular dengan mata kontralateral dari pasien.',
  ),
  TestInfo(
    6,
    16,
    name: 'Refleks Pupil',
    iconImage: 'assets/a4.png',
    description:
        'Pemeriksaan pupil melibatkan respon cahaya direk dan indirek, Cara untuk memeriksa refleks pupil dengan tes  "uji senter berayun" tes ini dilakukan dengan menyinari satu mata, lalu dengan cepat "jentikkan" ke mata yang lain, tunggu satu atau dua detik, lalu "jentikkan" kembali, dan seterusnya. \n\nLihat Gambar. Tes senter berayun pada pasien dengan kelainan mata kiri (gambar skematik). Pupil bereaksi lebih cepat, dan lebih luas, dengan penerangan mata kanan yang sehat, dibandingkan dengan mata kiri yang terkena',
  ),
  TestInfo(
    7,
    17,
    name: 'Nodes Test',
    iconImage: 'assets/test.png',
    description:
        "Kuisioner ini merupakan pedoman anamnesis dan pemeriksaan untuk penelitian tentang NODES (Neuro-Ophthalmic Disorders Evaluation System). Kuisioner ini digunakan untuk mengumpulkan informasi mengenai keluhan utama pasien, riwayat penyakit dahulu, riwayat pengobatan dan operasi, serta riwayat lain-lain yang dapat berhubungan dengan gangguan neuro-oftalmik",
  ),
];
