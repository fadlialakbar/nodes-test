import 'package:eye_diagnose/test/quisoner/test_soal.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../model/chart_data.dart';
import '../../model/result_data.dart';
import '../../server/api.dart';

class ResultDiagnose extends StatefulWidget {
  final String? nama;
  final int usia;
  final String? jenisKelamin;
  final List<String> gangguanPenglihatan;
  final List<String> pandanganGanda;
  final List<String> nyeriMataKepalaRahang;
  final List<String> kelopakMataTurun;
  final String? riwayatDemamGigiRadang;
  final String? riwayatPenyakitSistemik;
  final String? riwayatGangguanImunitas;
  final String? riwayatKonsumsiAlkohol;
  final String? riwayatPengobatanBatuk;
  final String? riwayatPengobatanHormonal;
  final String? riwayatTraumaKepala;
  final String? riwayatTumorKepala;
  final String? riwayatSleepApnea;
  final String? riwayatKemoterapi;
  final String? gangguanGerakanBolaMata;
  final String? gangguanLapangPandang;
  final String? penurunanSensitivitasWarna;
  final String? penurunanVisus;
  final String? ptosis;
  final String? refleksPupilAbnormal;
  final String? riwayatPengobatanKardiovaskular;

  const ResultDiagnose({
    Key? key,
    required this.nama,
    required this.usia,
    required this.jenisKelamin,
    required this.gangguanPenglihatan,
    required this.pandanganGanda,
    required this.nyeriMataKepalaRahang,
    required this.kelopakMataTurun,
    required this.riwayatDemamGigiRadang,
    required this.riwayatPenyakitSistemik,
    required this.riwayatGangguanImunitas,
    required this.riwayatKonsumsiAlkohol,
    required this.riwayatPengobatanBatuk,
    required this.riwayatPengobatanHormonal,
    required this.riwayatTraumaKepala,
    required this.riwayatTumorKepala,
    required this.riwayatSleepApnea,
    required this.riwayatKemoterapi,
    required this.gangguanGerakanBolaMata,
    required this.gangguanLapangPandang,
    required this.penurunanSensitivitasWarna,
    required this.penurunanVisus,
    required this.ptosis,
    required this.refleksPupilAbnormal,
    required this.riwayatPengobatanKardiovaskular,
  }) : super(key: key);

  @override
  State<ResultDiagnose> createState() => _ResultDiagnoseState();
}

class _ResultDiagnoseState extends State<ResultDiagnose> {
  double totalNAION = 0.0;
  double totalGCA = 0.0;
  double totalCON = 0.0;
  double totalION = 0.0;
  double totalTON = 0.0;
  double totalONAtrophy = 0.0;
  double totalNeuritisOptik = 0.0;
  double totalMonocranialNervePalsyIII = 0.0;
  double totalMonocranialNervePalsyIV = 0.0;
  double totalMonocranialNervePalsyVI = 0.0;
  double totalMulticranialNervePlalsyOrbitalApex = 0.0;
  double totalMulticranialNervePlalsySinusCavernosus = 0.0;
  double totalMG = 0.0;
  double totalHornersSyndrome = 0.0;
  double totalAdieTonicPupil = 0.0;

