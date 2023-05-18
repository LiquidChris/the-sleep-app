//
//  ContentView.swift
//  The Sleep App
//
//  Created by Iyad Hassan on 5/17/23.
//

// import SwiftUI
// 
// struct ContentView: View {
//     var body: some View {
//         VStack {
//             Image(systemName: "globe")
//                 .imageScale(.large)
//                 .foregroundColor(.accentColor)
//             Text("Hello, world!")
//         }
//         .padding()
//     }
// }

// struct ContentView_Previews: PreviewProvider {
//     static var previews: some View {
//         ContentView()
//     }
// }


import SwiftUI

struct Question: Identifiable {
    let id = UUID()
    let text: String
}

struct ContentView: View {
    @State private var questions: [Question] = [
        Question(text: "Question 1"),
        Question(text: "Question 2"),
        Question(text: "Question 3")
    ]
    
    @State private var answers: [UUID: String] = [:]
    @State private var isQuestionnaireComplete = false
    
    var body: some View {
        if isQuestionnaireComplete {
            AppSidebarNavigation()
        } else {
            QuestionPromptView(questions: $questions, answers: $answers, isComplete: $isQuestionnaireComplete)
        }
    }
}

struct QuestionPromptView: View {
    @Binding var questions: [Question]
    @Binding var answers: [UUID: String]
    @Binding var isComplete: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                List(questions) { question in
                    NavigationLink(destination: AnswerView(question: question, answer: $answers[question.id])) {
                        Text(question.text)
                    }
                }
                
                Button(action: {
                    isComplete = true
                }) {
                    Text("Submit")
                }
            }
            .navigationTitle("Questionnaire")
        }
    }
}

struct AnswerView: View {
    let question: Question
    @Binding var answer: String?
    
    var body: some View {
        VStack {
            Text(question.text)
            TextField("Answer", text: $answer ?? "")
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

@main
struct QuestionnaireApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
