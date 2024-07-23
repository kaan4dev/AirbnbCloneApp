import SwiftUI

struct WishlistView: View 
{
    var body: some View
    {
        NavigationStack
        {
            VStack(alignment: .leading, spacing: 32, content: {
                VStack(alignment: .leading, spacing: 4, content: {
                    Text("Log in to see your wishlist")
                        .font(.headline)
                    
                    Text("You can create, view or edit wishlists")
                        .font(.footnote)
                })
               
                Button
                {
                    
                }
            label:
                {
                    Text("Log in")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 48)
                        .background(.pink)
                        .clipShape(.rect(cornerRadius: 10))
                }
                
                Spacer()
                
            })
            .padding()
            .navigationTitle("Wishlists")
        }
    }
}

#Preview 
{
    WishlistView()
}