  void checkResult() {
    if (widget.usia < 50.0) {
      totalNAION += 0.25;
      totalGCA += 0.00;
      totalCON += 0.50;
      totalION += 0.20;
      totalTON += 0.80;
      totalONAtrophy += 0.30;
      totalNeuritisOptik += 0.80;
      totalMonocranialNervePalsyIII += 0.10;
      totalMonocranialNervePalsyIV += 0.50;
      totalMonocranialNervePalsyVI += 0.50;
      totalMulticranialNervePlalsyOrbitalApex += 0.50;
      totalMulticranialNervePlalsySinusCavernosus += 0.50;
      totalMG += 0.70;
      totalHornersSyndrome += 0.60;
      totalAdieTonicPupil += 0.80;
    }
    if (widget.usia >= 50.0) {
      totalNAION += 0.75;
      totalGCA += 1.00;
      totalCON += 0.50;
      totalION += 0.80;
      totalTON += 0.20;
      totalONAtrophy += 0.70;
      totalNeuritisOptik += 0.20;
      totalMonocranialNervePalsyIII += 0.90;
      totalMonocranialNervePalsyIV += 0.50;
      totalMonocranialNervePalsyVI += 0.50;
      totalMulticranialNervePlalsyOrbitalApex += 0.50;
      totalMulticranialNervePlalsySinusCavernosus += 0.50;
      totalMG += 0.30;
      totalHornersSyndrome += 0.40;
      totalAdieTonicPupil += 0.20;
    }

    if (widget.jenisKelamin == 'Laki-Laki') {
      totalNAION += 0.75;
      totalGCA += 0.30;
      totalCON += 0.50;
      totalION += 0.50;
      totalTON += 0.80;
      totalONAtrophy += 0.50;
      totalNeuritisOptik += 0.30;
      totalMonocranialNervePalsyIII += 0.50;
      totalMonocranialNervePalsyIV += 0.50;
      totalMonocranialNervePalsyVI += 0.50;
      totalMulticranialNervePlalsyOrbitalApex += 0.50;
      totalMulticranialNervePlalsySinusCavernosus += 0.50;
      totalMG += 0.20;
      totalHornersSyndrome += 0.50;
      totalAdieTonicPupil += 0.10;
    }

    if (widget.jenisKelamin == 'Perempuan') {
      totalNAION += 0.25;
      totalGCA += 0.70;
      totalCON += 0.50;
      totalION += 0.50;
      totalTON += 0.20;
      totalONAtrophy += 0.50;
      totalNeuritisOptik += 0.70;
      totalMonocranialNervePalsyIII += 0.50;
      totalMonocranialNervePalsyIV += 0.50;
      totalMonocranialNervePalsyVI += 0.50;
      totalMulticranialNervePlalsyOrbitalApex += 0.50;
      totalMulticranialNervePlalsySinusCavernosus += 0.50;
      totalMG += 0.80;
      totalHornersSyndrome += 0.50;
      totalAdieTonicPupil += 0.90;
    }

    if (widget.gangguanPenglihatan.contains('gangguan penglihatan mendadak')) {
      totalNAION += 0.90;
      totalGCA += 0.80;
      totalCON += 0.00;
      totalION -= 0.50;
      totalTON += 0.90;
      totalONAtrophy += 1.00;
      totalNeuritisOptik += 0.90;
      totalMonocranialNervePalsyIII += 0.10;
      totalMonocranialNervePalsyIV += 0.10;
      totalMonocranialNervePalsyVI += 0.00;
      totalMulticranialNervePlalsyOrbitalApex += 0.30;
      totalMulticranialNervePlalsySinusCavernosus += 0.10;
      totalMG += 0.20;
      totalHornersSyndrome += 0.10;
      totalAdieTonicPupil += 0.20;
    }

    if (widget.gangguanPenglihatan.contains('gangguan penglihatan perlahan')) {
      totalNAION += 0.10;
      totalGCA += 0.20;
      totalCON += 1.00;
      totalION += 1.00;
      totalTON += 0.10;
      totalONAtrophy += 0.90;
      totalNeuritisOptik += 0.10;
      totalMonocranialNervePalsyIII += 0.10;
      totalMonocranialNervePalsyIV += 0.10;
      totalMonocranialNervePalsyVI += 0.20;
      totalMulticranialNervePlalsyOrbitalApex += 0.10;
      totalMulticranialNervePlalsySinusCavernosus += 0.10;
      totalMG += 0.80;
      totalHornersSyndrome += 0.10;
      totalAdieTonicPupil += 0.20;
    }

    if (widget.pandanganGanda.isNotEmpty) {
      totalNAION += -0.50;
      totalGCA += 0.10;
      totalCON += 0.10;
      totalION += 0.10;
      totalTON += 0.00;
      totalONAtrophy += -0.50;
      totalNeuritisOptik += -0.50;
      totalMonocranialNervePalsyIII += 1.00;
      totalMonocranialNervePalsyIV += 1.00;
      totalMonocranialNervePalsyVI += 1.00;
      totalMulticranialNervePlalsyOrbitalApex += 1.00;
      totalMulticranialNervePlalsySinusCavernosus += 1.00;
      totalMG += 1.00;
      totalHornersSyndrome += 1.00;
      totalAdieTonicPupil += 0.20;
    }

    if (widget.pandanganGanda
        .contains('pandangan ganda membaik dengan istirahat')) {
      totalNAION += 0.00;
      totalGCA += -1.00;
      totalCON += -0.50;
      totalION += -0.50;
      totalTON += 0.00;
      totalONAtrophy += -0.50;
      totalNeuritisOptik += -0.50;
      totalMonocranialNervePalsyIII += -1.00;
      totalMonocranialNervePalsyIV += -1.00;
      totalMonocranialNervePalsyVI += -1.00;
      totalMulticranialNervePlalsyOrbitalApex += -1.00;
      totalMulticranialNervePlalsySinusCavernosus += -1.00;
      totalMG += 1.00;
      totalHornersSyndrome += -0.50;
      totalAdieTonicPupil += 0.00;
    }
    if (widget.pandanganGanda.contains(
        'pandangan ganda membaik dengan posisi kepala miring (head tilt)')) {
      totalNAION += -0.50;
      totalGCA += -0.50;
      totalCON += -0.50;
      totalION += -0.50;
      totalTON += -0.50;
      totalONAtrophy += -0.50;
      totalNeuritisOptik += -0.50;
      totalMonocranialNervePalsyIII += -0.50;
      totalMonocranialNervePalsyIV += 1.00;
      totalMonocranialNervePalsyVI += 0.20;
      totalMulticranialNervePlalsyOrbitalApex += 0.20;
      totalMulticranialNervePlalsySinusCavernosus += 0.20;
      totalMG += -0.50;
      totalHornersSyndrome += -0.50;
      totalAdieTonicPupil += -0.50;
    }

    if (widget.nyeriMataKepalaRahang.contains('nyeri bola mata')) {
      totalNAION += -1.00;
      totalGCA += -1.00;
      totalCON += 0.10;
      totalION += 0.10;
      totalTON += -0.50;
      totalONAtrophy += -0.50;
      totalNeuritisOptik += 1.00;
      totalMonocranialNervePalsyIII += -0.50;
      totalMonocranialNervePalsyIV += -0.50;
      totalMonocranialNervePalsyVI += -0.50;
      totalMulticranialNervePlalsyOrbitalApex += 0.20;
      totalMulticranialNervePlalsySinusCavernosus += 0.50;
      totalMG += -0.50;
      totalHornersSyndrome += -0.50;
      totalAdieTonicPupil += -0.50;
    }

    if (widget.nyeriMataKepalaRahang.contains('nyeri kepala')) {
      totalNAION += -0.50;
      totalGCA += 1.00;
      totalCON += 0.50;
      totalION += 0.50;
      totalTON += 0.30;
      totalONAtrophy += 0.10;
      totalNeuritisOptik += 0.20;
      totalMonocranialNervePalsyIII += 0.10;
      totalMonocranialNervePalsyIV += 0.10;
      totalMonocranialNervePalsyVI += 0.00;
      totalMulticranialNervePlalsyOrbitalApex += 1.00;
      totalMulticranialNervePlalsySinusCavernosus += 1.00;
      totalMG += -0.50;
      totalHornersSyndrome += 0.20;
      totalAdieTonicPupil += -0.50;
    }

    if (widget.nyeriMataKepalaRahang
        .contains('nyeri rahang terutama dirasakan ketika mengunyah')) {
      totalNAION += -1.00;
      totalGCA += 1.00;
      totalCON += -1.00;
      totalION += -1.00;
      totalTON += -0.50;
      totalONAtrophy += 0.10;
      totalNeuritisOptik += 0.00;
      totalMonocranialNervePalsyIII += -0.50;
      totalMonocranialNervePalsyIV += -0.50;
      totalMonocranialNervePalsyVI += -0.50;
      totalMulticranialNervePlalsyOrbitalApex += 0.20;
      totalMulticranialNervePlalsySinusCavernosus += 0.20;
      totalMG += 0.30;
      totalHornersSyndrome += -0.50;
      totalAdieTonicPupil += -0.50;
    }

    if (widget.kelopakMataTurun.isNotEmpty) {
      totalNAION += -1.00;
      totalGCA += -0.50;
      totalCON += 0.10;
      totalION += 0.10;
      totalTON += -0.50;
      totalONAtrophy += -0.50;
      totalNeuritisOptik += -0.50;
      totalMonocranialNervePalsyIII += 1.00;
      totalMonocranialNervePalsyIV += -0.50;
      totalMonocranialNervePalsyVI += -1.00;
      totalMulticranialNervePlalsyOrbitalApex += 1.00;
      totalMulticranialNervePlalsySinusCavernosus += 1.00;
      totalMG += 1.00;
      totalHornersSyndrome += 1.00;
      totalAdieTonicPupil += -1.00;
    }

    if (widget.kelopakMataTurun
        .contains('kelopak mata turun membaik dengan istirahat')) {
      totalNAION += 0.00;
      totalGCA += -1.00;
      totalCON += -0.50;
      totalION += -0.50;
      totalTON += 0.00;
      totalONAtrophy += -0.50;
      totalNeuritisOptik += -0.50;
      totalMonocranialNervePalsyIII += -1.00;
      totalMonocranialNervePalsyIV += -1.00;
      totalMonocranialNervePalsyVI += -1.00;
      totalMulticranialNervePlalsyOrbitalApex += -1.00;
      totalMulticranialNervePlalsySinusCavernosus += -1.00;
      totalMG += 1.00;
      totalHornersSyndrome += -0.50;
      totalAdieTonicPupil += 0.00;
    }

    //Bagian Riwayat
    if (widget.riwayatDemamGigiRadang == 'Ya') {
      totalNAION += -0.50;
      totalGCA += -0.50;
      totalCON += -0.50;
      totalION += 0.10;
      totalTON += 0.00;
      totalONAtrophy += 0.10;
      totalNeuritisOptik += 1.00;
      totalMonocranialNervePalsyIII += 0.00;
      totalMonocranialNervePalsyIV += 0.00;
      totalMonocranialNervePalsyVI += 0.00;
      totalMulticranialNervePlalsyOrbitalApex += 0.00;
      totalMulticranialNervePlalsySinusCavernosus += 0.00;
      totalMG += 0.00;
      totalHornersSyndrome += -0.50;
      totalAdieTonicPupil += -0.50;
    }
    if (widget.riwayatPenyakitSistemik == 'Ya') {
      totalNAION += 1.00;
      totalGCA += 0.50;
      totalCON += 0.20;
      totalION += 0.00;
      totalTON += 0.10;
      totalONAtrophy += 0.50;
      totalNeuritisOptik += -0.50;
      totalMonocranialNervePalsyIII += 0.50;
      totalMonocranialNervePalsyIV += 0.50;
      totalMonocranialNervePalsyVI += 0.50;
      totalMulticranialNervePlalsyOrbitalApex += 0.30;
      totalMulticranialNervePlalsySinusCavernosus += 0.30;
      totalMG += 0.00;
      totalHornersSyndrome += 0.20;
      totalAdieTonicPupil += 1.00;
    }

    if (widget.riwayatPengobatanKardiovaskular == 'Ya') {
      totalNAION += 1.00;
      totalGCA += 0.30;
      totalCON += 0.20;
      totalION += -0.50;
      totalTON += 0.10;
      totalONAtrophy += 0.10;
      totalNeuritisOptik += -0.50;
      totalMonocranialNervePalsyIII += 0.50;
      totalMonocranialNervePalsyIV += 0.50;
      totalMonocranialNervePalsyVI += 0.50;
      totalMulticranialNervePlalsyOrbitalApex += 0.20;
      totalMulticranialNervePlalsySinusCavernosus += 0.20;
      totalMG += 0.00;
      totalHornersSyndrome += 0.10;
      totalAdieTonicPupil += 0.20;
    }

    if (widget.riwayatGangguanImunitas == 'Ya') {
      totalNAION += -0.50;
      totalGCA += 0.30;
      totalCON += -1.00;
      totalION += 0.20;
      totalTON += 0.00;
      totalONAtrophy += 0.10;
      totalNeuritisOptik += 1.00;
      totalMonocranialNervePalsyIII += -0.50;
      totalMonocranialNervePalsyIV += -0.50;
      totalMonocranialNervePalsyVI += -0.50;
      totalMulticranialNervePlalsyOrbitalApex += -0.50;
      totalMulticranialNervePlalsySinusCavernosus += -0.50;
      totalMG += 1.00;
      totalHornersSyndrome += 0.50;
      totalAdieTonicPupil += 0.50;
    }

    if (widget.riwayatKonsumsiAlkohol == 'Ya') {
      totalNAION += 0.10;
      totalGCA += -0.50;
      totalCON += -1.00;
      totalION += -1.00;
      totalTON += 1.00;
      totalONAtrophy += 0.10;
      totalNeuritisOptik += -0.50;
      totalMonocranialNervePalsyIII += -0.50;
      totalMonocranialNervePalsyIV += -0.50;
      totalMonocranialNervePalsyVI += -0.50;
      totalMulticranialNervePlalsyOrbitalApex += -0.50;
      totalMulticranialNervePlalsySinusCavernosus += -0.50;
      totalMG += -0.50;
      totalHornersSyndrome += -0.50;
      totalAdieTonicPupil += -0.50;
    }

    if (widget.riwayatPengobatanBatuk == 'Ya') {
      totalNAION += -0.50;
      totalGCA += -0.50;
      totalCON += 0.00;
      totalION += 0.20;
      totalTON += 1.00;
      totalONAtrophy += 0.10;
      totalNeuritisOptik += 0.50;
      totalMonocranialNervePalsyIII += -0.50;
      totalMonocranialNervePalsyIV += -0.50;
      totalMonocranialNervePalsyVI += -0.50;
      totalMulticranialNervePlalsyOrbitalApex += -0.50;
      totalMulticranialNervePlalsySinusCavernosus += -0.50;
      totalMG += -0.50;
      totalHornersSyndrome += 0.00;
      totalAdieTonicPupil += 0.00;
    }

    if (widget.riwayatPengobatanHormonal == 'Ya') {
      totalNAION += -0.50;
      totalGCA += -0.50;
      totalCON += 1.00;
      totalION += 0.50;
      totalTON += 0.00;
      totalONAtrophy += 0.10;
      totalNeuritisOptik += -0.50;
      totalMonocranialNervePalsyIII += 0.20;
      totalMonocranialNervePalsyIV += 0.20;
      totalMonocranialNervePalsyVI += 0.20;
      totalMulticranialNervePlalsyOrbitalApex += 0.10;
      totalMulticranialNervePlalsySinusCavernosus += 0.00;
      totalMG += -0.50;
      totalHornersSyndrome += 0.50;
      totalAdieTonicPupil += 0.00;
    }

    if (widget.riwayatTraumaKepala == 'Ya') {
      totalNAION += -0.50;
      totalGCA += -0.50;
      totalCON += 0.50;
      totalION += 0.00;
      totalTON += -0.50;
      totalONAtrophy += 1.00;
      totalNeuritisOptik += -0.50;
      totalMonocranialNervePalsyIII += 0.50;
      totalMonocranialNervePalsyIV += 0.50;
      totalMonocranialNervePalsyVI += 0.50;
      totalMulticranialNervePlalsyOrbitalApex += 0.80;
      totalMulticranialNervePlalsySinusCavernosus += 0.50;
      totalMG += -0.50;
      totalHornersSyndrome += 0.50;
      totalAdieTonicPupil += 0.20;
    }

    if (widget.riwayatTumorKepala == 'Ya') {
      totalNAION += -0.50;
      totalGCA += -0.50;
      totalCON += 1.00;
      totalION += 1.00;
      totalTON += -1.00;
      totalONAtrophy += 0.10;
      totalNeuritisOptik += -0.50;
      totalMonocranialNervePalsyIII += 0.50;
      totalMonocranialNervePalsyIV += 0.50;
      totalMonocranialNervePalsyVI += 0.50;
      totalMulticranialNervePlalsyOrbitalApex += 0.20;
      totalMulticranialNervePlalsySinusCavernosus += 0.20;
      totalMG += -0.50;
      totalHornersSyndrome += 0.50;
      totalAdieTonicPupil += 0.20;
    }

    if (widget.riwayatSleepApnea == 'Ya') {
      totalNAION += 1.00;
      totalGCA += -1.00;
      totalCON += 0.00;
      totalION += -1.00;
      totalTON += 0.00;
      totalONAtrophy += 0.10;
      totalNeuritisOptik += -0.50;
      totalMonocranialNervePalsyIII += -0.50;
      totalMonocranialNervePalsyIV += -0.50;
      totalMonocranialNervePalsyVI += -0.50;
      totalMulticranialNervePlalsyOrbitalApex += -0.50;
      totalMulticranialNervePlalsySinusCavernosus += -0.50;
      totalMG += -0.50;
      totalHornersSyndrome += -0.50;
      totalAdieTonicPupil += -0.50;
    }

    if (widget.riwayatKemoterapi == 'Ya') {
      totalNAION += -0.50;
      totalGCA += -0.50;
      totalCON += 0.80;
      totalION += 1.00;
      totalTON += -0.80;
      totalONAtrophy += 0.10;
      totalNeuritisOptik += 0.10;
      totalMonocranialNervePalsyIII += 0.20;
      totalMonocranialNervePalsyIV += 0.20;
      totalMonocranialNervePalsyVI += 0.20;
      totalMulticranialNervePlalsyOrbitalApex += -0.50;
      totalMulticranialNervePlalsySinusCavernosus += -0.50;
      totalMG += -0.50;
      totalHornersSyndrome += 0.10;
      totalAdieTonicPupil += 0.10;
    }

    //Bagian Node
    if (widget.gangguanGerakanBolaMata == 'Abnormal') {
      totalNAION += -1.00;
      totalGCA += 1.00;
      totalCON += 0.10;
      totalION += 0.10;
      totalTON += -1.00;
      totalONAtrophy += -1.00;
      totalNeuritisOptik += -1.00;
      totalMonocranialNervePalsyIII += 1.00;
      totalMonocranialNervePalsyIV += 1.00;
      totalMonocranialNervePalsyVI += 1.00;
      totalMulticranialNervePlalsyOrbitalApex += 1.00;
      totalMulticranialNervePlalsySinusCavernosus += 1.00;
      totalMG += 0.50;
      totalHornersSyndrome += 1.00;
      totalAdieTonicPupil += -1.00;
    }

    if (widget.gangguanLapangPandang == 'Abnormal') {
      totalNAION += 1.00;
      totalGCA += 1.00;
      totalCON += 1.00;
      totalION += 1.00;
      totalTON += 1.00;
      totalONAtrophy += 1.00;
      totalNeuritisOptik += 1.00;
      totalMonocranialNervePalsyIII += 0.50;
      totalMonocranialNervePalsyIV += 0.50;
      totalMonocranialNervePalsyVI += 0.30;
      totalMulticranialNervePlalsyOrbitalApex += 0.30;
      totalMulticranialNervePlalsySinusCavernosus += 0.30;
      totalMG += 0.50;
      totalHornersSyndrome += 0.50;
      totalAdieTonicPupil += -1.0;
    }

    if (widget.penurunanSensitivitasWarna == 'Abnormal') {
      totalNAION += 1.00;
      totalGCA += 1.00;
      totalCON += 0.50;
      totalION += 0.50;
      totalTON += 1.00;
      totalONAtrophy += 0.80;
      totalNeuritisOptik += 0.80;
      totalMonocranialNervePalsyIII += -1.00;
      totalMonocranialNervePalsyIV += -1.00;
      totalMonocranialNervePalsyVI += 0.00;
      totalMulticranialNervePlalsyOrbitalApex += 0.10;
      totalMulticranialNervePlalsySinusCavernosus += 0.10;
      totalMG += 0.10;
      totalHornersSyndrome += 0.10;
      totalAdieTonicPupil += 0.10;
    }

    if (widget.penurunanVisus == 'Abnormal') {
      totalNAION += 1.00;
      totalGCA += 1.00;
      totalCON += 0.50;
      totalION += 0.50;
      totalTON += 1.00;
      totalONAtrophy += 0.90;
      totalNeuritisOptik += 1.00;
      totalMonocranialNervePalsyIII += 0.50;
      totalMonocranialNervePalsyIV += 0.50;
      totalMonocranialNervePalsyVI += 0.00;
      totalMulticranialNervePlalsyOrbitalApex += 1.00;
      totalMulticranialNervePlalsySinusCavernosus += -1.00;
      totalMG += 0.30;
      totalHornersSyndrome += 0.50;
      totalAdieTonicPupil += 0.30;
    }

    if (widget.ptosis == 'Ptosis') {
      totalNAION += -1.00;
      totalGCA += -1.00;
      totalCON += 0.10;
      totalION += 0.10;
      totalTON += -1.00;
      totalONAtrophy += -1.00;
      totalNeuritisOptik += -1.00;
      totalMonocranialNervePalsyIII += 1.00;
      totalMonocranialNervePalsyIV += -1.00;
      totalMonocranialNervePalsyVI += 0.00;
      totalMulticranialNervePlalsyOrbitalApex += 1.00;
      totalMulticranialNervePlalsySinusCavernosus += 1.00;
      totalMG += 1.00;
      totalHornersSyndrome += 1.00;
      totalAdieTonicPupil += -1.00;
    }
    if (widget.refleksPupilAbnormal == 'Abnormal') {
      totalNAION += 0.50;
      totalGCA += 0.50;
      totalCON += 1.00;
      totalION += 1.00;
      totalTON += 1.00;
      totalONAtrophy += 1.00;
      totalNeuritisOptik += 1.00;
      totalMonocranialNervePalsyIII += 1.00;
      totalMonocranialNervePalsyIV += -1.00;
      totalMonocranialNervePalsyVI += -1.00;
      totalMulticranialNervePlalsyOrbitalApex += 1.00;
      totalMulticranialNervePlalsySinusCavernosus += 1.00;
      totalMG += -1.00;
      totalHornersSyndrome += 1.00;
      totalAdieTonicPupil += 1.00;
    }

    //end
  }

