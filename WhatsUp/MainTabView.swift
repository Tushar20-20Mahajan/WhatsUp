import SwiftUI

struct MainTabView: View {
    init(){
        makeTabbarOpaque()
    }
    var body: some View {
        
        TabView{
            UpdatesTabScreen()
                .tabItem {
                    Image(systemName: Tab.updates.icon)
                    Text(Tab.updates.title)
                }
            CallsTabScreen()
                .tabItem {
                    Image(systemName: Tab.calls.icon)
                    Text(Tab.calls.title)
                }
            CommunityTabScreen()
                .tabItem {
                    Image(systemName: Tab.communities.icon)
                    Text(Tab.communities.title)
                }
            placeholderView("Chats")
                .tabItem {
                    Image(systemName: Tab.chats.icon)
                    Text(Tab.chats.title)
                }
            placeholderView("Settings")
                .tabItem {
                    Image(systemName: Tab.settings.icon)
                    Text(Tab.settings.title)
                }
        }
    }
    private func makeTabbarOpaque(){
        let apparance = UITabBarAppearance()
        apparance.configureWithOpaqueBackground()
        UITabBar.appearance().standardAppearance = apparance
        UITabBar.appearance().scrollEdgeAppearance=apparance
    }
}

extension MainTabView{
    private func placeholderView(_ title : String) -> some View {
        ScrollView{
            VStack{
                ForEach(0..<120){_ in 
                    Text(title)
                        .font(.largeTitle)
                }
            }
        }
    }
    private enum Tab : String {
        case updates , calls , communities , chats , settings
        
        fileprivate var title : String{
            return rawValue.capitalized
        }
        
        fileprivate var icon : String {
            switch self{
                
            case .updates:
                return "circle.dashed.inset.filled"
            case .calls:
                return "phone"
            case .communities:
                return "person.3"
            case .chats:
                return "message"
            case .settings:
                return "gear"
            }
        }
    }
}

#Preview {
    MainTabView()
}
