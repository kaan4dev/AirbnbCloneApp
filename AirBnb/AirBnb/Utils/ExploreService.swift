import SwiftUI

class ExploreService
{
    func fetchListings() async throws -> [Listing]
    {
        return Preview.shared.listing 
    }
}
