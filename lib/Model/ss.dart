class Ss {
  Ss({
      this.status, 
      this.responseCode, 
      this.data,});

  Ss.fromJson(dynamic json) {
    status = json['status'];
    responseCode = json['response_code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? status;
  int? responseCode;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['response_code'] = responseCode;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.availableTrips,});

  Data.fromJson(dynamic json) {
    if (json['availableTrips'] != null) {
      availableTrips = [];
      json['availableTrips'].forEach((v) {
        availableTrips?.add(AvailableTrips.fromJson(v));
      });
    }
  }
  List<AvailableTrips>? availableTrips;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (availableTrips != null) {
      map['availableTrips'] = availableTrips?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class AvailableTrips {
  AvailableTrips({
      this.ac, 
      this.additionalCommission, 
      this.agentServiceCharge, 
      this.agentServiceChargeAllowed, 
      this.arrivalTime, 
      this.availCatCard, 
      this.availSrCitizen, 
      this.availableSeats, 
      this.avlWindowSeats, 
      this.boCommission, 
      this.boPriorityOperator, 
      this.boardingTimes, 
      this.bookable, 
      this.bpDpSeatLayout, 
      this.busCancelled, 
      this.busImageCount, 
      this.busRoutes, 
      this.busType, 
      this.busTypeId, 
      this.callFareBreakUpAPI, 
      this.cancellationPolicy, 
      this.departureTime, 
      this.destination, 
      this.doj, 
      this.dropPointMandatory, 
      this.droppingTimes, 
      this.duration, 
      this.exactSearch, 
      this.fareDetails, 
      this.fares, 
      this.flatComApplicable, 
      this.flatSSComApplicable, 
      this.gdsCommission, 
      this.groupOfferPriceEnabled, 
      this.happyHours, 
      this.id, 
      this.idProofRequired, 
      this.imagesMetadataUrl, 
      this.isLMBAllowed, 
      this.liveTrackingAvailable, 
      this.maxSeatsPerTicket, 
      this.nextDay, 
      this.noSeatLayoutEnabled, 
      this.nonAC, 
      this.offerPriceEnabled, 
      this.operator, 
      this.otgEnabled, 
      this.partialCancellationAllowed, 
      this.partnerBaseCommission, 
      this.primaryPaxCancellable, 
      this.primo, 
      this.routeId, 
      this.rtc, 
      this.sSAgentAccount, 
      this.seater, 
      this.selfInventory, 
      this.singleLadies, 
      this.sleeper, 
      this.source, 
      this.tatkalTime, 
      this.travels, 
      this.unAvailable, 
      this.vaccinatedBus, 
      this.vaccinatedStaff, 
      this.vehicleType, 
      this.zeroCancellationTime, 
      this.mTicketEnabled,});

  AvailableTrips.fromJson(dynamic json) {
    ac = json['AC'];
    additionalCommission = json['additionalCommission'];
    agentServiceCharge = json['agentServiceCharge'];
    agentServiceChargeAllowed = json['agentServiceChargeAllowed'];
    arrivalTime = json['arrivalTime'];
    availCatCard = json['availCatCard'];
    availSrCitizen = json['availSrCitizen'];
    availableSeats = json['availableSeats'];
    avlWindowSeats = json['avlWindowSeats'];
    boCommission = json['boCommission'];
    boPriorityOperator = json['boPriorityOperator'];
    boardingTimes = json['boardingTimes'] != null ? BoardingTimes.fromJson(json['boardingTimes']) : null;
    bookable = json['bookable'];
    bpDpSeatLayout = json['bpDpSeatLayout'];
    busCancelled = json['busCancelled'];
    busImageCount = json['busImageCount'];
    busRoutes = json['busRoutes'];
    busType = json['busType'];
    busTypeId = json['busTypeId'];
    callFareBreakUpAPI = json['callFareBreakUpAPI'];
    cancellationPolicy = json['cancellationPolicy'];
    departureTime = json['departureTime'];
    destination = json['destination'];
    doj = json['doj'];
    dropPointMandatory = json['dropPointMandatory'];
    droppingTimes = json['droppingTimes'] != null ? DroppingTimes.fromJson(json['droppingTimes']) : null;
    duration = json['duration'];
    exactSearch = json['exactSearch'];
    fareDetails = json['fareDetails'] != null ? FareDetails.fromJson(json['fareDetails']) : null;
    fares = json['fares'];
    flatComApplicable = json['flatComApplicable'];
    flatSSComApplicable = json['flatSSComApplicable'];
    gdsCommission = json['gdsCommission'];
    groupOfferPriceEnabled = json['groupOfferPriceEnabled'];
    happyHours = json['happyHours'];
    id = json['id'];
    idProofRequired = json['idProofRequired'];
    imagesMetadataUrl = json['imagesMetadataUrl'];
    isLMBAllowed = json['isLMBAllowed'];
    liveTrackingAvailable = json['liveTrackingAvailable'];
    maxSeatsPerTicket = json['maxSeatsPerTicket'];
    nextDay = json['nextDay'];
    noSeatLayoutEnabled = json['noSeatLayoutEnabled'];
    nonAC = json['nonAC'];
    offerPriceEnabled = json['offerPriceEnabled'];
    operator = json['operator'];
    otgEnabled = json['otgEnabled'];
    partialCancellationAllowed = json['partialCancellationAllowed'];
    partnerBaseCommission = json['partnerBaseCommission'];
    primaryPaxCancellable = json['primaryPaxCancellable'];
    primo = json['primo'];
    routeId = json['routeId'];
    rtc = json['rtc'];
    sSAgentAccount = json['SSAgentAccount'];
    seater = json['seater'];
    selfInventory = json['selfInventory'];
    singleLadies = json['singleLadies'];
    sleeper = json['sleeper'];
    source = json['source'];
    tatkalTime = json['tatkalTime'];
    travels = json['travels'];
    unAvailable = json['unAvailable'];
    vaccinatedBus = json['vaccinatedBus'];
    vaccinatedStaff = json['vaccinatedStaff'];
    vehicleType = json['vehicleType'];
    zeroCancellationTime = json['zeroCancellationTime'];
    mTicketEnabled = json['mTicketEnabled'];
  }
  String? ac;
  String? additionalCommission;
  String? agentServiceCharge;
  String? agentServiceChargeAllowed;
  String? arrivalTime;
  String? availCatCard;
  String? availSrCitizen;
  String? availableSeats;
  String? avlWindowSeats;
  String? boCommission;
  String? boPriorityOperator;
  BoardingTimes? boardingTimes;
  String? bookable;
  String? bpDpSeatLayout;
  String? busCancelled;
  String? busImageCount;
  String? busRoutes;
  String? busType;
  String? busTypeId;
  String? callFareBreakUpAPI;
  String? cancellationPolicy;
  String? departureTime;
  String? destination;
  String? doj;
  String? dropPointMandatory;
  DroppingTimes? droppingTimes;
  String? duration;
  String? exactSearch;
  FareDetails? fareDetails;
  String? fares;
  String? flatComApplicable;
  String? flatSSComApplicable;
  String? gdsCommission;
  String? groupOfferPriceEnabled;
  String? happyHours;
  String? id;
  String? idProofRequired;
  String? imagesMetadataUrl;
  String? isLMBAllowed;
  String? liveTrackingAvailable;
  String? maxSeatsPerTicket;
  String? nextDay;
  String? noSeatLayoutEnabled;
  String? nonAC;
  String? offerPriceEnabled;
  String? operator;
  String? otgEnabled;
  String? partialCancellationAllowed;
  String? partnerBaseCommission;
  String? primaryPaxCancellable;
  String? primo;
  String? routeId;
  String? rtc;
  String? sSAgentAccount;
  String? seater;
  String? selfInventory;
  String? singleLadies;
  String? sleeper;
  String? source;
  String? tatkalTime;
  String? travels;
  String? unAvailable;
  String? vaccinatedBus;
  String? vaccinatedStaff;
  String? vehicleType;
  String? zeroCancellationTime;
  String? mTicketEnabled;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['AC'] = ac;
    map['additionalCommission'] = additionalCommission;
    map['agentServiceCharge'] = agentServiceCharge;
    map['agentServiceChargeAllowed'] = agentServiceChargeAllowed;
    map['arrivalTime'] = arrivalTime;
    map['availCatCard'] = availCatCard;
    map['availSrCitizen'] = availSrCitizen;
    map['availableSeats'] = availableSeats;
    map['avlWindowSeats'] = avlWindowSeats;
    map['boCommission'] = boCommission;
    map['boPriorityOperator'] = boPriorityOperator;
    if (boardingTimes != null) {
      map['boardingTimes'] = boardingTimes?.toJson();
    }
    map['bookable'] = bookable;
    map['bpDpSeatLayout'] = bpDpSeatLayout;
    map['busCancelled'] = busCancelled;
    map['busImageCount'] = busImageCount;
    map['busRoutes'] = busRoutes;
    map['busType'] = busType;
    map['busTypeId'] = busTypeId;
    map['callFareBreakUpAPI'] = callFareBreakUpAPI;
    map['cancellationPolicy'] = cancellationPolicy;
    map['departureTime'] = departureTime;
    map['destination'] = destination;
    map['doj'] = doj;
    map['dropPointMandatory'] = dropPointMandatory;
    if (droppingTimes != null) {
      map['droppingTimes'] = droppingTimes?.toJson();
    }
    map['duration'] = duration;
    map['exactSearch'] = exactSearch;
    if (fareDetails != null) {
      map['fareDetails'] = fareDetails?.toJson();
    }
    map['fares'] = fares;
    map['flatComApplicable'] = flatComApplicable;
    map['flatSSComApplicable'] = flatSSComApplicable;
    map['gdsCommission'] = gdsCommission;
    map['groupOfferPriceEnabled'] = groupOfferPriceEnabled;
    map['happyHours'] = happyHours;
    map['id'] = id;
    map['idProofRequired'] = idProofRequired;
    map['imagesMetadataUrl'] = imagesMetadataUrl;
    map['isLMBAllowed'] = isLMBAllowed;
    map['liveTrackingAvailable'] = liveTrackingAvailable;
    map['maxSeatsPerTicket'] = maxSeatsPerTicket;
    map['nextDay'] = nextDay;
    map['noSeatLayoutEnabled'] = noSeatLayoutEnabled;
    map['nonAC'] = nonAC;
    map['offerPriceEnabled'] = offerPriceEnabled;
    map['operator'] = operator;
    map['otgEnabled'] = otgEnabled;
    map['partialCancellationAllowed'] = partialCancellationAllowed;
    map['partnerBaseCommission'] = partnerBaseCommission;
    map['primaryPaxCancellable'] = primaryPaxCancellable;
    map['primo'] = primo;
    map['routeId'] = routeId;
    map['rtc'] = rtc;
    map['SSAgentAccount'] = sSAgentAccount;
    map['seater'] = seater;
    map['selfInventory'] = selfInventory;
    map['singleLadies'] = singleLadies;
    map['sleeper'] = sleeper;
    map['source'] = source;
    map['tatkalTime'] = tatkalTime;
    map['travels'] = travels;
    map['unAvailable'] = unAvailable;
    map['vaccinatedBus'] = vaccinatedBus;
    map['vaccinatedStaff'] = vaccinatedStaff;
    map['vehicleType'] = vehicleType;
    map['zeroCancellationTime'] = zeroCancellationTime;
    map['mTicketEnabled'] = mTicketEnabled;
    return map;
  }

}

class FareDetails {
  FareDetails({
      this.bankTrexAmt, 
      this.baseFare, 
      this.bookingFee, 
      this.childFare, 
      this.gst, 
      this.levyFare, 
      this.markupFareAbsolute, 
      this.markupFarePercentage, 
      this.opFare, 
      this.opGroupFare, 
      this.operatorServiceChargeAbsolute, 
      this.operatorServiceChargePercentage, 
      this.serviceCharge, 
      this.serviceTaxAbsolute, 
      this.serviceTaxPercentage, 
      this.srtFee, 
      this.tollFee, 
      this.totalFare,});

  FareDetails.fromJson(dynamic json) {
    bankTrexAmt = json['bankTrexAmt'];
    baseFare = json['baseFare'];
    bookingFee = json['bookingFee'];
    childFare = json['childFare'];
    gst = json['gst'];
    levyFare = json['levyFare'];
    markupFareAbsolute = json['markupFareAbsolute'];
    markupFarePercentage = json['markupFarePercentage'];
    opFare = json['opFare'];
    opGroupFare = json['opGroupFare'];
    operatorServiceChargeAbsolute = json['operatorServiceChargeAbsolute'];
    operatorServiceChargePercentage = json['operatorServiceChargePercentage'];
    serviceCharge = json['serviceCharge'];
    serviceTaxAbsolute = json['serviceTaxAbsolute'];
    serviceTaxPercentage = json['serviceTaxPercentage'];
    srtFee = json['srtFee'];
    tollFee = json['tollFee'];
    totalFare = json['totalFare'];
  }
  String? bankTrexAmt;
  String? baseFare;
  String? bookingFee;
  String? childFare;
  String? gst;
  String? levyFare;
  String? markupFareAbsolute;
  String? markupFarePercentage;
  String? opFare;
  String? opGroupFare;
  String? operatorServiceChargeAbsolute;
  String? operatorServiceChargePercentage;
  String? serviceCharge;
  String? serviceTaxAbsolute;
  String? serviceTaxPercentage;
  String? srtFee;
  String? tollFee;
  String? totalFare;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bankTrexAmt'] = bankTrexAmt;
    map['baseFare'] = baseFare;
    map['bookingFee'] = bookingFee;
    map['childFare'] = childFare;
    map['gst'] = gst;
    map['levyFare'] = levyFare;
    map['markupFareAbsolute'] = markupFareAbsolute;
    map['markupFarePercentage'] = markupFarePercentage;
    map['opFare'] = opFare;
    map['opGroupFare'] = opGroupFare;
    map['operatorServiceChargeAbsolute'] = operatorServiceChargeAbsolute;
    map['operatorServiceChargePercentage'] = operatorServiceChargePercentage;
    map['serviceCharge'] = serviceCharge;
    map['serviceTaxAbsolute'] = serviceTaxAbsolute;
    map['serviceTaxPercentage'] = serviceTaxPercentage;
    map['srtFee'] = srtFee;
    map['tollFee'] = tollFee;
    map['totalFare'] = totalFare;
    return map;
  }

}

