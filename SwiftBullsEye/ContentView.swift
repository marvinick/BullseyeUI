//
//  ContentView.swift
//  SwiftBullsEye
//
//  Created by Marvin Nikijuluw on 9/15/19.
//  Copyright © 2019 Marvin Nikijuluw. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    @State var whoIsVisible: Bool = false
    
    var body: some View {
        HStack {
            VStack {
                Text("Welcome to my first app")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.green)
                Button(action: {
                    print("Button pressed")
                    self.alertIsVisible = true
                }) {
                    Text("Hit me")
                }
                .alert(isPresented: $alertIsVisible) { () ->
                    Alert in
                    return Alert(title: Text("Hello there!"), message: Text("This is my message button."), dismissButton: .default(Text("Awesome!")))
                }
            }
            
            VStack {
                Text("Second one, knock knock joke")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.red)
                Button(action: {
                    print("Button pressed")
                    self.whoIsVisible = true
                }) {
                    Text("Joke")
                }
                .alert(isPresented: $whoIsVisible) { () ->
                    Alert in
                    return Alert(title: Text("Who's there!"), message: Text("Cow. Bondi. Babe."), dismissButton: .default(Text("Eww!")))
                }
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
