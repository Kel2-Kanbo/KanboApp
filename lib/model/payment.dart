import 'dart:convert';

class Payment {
  int paymentId;
  String title;
  String image;
  String numberVa;
  String? tutorialAtm;
  String? tutorialMBanking;
  String? tutorialiBanking;
  Payment({
    this.paymentId = 0,
    this.title = '-',
    this.image = '',
    this.numberVa = '-',
    this.tutorialAtm,
    this.tutorialMBanking,
    this.tutorialiBanking,
  });

  Payment copyWith({
    int? paymentId,
    String? title,
    String? image,
    String? numberVa,
    String? tutorialAtm,
    String? tutorialMBanking,
    String? tutorialiBanking,
  }) {
    return Payment(
      paymentId: paymentId ?? this.paymentId,
      title: title ?? this.title,
      image: image ?? this.image,
      numberVa: numberVa ?? this.numberVa,
      tutorialAtm: tutorialAtm ?? this.tutorialAtm,
      tutorialMBanking: tutorialMBanking ?? this.tutorialMBanking,
      tutorialiBanking: tutorialiBanking ?? this.tutorialiBanking,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'paymentId': paymentId});
    result.addAll({'title': title});
    result.addAll({'image': image});
    result.addAll({'numberVa': numberVa});
    if(tutorialAtm != null){
      result.addAll({'tutorialAtm': tutorialAtm});
    }
    if(tutorialMBanking != null){
      result.addAll({'tutorialMBanking': tutorialMBanking});
    }
    if(tutorialiBanking != null){
      result.addAll({'tutorialiBanking': tutorialiBanking});
    }
  
    return result;
  }

  factory Payment.fromMap(Map<String, dynamic> map) {
    return Payment(
      paymentId: map['paymentId']?.toInt() ?? 0,
      title: map['title'] ?? '',
      image: map['image'] ?? '',
      numberVa: map['numberVa'] ?? '',
      tutorialAtm: map['tutorialAtm'],
      tutorialMBanking: map['tutorialMBanking'],
      tutorialiBanking: map['tutorialiBanking'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Payment.fromJson(String source) => Payment.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Payment(paymentId: $paymentId, title: $title, image: $image, numberVa: $numberVa, tutorialAtm: $tutorialAtm, tutorialMBanking: $tutorialMBanking, tutorialiBanking: $tutorialiBanking)';
  }
}
