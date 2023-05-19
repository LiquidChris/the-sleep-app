import SwiftUI

struct ContentView: View {
    @State private var selectedMenuItem: String? = "Home"
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: Text("Sleep"), tag: "Sleep", selection: $selectedMenuItem) {
                    Label("Sleep", systemImage: "powersleep")
                }
                NavigationLink(destination: Text("Exercise"), tag: "Exercise", selection: $selectedMenuItem) {
                    Label("Exercise", systemImage: "figure.run")
                }
                NavigationLink(destination: Text("Diet"), tag: "Diet", selection: $selectedMenuItem) {
                    Label("Diet", systemImage: "fork.knife")
                }
            }
            .listStyle(SidebarListStyle())
            
            Text(selectedMenuItem ?? "Select an item")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
