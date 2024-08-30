import SwiftUI

struct CommunityTabScreen: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading , spacing: 10){
                    Image(.communities)
                    
                    Group{
                        Text("Stay connected with a community")
                            .font(.title2)
                        
                        Text("Communities bring members together in topic-based groups. Any community you are added to will appear here.")
                            .foregroundStyle(.gray)
                    }
                    .padding(.horizontal , 5)
                    
                    HStack {
                        Button("See example communities"){ }
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    
                    createNewCommunityButton()
                    
                }
                .navigationTitle("Communities")
                .padding()
            }
        }
    }
    
    private func createNewCommunityButton() -> some View {
        HStack {
            Button{
                
            }label: {
                Label("New Community" , systemImage: "plus")
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(10)
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10 , style: .continuous))
                    .padding()
            }
        }
    }
}

#Preview {
    CommunityTabScreen()
}
