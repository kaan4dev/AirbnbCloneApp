import SwiftUI

struct ListingImageCarouseView: View 
{
    let images: [String]
    
    var body: some View
    {
        TabView
        {
            ForEach(images, id: \.self)
            {
                image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}

