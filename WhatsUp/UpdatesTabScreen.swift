import SwiftUI

struct UpdatesTabScreen: View {
    @State private var searchText = ""
    var body: some View {
        NavigationStack{
            List{
                // Section Status
                Section {
                    StatusSectionHeader()
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    StatusSection()
                        .listRowSeparator(.hidden)
                    
                }header: {
                    Text("Status")
                        .foregroundStyle(.whatsAppBlack)
                        .bold()
                        .font(.title3)
                        .textCase(nil)
                }
               
                // Section Recent Status
                Section{
                    RecentUpdatesItemView()
                        .listRowSeparator(.hidden)
                }header: {
                    Text("Recent Updates")
                }
                
                // Section Channels
                Section{
                    ChannelListView()
                        .listRowSeparator(.hidden)
                }header: {
                    
                    HStack{
                        Text("Channels")
                             .bold()
                             .font(.title3)
                             .textCase(nil)
                             .foregroundStyle(.whatsAppBlack)
                         
                         Spacer()
                         
                         Button{
                             
                         }label: {
                             Image(systemName: "plus")
                                 .padding(7)
                                 .background(Color(.systemGray5))
                                 .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                         }
                    }
                        
                }
                
            }
            .listStyle(.grouped)
            .navigationTitle("Updates")
            .searchable(text: $searchText)
        }
        
    }
    
   
}


// Status Section
// Use Status
private struct StatusSectionHeader: View {
    var body : some View {
        HStack(alignment:.top){
            Image(systemName: "circle.dashed")
                .foregroundStyle(.blue)
                .imageScale(.large)
            (
            Text("Use Status to share photos , text and videos that disappear in 24 hours.")
            +
            Text(" ")
            +
            Text("Status Privacy")
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .bold()
            )
            Image(systemName: "xmark")
                .foregroundStyle(.gray)
        }
        .padding()
        .background(.whatsAppWhite)
        .clipShape(RoundedRectangle(cornerRadius: 10 , style: .continuous))
    }
}

// My Status Section
private struct StatusSection : View {
    var body : some View {
        
        HStack{
            ZStack(alignment: .bottomTrailing){
                Circle()
                    .frame(width: 50 , height: 50)
                Image(systemName: "plus")
                    .offset(x: 0, y: 0)
                    .background(Color(.blue))
                    .clipShape(Circle())
                    .foregroundColor(.white)
            }
            VStack(alignment: .leading){
                Text("My Status")
                    .font(.callout)
                    .bold()
                Text("Add to my status")
                    .foregroundStyle(.gray)
                    .font(.system(size: 15))
            }
            
            Spacer()
            
            cameraButton()
            pencilButton()
        }
    }
    
    // Camera Button
    private func cameraButton() -> some View {
        Button{
            
        }label: {
            Image(systemName: "camera.fill")
                .padding(10)
                .background(Color(.systemGray4))
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .bold()
            
        }
    }
    
    // pencil Button
    private func pencilButton() -> some View {
        Button{
            
        }label: {
            Image(systemName: "pencil")
                .padding(10)
                .background(Color(.systemGray4))
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .bold()
            
        }
    }
    
}

// Recent Updates
private struct RecentUpdatesItemView : View {
    var body : some View {
        HStack{
            Circle()
                .frame(width: 50 , height: 50)
            
            VStack(alignment: .leading){
                Text("Tushar Mahajan")
                    .font(.callout)
                    .bold()
                Text("1h ago")
                    .foregroundStyle(.gray)
                    .font(.system(size: 15))
            }
            
        }
    }
}

// Channel section
private struct ChannelListView : View {
    var body : some View {
        VStack(alignment : .leading){
            Text("Stay updated on topics that matter to you . Find channels to follow below.")
                .foregroundStyle(.gray)
                .font(.callout)
                .padding(.horizontal)
            
            ScrollView(.horizontal , showsIndicators: false){
                HStack{
                    ForEach(0..<5){_ in
                        ChannelItemView()
                    }
                }
            }
            
            // Explore More Button
            Button{
                
            }label: {
                Text("Explore More")
                    .padding(8)
                    .bold()
                    .background(Color(.blue))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                
            }
            .padding(.vertical)
        }
    }
}

// Individual Channel
private struct ChannelItemView : View {
    var body : some View {
        VStack{
            Circle()
                .frame(width: 50 , height: 50)
            Text("Panda Gang")
            Button{
                
            }label: {
                Text("Follow")
                    .bold()
                    .padding(5)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.opacity(0.2))
                    .clipShape(Capsule())
            }
        }
        .padding(.horizontal , 16)
        .padding(.vertical)
        .overlay(
        RoundedRectangle(cornerRadius: 10)
            .stroke(Color(.systemGray4),lineWidth: 1)
        )
    }
    
}

#Preview {
    UpdatesTabScreen()
}
