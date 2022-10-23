class Seller {
  String? name, email, address, ifscCode;
  final int? sellerId;
  int? mobileNumber, accountNumber, memberCode;
  Seller({
    this.sellerId,
    this.name,
    this.accountNumber,
    this.mobileNumber,
    this.address,
    this.email,
    this.ifscCode,
    this.memberCode,
  });
}
