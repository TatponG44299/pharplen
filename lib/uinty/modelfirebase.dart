class Model {
  String a1, a2, a3, a4, a5, a6, im;

  Model(this.a1, this.a2, this.a3, this.a4, this.a5, this.a6, this.im);

  Model.fromMap(Map<String, dynamic> map) {
    a1 = map['IDRoom'];
    a2 = map['Month'];
    a3 = map['PeiceRoom'];
    a4 = map['PriceEletric'];
    a5 = map['PriceOther'];
    a6 = map['PriceWater'];
    im = map['Total'];
  }
}