  Future<void> insertData() async {
    final data = {
      NodeTestData.nama: widget.nama,
      NodeTestData.usia: widget.usia,
      NodeTestData.jenisKelamin: widget.jenisKelamin,
      NodeTestData.gangguanPenglihatan: widget.gangguanPenglihatan.join(','),
      NodeTestData.pandanganGanda: widget.pandanganGanda.join(','),
      NodeTestData.nyeriMataKepalaRahang:
          widget.nyeriMataKepalaRahang.join(','),
      NodeTestData.kelopakMataTurun: widget.kelopakMataTurun.join(','),
      NodeTestData.riwayatDemamGigiRadang: widget.riwayatDemamGigiRadang,
      NodeTestData.riwayatPenyakitSistemik: widget.riwayatPenyakitSistemik,
      NodeTestData.riwayatPengobatanKardiovaskular:
          widget.riwayatPengobatanKardiovaskular,
      NodeTestData.riwayatGangguanImunitas: widget.riwayatGangguanImunitas,
      NodeTestData.riwayatKonsumsiAlkohol: widget.riwayatKonsumsiAlkohol,
      NodeTestData.riwayatPengobatanBatuk: widget.riwayatPengobatanBatuk,
      NodeTestData.riwayatPengobatanHormonal: widget.riwayatPengobatanHormonal,
      NodeTestData.riwayatTraumaKepala: widget.riwayatTraumaKepala,
      NodeTestData.riwayatTumorKepala: widget.riwayatTumorKepala,
      NodeTestData.riwayatSleepApnea: widget.riwayatSleepApnea,
      NodeTestData.riwayatKemoterapi: widget.riwayatKemoterapi,
      NodeTestData.gangguanGerakanBolaMata: widget.gangguanGerakanBolaMata,
      NodeTestData.gangguanLapangPandang: widget.gangguanLapangPandang,
      NodeTestData.penurunanSensitivitasWarna:
          widget.penurunanSensitivitasWarna,
      NodeTestData.penurunanVisus: widget.penurunanVisus,
      NodeTestData.ptosis: widget.ptosis,
      NodeTestData.refleksPupilAbnormal: widget.refleksPupilAbnormal,
      NodeTestData.totalNAION: totalNAION,
      NodeTestData.totalGCA: totalGCA,
      NodeTestData.totalCON: totalCON,
      NodeTestData.totalION: totalION,
      NodeTestData.totalTON: totalTON,
      NodeTestData.totalONAtrophy: totalONAtrophy,
      NodeTestData.totalNeuritisOptik: totalNeuritisOptik,
      NodeTestData.totalMonocranialNervePalsyIII: totalMonocranialNervePalsyIII,
      NodeTestData.totalMonocranialNervePalsyIV: totalMonocranialNervePalsyIV,
      NodeTestData.totalMonocranialNervePalsyVI: totalMonocranialNervePalsyVI,
      NodeTestData.totalMulticranialNervePlalsyOrbitalApex:
          totalMulticranialNervePlalsyOrbitalApex,
      NodeTestData.totalMulticranialNervePlalsySinusCavernosus:
          totalMulticranialNervePlalsySinusCavernosus,
      NodeTestData.totalMG: totalMG,
      NodeTestData.totalHornersSyndrome: totalHornersSyndrome,
      NodeTestData.totalAdieTonicPupil: totalAdieTonicPupil,
    };
    await SheetAPI.insert([data]);
  }

