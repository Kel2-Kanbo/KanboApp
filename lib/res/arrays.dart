import 'package:flutter/cupertino.dart';
import 'package:kanbo/model/office.dart';
import 'package:kanbo/model/order.dart';
import 'package:kanbo/model/payment.dart';
import 'package:kanbo/model/review_response.dart';
import 'package:kanbo/model/room.dart';
import 'package:kanbo/model/specification.dart';

import '../model/nearby_places.dart';
import '../model/profile.dart';
import '../screen/chat/chat_screen.dart';
import '../screen/history/history_screen.dart';
import '../screen/home/home_screen.dart';
import '../screen/profile/profile_screen.dart';

class Arrays {
  final mainScreens = const [
    HomeScreen(),
    HistoryScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  final listProfile = [
    Profile(title: 'Personal Information', destination: Container()),
    Profile(title: 'Transaction history', destination: Container()),
    Profile(title: 'Privacy', destination: Container()),
    Profile(title: 'Setting', destination: Container()),
  ];

  final listOffice = [
    Office(
      officeId: 0,
      rating: 4.5,
      review: 2,
      address: 'SCBD, Jakarta Selatan',
      description:
          'Tersedia 20 ruangan di one pacific place yang dapat anda sewa.',
      longAddress:
          'Jl. Jend. Sudirman Kav. 52-53, SCBD, Daerah Khusus Ibukota Jakarta 14470',
      title: 'One Pacific Place',
      image:
          'https://s3-ap-southeast-1.amazonaws.com/xwork-bucket/buildings/images/305/One%20Pacific%20Place-1474281748.34.thumb.jpg',
      nearbyPlaces: [
        NearbyPlaces(
            nearbyId: 0,
            title: 'Halte Istora Mandiri',
            distance: 0.5,
            estimate: 20,
            category: 'Transportation'),
        NearbyPlaces(
            nearbyId: 1,
            title: 'GBK',
            distance: 1,
            estimate: 30,
            category: 'Stadium')
      ],
      listRoom: [
        Room(
            roomId: 0,
            officeId: 0,
            title: '11b',
            pricePerDay: 50000,
            thumbnails: [
              'https://s3-ap-southeast-1.amazonaws.com/xwork-gallery/rooms/images/1650/1521087443.85/1650_1521087443.85.lg.JPEG',
              'https://s3-ap-southeast-1.amazonaws.com/xwork-gallery/rooms/images/1650/1521087392.77/1650_1521087392.77.lg.JPEG'
            ],
            facilities: [
              'Free mineral water',
              'Free coffee and tea',
              'Free Whiteboard dan spidol'
            ],
            description:
                'Ruang meeting yang ideal dan berlokasi strategis di pusat kota ini terletak di lantai 11, memiliki desain yang minimalis dan kasual dengan dapat menampung kapasitas untuk 5 orang. Konsep desain minimalis dan santai terlihat dari pemilihan warnanya yaitu abu-abu, mulai dari dinding abu-abunya yang sederhana dan membuat pikiran Anda jernih, pemilihan warna yang santai pada kursi yang membuat nyaman, warna coklat klasik yang terbuat dari kayu untuk mejanya sangat pas dan penggunaan plafon yang minimalis dengan penerangan yang baik membuat ruangan ini menjadi lebih baik. Ruang meeting ini juga menyediakan TV LCD untuk melengkapi kebutuhan Anda, jangan ragu untuk bertanya kepada petugas jika Anda membutuhkannya untuk keperluan video conference atau bahkan untuk memutarkan sebuah video laporan atau presentasi. Di tengah-tengah meja bundar yang telah disediakan terdapat alat tulis dan kertas untuk keperluan meeting Anda. Ruang meeting ini juga dapat menjaga privasi Anda karena ruangan ini termasuk tertutup dan jauh dari kebisingan sehingga dapat membuat kegiatan meeting Anda menjadi lebih nyaman dan dapat fokus terhadap tujuan meeting Anda. Selain cocok dijadikan ruang meeting, ruangan ini juga cocok untuk menjadi Ruang Belajar, Conference Call, Ruang Diskusi, Ruang Interview, Ruang Kantor, Ruang Konsultasi, Ruang Audit, Ruang Presentasi, hingga Ruang Psikotest.',
            specification: Specification(
                roomId: 0,
                capacity: 5,
                luas: 45.5,
                table: 'Board Table',
                floor: 11),
            review:
                ReviewResponse(roomId: 0, rating: 0, review: 0, listReview: []))
      ],
    )
  ];

  final listPayment = [
    Payment(
        paymentId: 0,
        title: 'Mandiri',
        image:
            'https://logos-download.com/wp-content/uploads/2016/06/Mandiri_logo.png',
        numberVa: '1234567890'),
    Payment(
        paymentId: 1,
        title: 'Danamon',
        image:
            'https://logos-download.com/wp-content/uploads/2016/06/Bank_Danamon_logo.png',
        numberVa: '1234567890'),
    Payment(
        paymentId: 2,
        title: 'BNI',
        image:
            'https://blogger.googleusercontent.com/img/a/AVvXsEh80LH3T3peVBULYHQuUrBV-Jw5PhVSd76meIkiWPZLOYld5pS0L1qIytIKG0dYx5T6Uai4gPxCsJk8g-74s2VRKLjAd4ZcqdUI_cuNGrsccRktlzpDAFLHm5iFfBdFAD0FPS1r32ddoXLe4tFZqp-cwKqlMSj5TzHM2Wrja9r4bhb39Hz7ntoXMaDM-w=s320',
        numberVa: '12345667789'),
    Payment(
        paymentId: 3,
        title: 'BSI',
        image:
            'https://1.bp.blogspot.com/-fgCnibV7yXc/YBvz5m1oozI/AAAAAAAAH4Y/xrOboX0Z3Z88vJBVmwS0cpxiYe530nDegCLcBGAsYHQ/w640-h218/logo-bank-syariah-indonesia.png',
        numberVa: '12345657890')
  ];

  final listBooking = <Order>[];
}
