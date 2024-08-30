import SwiftUI

struct CallsTabScreen: View {
    @State private var searchText = ""
    @State private var callHistory = CallHistory.all
    var body: some View {
        NavigationStack{
            List{
                // Create Call Section
                Section {
                    CreateCallLink()
                        .listRowSeparator(.hidden)
                }
                
                // Recent Call Record Section
                Section{
                    ForEach(0..<12){_ in
                        RecentCallItemView()
                    }
                   
                }header: {
                    Text("Recent")
                        .bold()
                        .font(.headline)
                        .textCase(nil)
                        .foregroundStyle(.whatsAppBlack)
                }
                
            }
            .navigationTitle("Calls")
            .searchable(text: $searchText)
            .toolbar{
                leadingNavItem()
                trailingNavItem()
                principalNavItem()
            }
        }
    }
}

// Navigation bar
extension CallsTabScreen {
    
    @ToolbarContentBuilder
    private func leadingNavItem() -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading){
            Button("Edit"){}
        }
    }
    
    @ToolbarContentBuilder
    private func trailingNavItem() -> some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing){
            Button{
                
            }label: {
                Image(systemName: "phone.arrow.up.right")
            }
        }
    }
    
    @ToolbarContentBuilder
    private func principalNavItem() -> some ToolbarContent {
        ToolbarItem(placement: .principal){
            Picker("" ,selection: $callHistory){
                ForEach(CallHistory.allCases){item in
                    Text(item.rawValue.capitalized)
                        .tag(item)
                }
            }
            .pickerStyle(.segmented)
            .frame(width: 150)
        }
    }
    
    // enum for segmented control
    private enum CallHistory : String , CaseIterable,Identifiable {
        case all , missed
        
        var id : String {
            return rawValue
        }
    }
}

// Create Call Link
private struct CreateCallLink : View {
    var body : some View {
        HStack{
            Button {
                
            }label: {
                Image(systemName: "link")
                    .foregroundStyle(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .font(.callout)
                    .padding(5)
                    .background(Color(.systemGray5))
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
            }
            VStack (alignment : .leading){
                Text("Create Call Link")
                    .foregroundStyle(.blue)
                Text("Share a link for your WhatsApp call")
                    .foregroundStyle(.gray)
                    .font(.caption)
                
            }
        }
    }
}

// Recent Call Item View

private struct RecentCallItemView : View {
    var body : some View {
        HStack{
            Circle()
                .frame(width: 50 , height: 50)
            VStack(alignment : .leading){
                Text("Tushar Mahajan")
                HStack{
                    Image(systemName: "phone.arrow.up.right.fill")
                    Text("Outgoing")
                }
                .font(.caption)
                .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Text("Yesterday")
                .foregroundStyle(.gray)
            Button{
                
            }label: {
                Image(systemName: "info.circle")
                    
            }
        }
    }
}

// A Call Cell

#Preview {
    CallsTabScreen()
}
