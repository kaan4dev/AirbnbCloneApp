import SwiftUI

class Preview
{
    static let shared = Preview()
    
    var listing: [Listing] =
    [
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, ownerName: "Murat", ownerImageUrl: "user", noOfBedrooms: 1, noOfBathrooms: 1, noOfBeds: 2, pricePerNight: 1400, latitude: 41.297603, longitude: 36.296480, adress: "Körfez Mahallesi", city: "Samsun", state: "Atakum", title: "1+1 Lüks Daire Atakum Körfez", rating: 4.86, feature: [.selfCheckIn, .superHost], amenities: [.wifi, .alarmSystem, .balcony], imageURL: ["Image 4", "Image 1", "Image 2"], type: .apartment),
        
            .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, ownerName: "Sernaz", ownerImageUrl: "user", noOfBedrooms: 4, noOfBathrooms: 3, noOfBeds: 5, pricePerNight: 10000, latitude: 41.318840, longitude: 36.250450, adress: "Yalı Mahellesi", city: "Samsun", state: "Atakum", title: "Villanar Samsun Atakum ısıtmalı havuzlu", rating: 5, feature: [.selfCheckIn, .superHost], amenities: [.wifi, .alarmSystem, .balcony], imageURL: ["Image 2", "Image 3", "Image 1"], type: .villa),
        
            .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, ownerName: "Yusuf", ownerImageUrl: "user", noOfBedrooms: 2, noOfBathrooms: 3, noOfBeds: 4, pricePerNight: 2500, latitude: 41.316950, longitude: 36.263640, adress: "İsmet İnönü Bulvarı", city: "Samsun", state: "Atakum", title: "Huzurun adresi…", rating: 3.45, feature: [.selfCheckIn, .superHost], amenities: [.wifi, .alarmSystem, .balcony, .laundry], imageURL: ["Image 3", "Image 1", "Image 2"], type: .apartment),
    ]
}
