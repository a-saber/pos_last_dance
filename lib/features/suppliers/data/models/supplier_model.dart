class SupplierModel {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? address;
  String? commercialRegister;
  String? taxIdentificationNumber;
  String? note;
  String? imagePath;

  SupplierModel({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.address,
    this.commercialRegister,
    this.taxIdentificationNumber,
    this.note,
    this.imagePath,
  });

  static SupplierModel from(SupplierModel source) {
    return SupplierModel(
      id: source.id,
      name: source.name,
      phone: source.phone,
      email: source.email,
      address: source.address,
      commercialRegister: source.commercialRegister,
      taxIdentificationNumber: source.taxIdentificationNumber,
      note: source.note,
      imagePath: source.imagePath,
    );
  }
}