class DroppingTimes {
  DroppingTimes({
      this.address, 
      this.bpId, 
      this.bpName, 
      this.contactNumber, 
      this.landmark, 
      this.location, 
      this.prime, 
      this.time,});

  DroppingTimes.fromJson(dynamic json) {
    address = json['address'];
    bpId = json['bpId'];
    bpName = json['bpName'];
    contactNumber = json['contactNumber'];
    landmark = json['landmark'];
    location = json['location'];
    prime = json['prime'];
    time = json['time'];
  }
  String? address;
  String? bpId;
  String? bpName;
  String? contactNumber;
  String? landmark;
  String? location;
  String? prime;
  String? time;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = address;
    map['bpId'] = bpId;
    map['bpName'] = bpName;
    map['contactNumber'] = contactNumber;
    map['landmark'] = landmark;
    map['location'] = location;
    map['prime'] = prime;
    map['time'] = time;
    return map;
  }

}

class BoardingTimes {
  BoardingTimes({
      this.address, 
      this.bpId, 
      this.bpName, 
      this.contactNumber, 
      this.landmark, 
      this.location, 
      this.prime, 
      this.time,});

  BoardingTimes.fromJson(dynamic json) {
    address = json['address'];
    bpId = json['bpId'];
    bpName = json['bpName'];
    contactNumber = json['contactNumber'];
    landmark = json['landmark'];
    location = json['location'];
    prime = json['prime'];
    time = json['time'];
  }
  String? address;
  String? bpId;
  String? bpName;
  String? contactNumber;
  String? landmark;
  String? location;
  String? prime;
  String? time;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = address;
    map['bpId'] = bpId;
    map['bpName'] = bpName;
    map['contactNumber'] = contactNumber;
    map['landmark'] = landmark;
    map['location'] = location;
    map['prime'] = prime;
    map['time'] = time;
    return map;
  }

}