  @override
  void initState() {
    checkResult();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    insertData();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Diagnosis Result'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContainerTest(
                      judul: 'Diagnosa Pasien',
                      desc: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            child: SfCartesianChart(
                              primaryXAxis: CategoryAxis(
                                labelIntersectAction:
                                    AxisLabelIntersectAction.rotate45,
                              ),
                              series: <ChartSeries>[
                                LineSeries<ChartData, String>(
                                  dataSource: <ChartData>[
                                    ChartData('NAION', totalNAION),
                                    ChartData('GCA', totalGCA),
                                    ChartData('CON', totalCON),
                                    ChartData('ION', totalION),
                                    ChartData('TON', totalTON),
                                    ChartData('ON Atrophy', totalONAtrophy),
                                    ChartData(
                                        'Neuritis Optik', totalNeuritisOptik),
                                    ChartData('MNP III',
                                        totalMonocranialNervePalsyIII),
                                    ChartData(
                                        'MNP IV', totalMonocranialNervePalsyIV),
                                    ChartData(
                                        'MNP VI', totalMonocranialNervePalsyVI),
                                    ChartData('MNP Apex',
                                        totalMulticranialNervePlalsyOrbitalApex),
                                    ChartData('MNP-S Cavernosus',
                                        totalMulticranialNervePlalsySinusCavernosus),
                                    ChartData('MG', totalMG),
                                    ChartData('Horners', totalHornersSyndrome),
                                    ChartData(
                                        'Adie Tonic', totalAdieTonicPupil),
                                  ],
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y,
                                  enableTooltip: true,
                                  markerSettings:
                                      const MarkerSettings(isVisible: true),
                                  dataLabelSettings:
                                      const DataLabelSettings(isVisible: true),
                                ),
                              ],
                              trackballBehavior: TrackballBehavior(
                                enable: true,
                                lineType: TrackballLineType.vertical,
                                lineWidth: 2,
                                lineColor: Colors.blue,
                                shouldAlwaysShow: true,
                                lineDashArray: const [5, 5],
                                activationMode: ActivationMode.singleTap,
                                tooltipDisplayMode:
                                    TrackballDisplayMode.groupAllPoints,
                                markerSettings: const TrackballMarkerSettings(
                                  markerVisibility:
                                      TrackballVisibilityMode.hidden,
                                ),
                                tooltipAlignment: ChartAlignment.center,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'NAION - Non Arteritic Anterior Ischemic Neuropathy: ${totalNAION.toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'GCA - Giant Cell Arteritis/Arteritic Anterior Ischemic Neuropathy: ${totalGCA.toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Compressive Optic Neuropathy: ${totalCON.toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            'Infiltrative Optic Neuropathy: ${totalION.toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Toxic Optic Neuropathy: ${totalTON.toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Optic Nerve Atrophy: ${totalONAtrophy.toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Neuritis Optik: ${totalNeuritisOptik.toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            'Monocranial Nerve Palsy - N.III: ${totalMonocranialNervePalsyIII.toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Monocranial Nerve Palsy - N.IV: ${totalMonocranialNervePalsyIV.toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Monocranial Nerve Palsy - N.VI: ${totalMonocranialNervePalsyVI.toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Multicranial Nerve Plalsy - Orbital Apex: ${totalMulticranialNervePlalsyOrbitalApex.toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            'Multicranial Nerve Plalsy - Sinus Cavernosus: ${totalMulticranialNervePlalsySinusCavernosus.toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'MG - Myasthenia Gravis: ${totalMG.toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Horners Syndrome: ${totalHornersSyndrome.toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Adie Tonic Pupil: ${totalAdieTonicPupil.toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      )),
                  const SizedBox(height: 8),
                  ContainerTest(
                      judul: 'Biodata Pasien',
                      desc: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nama: ${widget.nama}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Usia: ${widget.usia} Tahun',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Jenis Kelamin: ${widget.jenisKelamin}',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      )),
                  const SizedBox(height: 8),
                  ContainerTest(
                      judul: 'Keluhan Pasien',
                      desc: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Gangguan Penglihatan: ${widget.gangguanPenglihatan.join(", ")}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Pandangan Ganda: ${widget.pandanganGanda.join(", ")}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Nyeri Mata/Kepala/Rahang: ${widget.nyeriMataKepalaRahang.join(", ")}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Kelopak Mata Turun: ${widget.kelopakMataTurun.join(", ")}',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      )),
                  const SizedBox(height: 8),
                  ContainerTest(
                      judul: 'Riwayat Penyakit Pasien',
                      desc: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Riwayat Demam/Gigi/Radang: ${widget.riwayatDemamGigiRadang}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Riwayat Penyakit Sistemik: ${widget.riwayatPenyakitSistemik}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Riwayat Pengobatan Kardiovaskular: ${widget.riwayatPengobatanKardiovaskular}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Riwayat Gangguan Imunitas: ${widget.riwayatGangguanImunitas}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Riwayat Konsumsi Alkohol: ${widget.riwayatKonsumsiAlkohol}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Riwayat Pengobatan Batuk: ${widget.riwayatPengobatanBatuk}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Riwayat Pengobatan Hormonal: ${widget.riwayatPengobatanHormonal}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Riwayat Trauma Kepala: ${widget.riwayatTraumaKepala}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Riwayat Tumor Kepala: ${widget.riwayatTumorKepala}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Riwayat Sleep Apnea: ${widget.riwayatSleepApnea}',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Riwayat Kemoterapi: ${widget.riwayatKemoterapi}',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      )),
                  const SizedBox(height: 8),
                  ContainerTest(
                    judul: 'Penelitian Nodes',
                    desc: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Gangguan Gerakan Bola Mata: ${widget.gangguanGerakanBolaMata}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Gangguan Lapang Pandang: ${widget.gangguanLapangPandang}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Penurunan Sensitivitas Warna: ${widget.penurunanSensitivitasWarna}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Penurunan Visus: ${widget.penurunanVisus}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Posisi Kelopak Mata: ${widget.ptosis}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Refleks Pupil Abnormal: ${widget.refleksPupilAbnormal}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
