import SwiftUI

enum DestinationSearchOptions 
{
    case location
    case dates
    case guests
}

struct DestinationSearchView: View 
{
    @Binding var show: Bool
    
    @State var destination: String = ""
    
    @State private var selectedOption: DestinationSearchOptions = .location
    
    @State private var startDate = Date()
    @State private var endDate = Date()
    
    @State private var numGuests = 0
    
    @State private var isDatePickerPresented = false
    
    var body: some View 
    {
        VStack(spacing: 26) 
        {
            HStack 
            {
                Button 
                {
                    withAnimation(.snappy) 
                    {
                        show.toggle()
                    }
                }
                label:
                {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundColor(.black)
                }
                
                Spacer()
                
                if !destination.isEmpty 
                {
                    Button("Clear") 
                    {
                        destination = ""
                        numGuests = 0
                        startDate = Date()
                        endDate = Date()
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding(.horizontal)

            VStack(alignment: .leading) 
            {
                if selectedOption == .location 
                {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack 
                    {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("Search Destinations", text: $destination)
                            .font(.subheadline)
                    }
                    .frame(height: 50)
                    .padding(.horizontal)
                    .overlay 
                    {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1.0)
                            .foregroundStyle(Color(.systemGray4))
                    }
                } 
                else
                {
                    CollapsedPickerView(title: "Where", description: "Add Destination")
                }
            }
            .padding()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal)
            .shadow(radius: 1)
            .onTapGesture {
                withAnimation(.snappy) 
                {
                    selectedOption = .location
                }
            }
            
            VStack(alignment: .leading) 
            {
                if selectedOption == .dates 
                {
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack 
                    {
                        Button(action: 
                                {
                            isDatePickerPresented.toggle()
                        }) 
                        {
                            HStack 
                            {
                                Text("From: \(formattedDate(startDate))")
                                Spacer()
                                Image(systemName: "calendar")
                            }
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                        }
                        
                        Divider()
                        
                        Button(action: 
                                {
                            isDatePickerPresented.toggle()
                        }) 
                        {
                            HStack 
                            {
                                Text("To: \(formattedDate(endDate))")
                                Spacer()
                                Image(systemName: "calendar")
                            }
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                        }
                    }
                } 
                else
                {
                    CollapsedPickerView(title: "When", description: "Add Date")
                }
            }
            .padding()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal)
            .shadow(radius: 1)
            .onTapGesture 
            {
                withAnimation(.snappy) 
                {
                    selectedOption = .dates
                }
            }
            .sheet(isPresented: $isDatePickerPresented) 
            {
                DatePickerSheet(startDate: $startDate, endDate: $endDate)
            }
            
            VStack(alignment: .leading) 
            {
                if selectedOption == .guests 
                {
                    Text("Who's coming?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Stepper 
                    {
                        Text("\(numGuests) Adults")
                    }
                    onIncrement:
                    {
                        numGuests += 1
                    } onDecrement: 
                    {
                        guard numGuests > 0 else { return }
                        numGuests -= 1
                    }
                } 
                else
                {
                    CollapsedPickerView(title: "Who", description: "Add Guests")
                }
            }
            .padding()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal)
            .shadow(radius: 1)
            .onTapGesture 
            {
                withAnimation(.snappy) 
                {
                    selectedOption = .guests
                }
            }
            
            Spacer()
        }
    }
    
    private func formattedDate(_ date: Date) -> String 
    {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

struct DatePickerSheet: View 
{
    @Binding var startDate: Date
    @Binding var endDate: Date
    
    var body: some View 
    {
        VStack 
        {
            DatePicker("From", selection: $startDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
            
            Divider()
            
            DatePicker("To", selection: $endDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
            
            Spacer()
        }
        .padding()
    }
}

struct CollapsedPickerView: View 
{
    let title: String
    let description: String
    
    var body: some View 
    {
        VStack 
        {
            HStack 
            {
                Text(title)
                    .foregroundStyle(.gray)
                Spacer()
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
    }
}

#Preview 
{
    DestinationSearchView(show: .constant(true))
}

//Former codes
/*
enum DestinationSearchOptions {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @Binding var show: Bool
    
    @State var destination: String = ""
    
    @State private var selectedOption: DestinationSearchOptions = .location
    
    @State private var startDate = Date()
    @State private var endDate = Date()
    
    @State private var numGuests = 0
    
    @State private var isDatePickerPresented = false
    
    var body: some View {
        VStack(spacing: 26) {
            HStack {
                Button {
                    withAnimation(.snappy) {
                        show.toggle()
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundColor(.black)
                }
                
                Spacer()
                
                if !destination.isEmpty {
                    Button("Clear") {
                        destination = ""
                        numGuests = 0
                        startDate = Date()
                        endDate = Date()
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding(.horizontal)

            VStack(alignment: .leading) {
                if selectedOption == .location {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("Search Destinations", text: $destination)
                            .font(.subheadline)
                    }
                    .frame(height: 50)
                    .padding(.horizontal)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1.0)
                            .foregroundStyle(Color(.systemGray4))
                    }
                } else {
                    CollapsedPickerView(title: "Where", description: "Add Destination")
                }
            }
            .padding()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal)
            .shadow(radius: 1)
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedOption = .location
                }
            }
            
            VStack(alignment: .leading) {
                if selectedOption == .dates {
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack {
                        Button(action: {
                            isDatePickerPresented.toggle()
                        }) {
                            HStack {
                                Text("From: \(formattedDate(startDate))")
                                Spacer()
                                Image(systemName: "calendar")
                            }
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                        }
                        
                        Divider()
                        
                        Button(action: {
                            isDatePickerPresented.toggle()
                        }) {
                            HStack {
                                Text("To: \(formattedDate(endDate))")
                                Spacer()
                                Image(systemName: "calendar")
                            }
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                        }
                    }
                } else {
                    CollapsedPickerView(title: "When", description: "Add Date")
                }
            }
            .padding()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal)
            .shadow(radius: 1)
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedOption = .dates
                }
            }
            .sheet(isPresented: $isDatePickerPresented) {
                DatePickerSheet(startDate: $startDate, endDate: $endDate)
            }
            
            VStack(alignment: .leading) {
                if selectedOption == .guests {
                    Text("Who's coming?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Stepper {
                        Text("\(numGuests) Adults")
                    } onIncrement: {
                        numGuests += 1
                    } onDecrement: {
                        guard numGuests > 0 else { return }
                        numGuests -= 1
                    }
                } else {
                    CollapsedPickerView(title: "Who", description: "Add Guests")
                }
            }
            .padding()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal)
            .shadow(radius: 1)
            .onTapGesture {
                withAnimation(.snappy) {
                    selectedOption = .guests
                }
            }
            
            Spacer()
        }
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

struct DatePickerSheet: View {
    @Binding var startDate: Date
    @Binding var endDate: Date
    
    var body: some View {
        VStack {
            DatePicker("From", selection: $startDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
            
            Divider()
            
            DatePicker("To", selection: $endDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
            
            Spacer()
        }
        .padding()
    }
}

struct CollapsedPickerView: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                Spacer()
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
    }
}

#Preview {
    DestinationSearchView(show: .constant(true))
}
 */
