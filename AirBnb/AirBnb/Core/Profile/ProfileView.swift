import SwiftUI

struct ProfileView: View 
{
    var body: some View 
    {
        VStack
        {
            VStack(alignment: .leading, spacing: 32, content: {
                VStack(alignment: .leading, spacing: 8, content: {
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                    Text("Log in to start planning your next trip")
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
                
                HStack
                {
                    Text("Don't have an account?")
                    Text("Sign up")
                        .fontWeight(.semibold)
                        .underline()
                }
                .font(.caption)
            })
            
            VStack(spacing: 24, content: {
                ProfileOptionsRow(icon: "gear", title: "Settings")
                ProfileOptionsRow(icon: "gear", title: "Accesibility")
                ProfileOptionsRow(icon: "questionmark.circle", title: "Visit the Help Center")
            })
            .padding(.vertical)
        }
    }
}

#Preview 
{
    ProfileView()
}

struct ProfileOptionsRow: View 
{
    var icon: String
    var title: String
    
    var body: some View
    {
        VStack
        {
            HStack(spacing: 10)
            {
                Image(systemName: icon)
                
                Text(title)
                    .font(.subheadline)
                
                Spacer()
                
                Image(systemName:"chevron.right")
            }
            .padding(.horizontal)
            .padding(.bottom)
            
            Divider()
            
        }
    }
}
