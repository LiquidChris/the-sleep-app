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

<<<<<<< HEAD
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
=======
struct AnswerView: View {
    let question: Question
    @Binding var answer: String?
    
    var body: some View {
        VStack {
            Text(question.text)
            TextField("Answer", text: Binding(
                get: { answer ?? "" }.
                set: { answer = $0 }
            ))
            $answer ?? "")
        }
        .padding()
    }
}

struct Screen1View: View {
    var body: some View {
        Text("Screen 1")
            .font(.title)
            .padding()
    }
}

struct Screen2View: View {
    var body: some View {
        Text("Screen 2")
            .font(.title)
            .padding()
    }
}

struct Screen3View: View {
    var body: some View {
        Text("Screen 3")
            .font(.title)
            .padding()
    }
}

struct AppSidebarNavigation: View {
    enum NavigationItem {
        case screen1, screen2, screen3
    }
    
    @State private var selectedItem: NavigationItem?
    
    var body: some View {
        NavigationView {
            if selectedItem == nil {
                VStack {
                    NavigationLink(destination: Screen1View(), tag: .screen1, selection: $selectedItem) {
                        Button("Screen 1") {
                            selectedItem = .screen1
                        }
                    }
                    NavigationLink(destination: Screen2View(), tag: .screen2, selection: $selectedItem) {
                        Button("Screen 2") {
                            selectedItem = .screen2
                        }
                    }
                    NavigationLink(destination: Screen3View(), tag: .screen3, selection: $selectedItem) {
                        Button("Screen 3") {
                            selectedItem = .screen3
                        }
                    }
                }
                .padding()
            } else {
                List(selection: $selectedItem) {
                    NavigationLink(destination: Screen1View(), tag: .screen1, selection: $selectedItem) {
                        Label("Screen 1", systemImage: "1.circle")
                    }
                    NavigationLink(destination: Screen2View(), tag: .screen2, selection: $selectedItem) {
                        Label("Screen 2", systemImage: "2.circle")
                    }
                    NavigationLink(destination: Screen3View(), tag: .screen3, selection: $selectedItem) {
                        Label("Screen 3", systemImage: "3.circle")
                    }
                }
                .listStyle(SidebarListStyle())
                .navigationTitle("App Sidebar")
            }
        }
    }
}

//@main
struct QuestionnaireApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
>>>>>>> ebd75167d52d5c413ebba779765f06b23676b028
    }
}
