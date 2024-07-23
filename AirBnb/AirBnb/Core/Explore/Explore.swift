import SwiftUI

struct Explore: View 
{
    @State private var showDestinationSearchView = false
    
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    
    var body: some View
    {
        if showDestinationSearchView
        {
            DestinationSearchView(show: $showDestinationSearchView)
        }
        else
        {
            
        }
        NavigationStack
        {
            ScrollView
            {
                
                SearchAndFilterBar()
                    .onTapGesture {
                        withAnimation(.snappy)
                        {
                            showDestinationSearchView.toggle()
                        }
                    }
                
                LazyVStack(spacing: 22, content:
                    {
                    ForEach(viewModel.listings, id: \.self) 
                    {
                        listing in
                        NavigationLink(value: listing)
                        {
                            ListingView(listing: listing)
                                .foregroundColor(.black)
                        }
                    }
                }
                )
                .padding()
            }
            .navigationDestination(for: Listing.self) { listing in
                ListingDataView(listing: listing)
                    .navigationBarHidden(true)
            }
        }
    }
}

#Preview 
{
    Explore()
}
