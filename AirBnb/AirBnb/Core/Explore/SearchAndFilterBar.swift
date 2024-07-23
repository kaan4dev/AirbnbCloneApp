import SwiftUI

struct SearchAndFilterBar: View 
{
    var body: some View 
    {
        HStack
        {
            Image(systemName: "magnifyingglass")
            
            VStack(alignment: .leading, content: {
                Text("Where to?")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text("Anywhere - Any Week - Add Guests")
                    .font(.caption2)
                    .foregroundStyle(.gray)
            })
            
            Spacer()
            
            Button
            {
                
            }
        label:
            {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundColor(.black)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .overlay
        {
            Capsule()
                .stroke(lineWidth: 0.5)
                .foregroundColor(Color(.systemGray4))
                .shadow(color: .black.opacity(0.4), radius: 2)
        }
    }
}

#Preview 
{
    SearchAndFilterBar()
}
