import SwiftUI

struct ListingView: View 
{
    var listing: Listing
    
    var body: some View
    {
        VStack(spacing: 0, content: {
            ListingImageCarouseView(images: listing.imageURL)
                .frame(height: 300)
                .clipShape(.rect(cornerRadius: 20))
            
            HStack(alignment: .top)
            {
                VStack(alignment: .leading, content: 
                {
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.semibold)
                    Text("\(listing.adress)")
                        .foregroundStyle(.gray)
                    
                    Text("Nov 26 - 28")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing: 4, content: {
                        Text("$\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                    })
                })
                
                Spacer()
                
                HStack(spacing: 2, content: {
                    Image(systemName: "star.fill")
                    Text("4.3")
                })
            }
            .padding(.top)
        })
    }
}

#Preview 
{
    Explore()
}
