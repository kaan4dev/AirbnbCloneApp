import SwiftUI

struct MainTab: View 
{
    var body: some View 
    {
        TabView
        {
            Explore()
                .tabItem{ Label("Explore", systemImage: "magnifyingglass") }
            
            WishlistView()
                .tabItem{ Label("Wishlists", systemImage: "heart") }
            
            ProfileView()
                .tabItem{ Label("Profile", systemImage: "person") }
        }
    }
}

#Preview 
{
    MainTab()
}
