//
//  ContentView.swift
//  lab3week2
//ContentView
//  Created by Juhaina on 15/01/1445 AH.
//
import UIKit
import SwiftUI

struct ContentView: View {
    @State private var detailText: String = ""
    @State private var isToggled: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Main View")
                    .font(.largeTitle)
                    .padding()
                
                NavigationLink(destination: DetailView(detailText: detailText)) {
                    Text("Go to Detail View")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                TextField("Enter text", text: $detailText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    isToggled.toggle()
                }) {
                    Text(isToggled ? "Toggle Off" : "Toggle On")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                if isToggled {
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 100, height: 100)
                        .padding()
                } else {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 100, height: 100)
                        .padding()
                }
            }
            .navigationBarTitle("My App", displayMode: .large)
        }
    }
}

struct DetailView: View {
    var detailText: String
    
    var body: some View {
        VStack {
            Text("Detail View")
                .font(.largeTitle)
                .padding()
            
            Text("Received Text: \(detailText)")
                .font(.title)
                .padding()
        }
    }
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let contentView = ContentView()
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIHostingController(rootView: contentView)
        self.window = window
        window.makeKeyAndVisible()
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
