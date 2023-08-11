class OffersModel{
  final String id;
  final String offerName;
  final String imagePath;
  final List<OfferDetails> offerList;

  OffersModel(this.id,this.offerName, this.imagePath, this.offerList);
}
class OfferDetails{
  final String offerImagePath;
  final String companyName;
  final String offerDetails;

  OfferDetails(this.offerImagePath, this.companyName ,this.offerDetails);
}