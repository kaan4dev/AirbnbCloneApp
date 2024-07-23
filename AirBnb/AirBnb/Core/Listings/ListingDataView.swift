import SwiftUI
import MapKit

struct ListingDataView: View
{
   
    @Environment(\.dismiss) var dismiss
    
    let listing: Listing
    
    var body: some View
    {
        ScrollView
        {
            ZStack(alignment: .topLeading, content:
            {
                ListingImageCarouseView(images: listing.imageURL)
                    .frame(height: 400)
                
                
                Button
                {
                    dismiss()
                }
                label:
                {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background
                    {
                        Circle()
                            .fill(.white)
                            .frame(width: 32, height: 32)
                    }
                    .padding(32)
                }
            })
            
            VStack(alignment: .leading, spacing: 0)
            {
                Text("\(listing.title)")
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading, content: {
                    HStack(spacing: 2, content: {
                        Image(systemName: "star.fill")
                        
                        Text("\(listing.rating)")
                        
                        Text("-")
                        
                        Text("22 reviews")
                            .underline()
                            .fontWeight(.semibold)
                    })
                    .foregroundStyle(.black)
                    
                    Text("\(listing.city), \(listing.state)")
                })
                .font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            HStack
            {
                VStack(alignment: .leading, spacing: 8, content: {
                    Text("Entire rents hosted by \(listing.ownerName)")
                        .font(.headline)
                    
                    HStack(spacing: 2, content: {
                        Text("\(listing.noOfBeds) Guests - ")
                        Text("\(listing.noOfBeds) bedroom - ")
                        Text("\(listing.noOfBedrooms) bed - ")
                        Text("\(listing.noOfBathrooms) bath")
                    })
                    .font(.caption)
                })
                
                Spacer()
                
                Image("\(listing.ownerImageUrl)")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            }
            .padding()
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16, content: {
                ForEach(0 ..< 2)
                {
                    feature in
                    HStack(spacing: 12, content: {
                        Image(systemName: "medal")
                        
                        VStack(alignment: .leading, content: {
                            Text("Superhero")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text("Superhosts are experience, highly rated hosts who are commited to providing great stars for guests")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        })
                    })
                }
            })
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16, content: {
                Text("Where you'll sleep")
                    .font(.headline)
                
                ScrollView(.horizontal, showsIndicators: false)
                {
                    HStack(spacing: 16, content: {
                        ForEach(0 ..< 5)
                        {
                            bedroom in
                            VStack
                            {
                                Image(systemName: "bed.double")
                                
                                Text("Bedroom \(bedroom)")
                            }
                            .frame(width: 132, height: 100)
                            .overlay
                            {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.gray)
                            }
                        }
                    })
                }
                .scrollTargetBehavior(.paging)
            })
            .padding()
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16, content: {
                Text("Where you'll be")
                    .font(.headline)
                
                Map()
                    .frame(height: 200)
                    .clipShape(.rect(cornerRadius: 12))
            })
            .padding()
        }
        .padding(.bottom, 64)
        .overlay(alignment: .bottom)
        {
            VStack
            {
                Divider()
                    .padding(.bottom)
                
                HStack
                {
                    VStack(alignment: .leading)
                    {
                        Text("3988₺")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("Total with taxes")
                            .font(.footnote)
                        
                        Text("Nov 18 - 22")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                    }
                    
                    Spacer()
                    
                    Button(action: {})
                    {
                        Text("Reserve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .clipShape(.rect(cornerRadius: 8))
                    }
                }
                .padding(.horizontal, 32)
            }
            .background(.white)
        }
    }
}

#Preview 
{
    Explore()
}
