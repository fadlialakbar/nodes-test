import 'package:eye_diagnose/components/button_component.dart';
import 'package:eye_diagnose/test/quisoner/test_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainTestPage extends StatefulWidget {
  const MainTestPage({super.key});

  @override
  State<MainTestPage> createState() => _MainTestPageState();
}

class _MainTestPageState extends State<MainTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nodes Test'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: EyeDiseaseForm(),
            ),
          ],
        ),
      ),
    );
  }
}

class EyeDiseaseForm extends StatefulWidget {
  const EyeDiseaseForm({Key? key}) : super(key: key);

  @override
  State<EyeDiseaseForm> createState() => _EyeDiseaseFormState();
}

class _EyeDiseaseFormState extends State<EyeDiseaseForm> {
  String? nama;
  int usia = 0;
  String? jenisKelamin;
  List<String> gangguanPenglihatan = [];
  List<String> pandanganGanda = [];
  List<String> nyeriMataKepalaRahang = [];
  List<String> kelopakMataTurun = [];
  String? riwayatDemamGigiRadang;
  String? riwayatPenyakitSistemik;
  String? riwayatGangguanImunitas;
  String? riwayatKonsumsiAlkohol;
  String? riwayatPengobatanBatuk;
  String? riwayatPengobatanHormonal;
  String? riwayatTraumaKepala;
  String? riwayatTumorKepala;
  String? riwayatSleepApnea;
  String? riwayatKemoterapi;
  String? riwayatKardio;
  String? gangguanGerakanBolaMata;
  String? gangguanLapangPandang;
  String? penurunanSensitivitasWarna;
  String? penurunanVisus;
  String? ptosis;
  String? refleksPupilAbnormal;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ContainerTest(
          judul: 'Data Pasien',
          desc: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Radio(
                    value: 'Laki-Laki',
                    groupValue: jenisKelamin,
                    onChanged: (value) {
                      setState(() {
                        jenisKelamin = value;
                      });
                    },
                  ),
                  const Text(
                    'Laki-Laki',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Radio(
                    value: 'Perempuan',
                    groupValue: jenisKelamin,
                    onChanged: (value) {
                      setState(() {
                        jenisKelamin = value;
                      });
                    },
                  ),
                  const Text(
                    'Perempuan',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    setState(() {
                      nama = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Nama Lengkap',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: false),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      usia = int.parse(value);
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Usia Pasien',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        const SizedBox(height: 40.0),
        const Text('Bagian Keluhan',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10.0),
        ContainerTest(
          judul: 'Gangguan Penglihatan',
          desc: Column(
            children: [
              CheckboxListTile(
                title: const Text('Gangguan penglihatan mendadak'),
                value: gangguanPenglihatan
                    .contains('gangguan penglihatan mendadak'),
                onChanged: (checked) {
                  setState(() {
                    if (checked!) {
                      gangguanPenglihatan.add('gangguan penglihatan mendadak');
                    } else {
                      gangguanPenglihatan
                          .remove('gangguan penglihatan mendadak');
                    }
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Gangguan penglihatan perlahan'),
                value: gangguanPenglihatan
                    .contains('gangguan penglihatan perlahan'),
                onChanged: (checked) {
                  setState(() {
                    if (checked!) {
                      gangguanPenglihatan.add('gangguan penglihatan perlahan');
                    } else {
                      gangguanPenglihatan
                          .remove('gangguan penglihatan perlahan');
                    }
                  });
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        ContainerTest(
            judul: "Pandangan Ganda",
            desc: Column(
              children: [
                CheckboxListTile(
                  title: const Text('Pandangan ganda membaik dengan istirahat'),
                  value: pandanganGanda
                      .contains('pandangan ganda membaik dengan istirahat'),
                  onChanged: (checked) {
                    setState(() {
                      if (checked!) {
                        pandanganGanda
                            .add('pandangan ganda membaik dengan istirahat');
                      } else {
                        pandanganGanda
                            .remove('pandangan ganda membaik dengan istirahat');
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text(
                      'Pandangan ganda tidak terpengaruh dengan istirahat'),
                  value: pandanganGanda.contains(
                      'pandangan ganda tidak terpengaruh dengan istirahat'),
                  onChanged: (checked) {
                    setState(() {
                      if (checked!) {
                        pandanganGanda.add(
                            'pandangan ganda tidak terpengaruh dengan istirahat');
                      } else {
                        pandanganGanda.remove(
                            'pandangan ganda tidak terpengaruh dengan istirahat');
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text(
                      'Pandangan ganda membaik dengan posisi kepala miring (head tilt)'),
                  value: pandanganGanda.contains(
                      'pandangan ganda membaik dengan posisi kepala miring (head tilt)'),
                  onChanged: (checked) {
                    setState(() {
                      if (checked!) {
                        pandanganGanda.add(
                            'pandangan ganda membaik dengan posisi kepala miring (head tilt)');
                      } else {
                        pandanganGanda.remove(
                            'pandangan ganda membaik dengan posisi kepala miring (head tilt)');
                      }
                    });
                  },
                ),
              ],
            )),
        const SizedBox(height: 16.0),
        ContainerTest(
          judul: 'Nyeri pada mata dan atau kepala serta rahang',
          desc: Column(
            children: [
              CheckboxListTile(
                title: const Text('Nyeri bola mata'),
                value: nyeriMataKepalaRahang.contains('nyeri bola mata'),
                onChanged: (checked) {
                  setState(() {
                    if (checked!) {
                      nyeriMataKepalaRahang.add('nyeri bola mata');
                    } else {
                      nyeriMataKepalaRahang.remove('nyeri bola mata');
                    }
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Nyeri kepala'),
                value: nyeriMataKepalaRahang.contains('nyeri kepala'),
                onChanged: (checked) {
                  setState(() {
                    if (checked!) {
                      nyeriMataKepalaRahang.add('nyeri kepala');
                    } else {
                      nyeriMataKepalaRahang.remove('nyeri kepala');
                    }
                  });
                },
              ),
              CheckboxListTile(
                title: const Text(
                    'Nyeri Rahang terutama dirasakan ketika mengunyah'),
                value: nyeriMataKepalaRahang.contains(
                    'nyeri rahang terutama dirasakan ketika mengunyah'),
                onChanged: (checked) {
                  setState(() {
                    if (checked!) {
                      nyeriMataKepalaRahang.add(
                          'nyeri rahang terutama dirasakan ketika mengunyah');
                    } else {
                      nyeriMataKepalaRahang.remove(
                          'nyeri rahang terutama dirasakan ketika mengunyah');
                    }
                  });
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        ContainerTest(
          judul: 'Kelopak Mata Turun',
          desc: Column(
            children: [
              CheckboxListTile(
                title:
                    const Text('Kelopak Mata turun membaik dengan istirahat'),
                value: kelopakMataTurun
                    .contains('kelopak mata turun membaik dengan istirahat'),
                onChanged: (checked) {
                  setState(() {
                    if (checked!) {
                      kelopakMataTurun
                          .add('kelopak mata turun membaik dengan istirahat');
                    } else {
                      kelopakMataTurun.remove(
                          'kelopak mata turun membaik dengan istirahat');
                    }
                  });
                },
              ),
              CheckboxListTile(
                title: const Text(
                    'Kelopak Mata turun tidak terpengaruh dengan istirahat'),
                value: kelopakMataTurun.contains(
                    'kelopak mata turun tidak terpengaruh dengan istirahat'),
                onChanged: (checked) {
                  setState(() {
                    if (checked!) {
                      kelopakMataTurun.add(
                          'kelopak mata turun tidak terpengaruh dengan istirahat');
                    } else {
                      kelopakMataTurun.remove(
                          'kelopak mata turun tidak terpengaruh dengan istirahat');
                    }
                  });
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 40.0),
        const Text('Bagian Riwayat',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
        const SizedBox(height: 25.0),
        ContainerTest(
          judul:
              'Riwayat Demam atau Gigi berlubang atau radang rongga hidung dan kepala',
          desc: Row(
            children: [
              Radio(
                value: 'Ya',
                groupValue: riwayatDemamGigiRadang,
                onChanged: (value) {
                  setState(() {
                    riwayatDemamGigiRadang = value;
                  });
                },
              ),
              const Text(
                'Ya',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Radio(
                value: 'Tidak',
                groupValue: riwayatDemamGigiRadang,
                onChanged: (value) {
                  setState(() {
                    riwayatDemamGigiRadang = value!;
                  });
                },
              ),
              const Text(
                'Tidak',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        ContainerTest(
          judul:
              'Riwayat Penyakit Sistemik (DM, HT, Dislipidemia, Penyakit Jantung Koroner)',
          desc: Row(
            children: [
              Row(
                children: [
                  Radio(
                    value: 'Ya',
                    groupValue: riwayatPenyakitSistemik,
                    onChanged: (value) {
                      setState(() {
                        riwayatPenyakitSistemik = value;
                      });
                    },
                  ),
                  const Text(
                    'Ya',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Radio(
                    value: 'Tidak',
                    groupValue: riwayatPenyakitSistemik,
                    onChanged: (value) {
                      setState(() {
                        riwayatPenyakitSistemik = value;
                      });
                    },
                  ),
                  const Text(
                    'Tidak',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        ContainerTest(
          judul: 'Riwayat Pengobatan Kardiovaskular',
          desc: Row(
            children: [
              Row(
                children: [
                  Radio(
                    value: 'Ya',
                    groupValue: riwayatKardio,
                    onChanged: (value) {
                      setState(() {
                        riwayatKardio = value;
                      });
                    },
                  ),
                  const Text(
                    'Ya',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Radio(
                    value: 'Tidak',
                    groupValue: riwayatKardio,
                    onChanged: (value) {
                      setState(() {
                        riwayatKardio = value;
                      });
                    },
                  ),
                  const Text(
                    'Tidak',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        ContainerTest(
          judul:
              'Riwayat Gangguan Imunitas / Radang sendi seperti arthritis atau lupus',
          desc: Row(
            children: [
              Radio(
                value: 'Ya',
                groupValue: riwayatGangguanImunitas,
                onChanged: (value) {
                  setState(() {
                    riwayatGangguanImunitas = value;
                  });
                },
              ),
              const Text(
                'Ya',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Radio(
                value: 'Tidak',
                groupValue: riwayatGangguanImunitas,
                onChanged: (value) {
                  setState(() {
                    riwayatGangguanImunitas = value;
                  });
                },
              ),
              const Text(
                'Tidak',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        ContainerTest(
          judul: 'Riwayat Konsumsi Alkohol, Narkoba, atau Merokok',
          desc: Row(
            children: [
              Radio(
                value: 'Ya',
                groupValue: riwayatKonsumsiAlkohol,
                onChanged: (value) {
                  setState(() {
                    riwayatKonsumsiAlkohol = value;
                  });
                },
              ),
              const Text(
                'Ya',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Radio(
                value: 'Tidak',
                groupValue: riwayatKonsumsiAlkohol,
                onChanged: (value) {
                  setState(() {
                    riwayatKonsumsiAlkohol = value;
                  });
                },
              ),
              const Text(
                'Tidak',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        ContainerTest(
          judul: 'Riwayat Pengobatan Batuk (obat obatan) Lama',
          desc: Row(
            children: [
              Radio(
                value: 'Ya',
                groupValue: riwayatPengobatanBatuk,
                onChanged: (value) {
                  setState(() {
                    riwayatPengobatanBatuk = value;
                  });
                },
              ),
              const Text(
                'Ya',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Radio(
                value: 'Tidak',
                groupValue: riwayatPengobatanBatuk,
                onChanged: (value) {
                  setState(() {
                    riwayatPengobatanBatuk = value;
                  });
                },
              ),
              const Text(
                'Tidak',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        ContainerTest(
          judul: 'Riwayat pengobatan hormonal/pil KB',
          desc: Row(
            children: [
              Radio(
                value: 'Ya',
                groupValue: riwayatPengobatanHormonal,
                onChanged: (value) {
                  setState(() {
                    riwayatPengobatanHormonal = value;
                  });
                },
              ),
              const Text(
                'Ya',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Radio(
                value: 'Tidak',
                groupValue: riwayatPengobatanHormonal,
                onChanged: (value) {
                  setState(() {
                    riwayatPengobatanHormonal = value;
                  });
                },
              ),
              const Text(
                'Tidak',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        ContainerTest(
          judul: 'Riwayat Trauma Kepala',
          desc: Row(
            children: [
              Radio(
                value: 'Ya',
                groupValue: riwayatTraumaKepala,
                onChanged: (value) {
                  setState(() {
                    riwayatTraumaKepala = value;
                  });
                },
              ),
              const Text(
                'Ya',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Radio(
                value: 'Tidak',
                groupValue: riwayatTraumaKepala,
                onChanged: (value) {
                  setState(() {
                    riwayatTraumaKepala = value;
                  });
                },
              ),
              const Text(
                'Tidak',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        ContainerTest(
          judul: 'Riwayat Tumor Kepala',
          desc: Row(
            children: [
              Radio(
                value: 'Ya',
                groupValue: riwayatTumorKepala,
                onChanged: (value) {
                  setState(() {
                    riwayatTumorKepala = value;
                  });
                },
              ),
              const Text(
                'Ya',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Radio(
                value: 'Tidak',
                groupValue: riwayatTumorKepala,
                onChanged: (value) {
                  setState(() {
                    riwayatTumorKepala = value;
                  });
                },
              ),
              const Text(
                'Tidak',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        ContainerTest(
          judul: 'Riwayat Sleep Apnea atau Tidur Mengorok',
          desc: Row(
            children: [
              Radio(
                value: 'Ya',
                groupValue: riwayatSleepApnea,
                onChanged: (value) {
                  setState(() {
                    riwayatSleepApnea = value;
                  });
                },
              ),
              const Text(
                'Ya',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Radio(
                value: 'Tidak',
                groupValue: riwayatSleepApnea,
                onChanged: (value) {
                  setState(() {
                    riwayatSleepApnea = value;
                  });
                },
              ),
              const Text(
                'Tidak',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        ContainerTest(
          judul: 'Riwayat Kemoterapi atau Radiotherapy',
          desc: Row(
            children: [
              Radio(
                value: 'Ya',
                groupValue: riwayatKemoterapi,
                onChanged: (value) {
                  setState(() {
                    riwayatKemoterapi = value;
                  });
                },
              ),
              const Text(
                'Ya',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Radio(
                value: 'Tidak',
                groupValue: riwayatKemoterapi,
                onChanged: (value) {
                  setState(() {
                    riwayatKemoterapi = value;
                  });
                },
              ),
              const Text(
                'Tidak',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40.0),
        const Text('Bagian Penelitian Node',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
        const SizedBox(height: 25.0),
        ContainerTest(
          judul: 'Pemeriksaan Visus',
          desc: Row(
            children: [
              Radio(
                value: 'Normal',
                groupValue: penurunanVisus,
                onChanged: (value) {
                  setState(() {
                    penurunanVisus = value;
                  });
                },
              ),
              const Text(
                'Normal',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Radio(
                value: 'Abnormal',
                groupValue: penurunanVisus,
                onChanged: (value) {
                  setState(() {
                    penurunanVisus = value!;
                  });
                },
              ),
              const Text(
                'Abnormal',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        ContainerTest(
          judul: 'Pemeriksaan Refleks Pupil',
          desc: Row(
            children: [
              Radio(
                value: 'Normal',
                groupValue: refleksPupilAbnormal,
                onChanged: (value) {
                  setState(() {
                    refleksPupilAbnormal = value;
                  });
                },
              ),
              const Text(
                'Normal',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Radio(
                value: 'Abnormal',
                groupValue: refleksPupilAbnormal,
                onChanged: (value) {
                  setState(() {
                    refleksPupilAbnormal = value!;
                  });
                },
              ),
              const Text(
                'Abnormal',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        ContainerTest(
          judul: 'Posisi Kelopak Mata',
          desc: Row(
            children: [
              Radio(
                value: 'Normal',
                groupValue: ptosis,
                onChanged: (value) {
                  setState(() {
                    ptosis = value;
                  });
                },
              ),
              const Text(
                'Normal',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Radio(
                value: 'Ptosis',
                groupValue: ptosis,
                onChanged: (value) {
                  setState(() {
                    ptosis = value!;
                  });
                },
              ),
              const Text(
                'Ptosis',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        ContainerTest(
          judul: 'Pemeriksaan Gerakan Bola Mata',
          desc: Row(
            children: [
              Radio(
                value: 'Normal',
                groupValue: gangguanGerakanBolaMata,
                onChanged: (value) {
                  setState(() {
                    gangguanGerakanBolaMata = value;
                  });
                },
              ),
              const Text(
                'Normal',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Radio(
                value: 'Abnormal',
                groupValue: gangguanGerakanBolaMata,
                onChanged: (value) {
                  setState(() {
                    gangguanGerakanBolaMata = value!;
                  });
                },
              ),
              const Text(
                'Abnormal',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        ContainerTest(
          judul: 'Pemeriksaan Sensitivitas Warna',
          desc: Row(
            children: [
              Radio(
                value: 'Normal',
                groupValue: penurunanSensitivitasWarna,
                onChanged: (value) {
                  setState(() {
                    penurunanSensitivitasWarna = value;
                  });
                },
              ),
              const Text(
                'Normal',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Radio(
                value: 'Abnormal',
                groupValue: penurunanSensitivitasWarna,
                onChanged: (value) {
                  setState(() {
                    penurunanSensitivitasWarna = value!;
                  });
                },
              ),
              const Text(
                'Abnormal',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        ContainerTest(
          judul: 'Pemeriksaan Lapang Pandang',
          desc: Row(
            children: [
              Radio(
                value: 'Normal',
                groupValue: gangguanLapangPandang,
                onChanged: (value) {
                  setState(() {
                    gangguanLapangPandang = value;
                  });
                },
              ),
              const Text(
                'Normal',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Radio(
                value: 'Abnormal',
                groupValue: gangguanLapangPandang,
                onChanged: (value) {
                  setState(() {
                    gangguanLapangPandang = value!;
                  });
                },
              ),
              const Text(
                'Abnormal',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        FullWidthFilledButton(
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultDiagnose(
                  nama: nama,
                  usia: usia,
                  jenisKelamin: jenisKelamin,
                  gangguanPenglihatan: gangguanPenglihatan,
                  pandanganGanda: pandanganGanda,
                  nyeriMataKepalaRahang: nyeriMataKepalaRahang,
                  kelopakMataTurun: kelopakMataTurun,
                  riwayatDemamGigiRadang: riwayatDemamGigiRadang,
                  riwayatPenyakitSistemik: riwayatPenyakitSistemik,
                  riwayatGangguanImunitas: riwayatGangguanImunitas,
                  riwayatKonsumsiAlkohol: riwayatKonsumsiAlkohol,
                  riwayatPengobatanBatuk: riwayatPengobatanBatuk,
                  riwayatPengobatanHormonal: riwayatPengobatanHormonal,
                  riwayatPengobatanKardiovaskular: riwayatKardio,
                  riwayatTraumaKepala: riwayatTraumaKepala,
                  riwayatTumorKepala: riwayatTumorKepala,
                  riwayatSleepApnea: riwayatSleepApnea,
                  riwayatKemoterapi: riwayatKemoterapi,
                  gangguanGerakanBolaMata: gangguanGerakanBolaMata,
                  gangguanLapangPandang: gangguanLapangPandang,
                  penurunanSensitivitasWarna: penurunanSensitivitasWarna,
                  penurunanVisus: penurunanVisus,
                  ptosis: ptosis,
                  refleksPupilAbnormal: refleksPupilAbnormal,
                ),
              ),
            );
          },
          child: const Text(
            'Submit',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}

class ContainerTest extends StatelessWidget {
  const ContainerTest({super.key, required this.judul, required this.desc});

  final String judul;
  final Widget desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 1, color: Colors.grey.withOpacity(0.4)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(15),
                border:
                    Border.all(width: 1, color: Colors.grey.withOpacity(0.1))),
            child: Text(
              judul,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          desc,
        ],
      ),
    );
  }
}
