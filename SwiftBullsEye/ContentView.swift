//
//  ContentView.swift
//  SwiftBullsEye
//
//  Created by Marvin Nikijuluw on 9/15/19.
//  Copyright © 2019 Marvin Nikijuluw. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    @State var score = 0
    @State var round = 1
    
    var body: some View {
        
        VStack {
            Spacer()
            //Target row
            HStack {
                Text("Put the bullseye as close as you can to:")
                Text("\(target)")
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
                return Alert(title: Text(alertTitle()), message: Text(
                    "This slider value is \(sliderValueRounded()).\n" +
                    "You scored \(self.pointsForCurrentRound()) points this round"
                    ), dismissButton: .default(Text("Awesome!")) {
                        self.score = self.score + self.pointsForCurrentRound()
                        self.target = Int.random(in: 1...100)
                        self.round = self.round + 1
                    })
            }
            Spacer()
            //score row
            HStack {
                Button(action: {
                    self.startOver()
                }) {
                    Text("Start over")
                }
                Spacer()
                Text("Score:")
                Text("\(score)")
                Spacer()
                Text("Round")
                Text("\(round)")
                Spacer()
                Button(action: {}) {
                    Text("Info")
                }
            }
            .padding(.bottom, 20)
        }
    }
    
    func startOver() {
        score = 0
        round = 0
        sliderValue = 50.0
        target = Int.random(in: 1...100)
    }
    
    func sliderValueRounded() -> Int {
        Int(sliderValue.rounded())
    }
    
    func amountOff() -> Int {
        abs(target - sliderValueRounded())
    }
    
    func pointsForCurrentRound() -> Int {
        let maximumScore = 100
        let difference = amountOff()
        let bonus: Int
        if difference == 0 {
            bonus = 100
        } else if difference == 1 {
            bonus = 50
        } else {
            bonus = 0
        }
        return maximumScore - difference + bonus
    }
    
    func alertTitle() -> String {
        let difference = amountOff()
        let title: String
        if difference == 0 {
            title = "You almost had it"
        } else if difference < 5 {
            title = "You almost had it"
        } else if difference <= 10 {
            title = "not bad"
        } else {
            title = "Are you even trying?"
        }
        return title
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
