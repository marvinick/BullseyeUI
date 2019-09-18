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
    @State var sliderValue: Double = 50
    
    var body: some View {
        
        VStack {
            Spacer()
            //Target row
            HStack {
                Text("Put the bullseye as close as you can to:")
                Text("100")
            }
            Spacer()
            //Slider row
            HStack {
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
            }
            Spacer()
            //Button row
            Button(action: {
                print("Button pressed")
                self.alertIsVisible = true
            }) {
                Text("Hit me")
            }
            .alert(isPresented: $alertIsVisible) { () ->
                Alert in
                var roundedValue: Int = Int(sliderValue.rounded())
                return Alert(title: Text("Hello there!"), message: Text("This slider value is \(roundedValue)."), dismissButton: .default(Text("Awesome!")))
            }
            Spacer()
            //score row
            HStack {
                Button(action: {}) {
                    Text("Start over")
                }
                Spacer()
                Text("Score:")
                Text("9999")
                Spacer()
                Text("Placeholder")
                Text("9999")
                Spacer()
                Button(action: {}) {
                    Text("Info")
                }
            }
            .padding(.bottom, 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
