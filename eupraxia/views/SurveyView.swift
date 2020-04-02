//
//  SurveyView.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 02/04/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import SwiftUI

struct SurveyView: View {

    private var feelings = ["Very bad", "Bad", "Average", "Good", "Very good"]
    private var weather = ["Sunny", "Cloudy", "Rainy", "Snowy"]
    private var work = ["Bad", "Average", "Good", "Did not work"]

    @State private var selectedFeeling = -1
    @State private var didEatBreakfast = false
    @State private var breakfastFood = ""
    @State private var didEatLunch = false
    @State private var lunchFood = ""
    @State private var didEatDinner = false
    @State private var dinnerFood = ""
    @State private var selectedWeather = -1
    @State private var selectedWork = -1
    @State private var didHaveSex = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("General")) {
                    Picker(selection: $selectedFeeling, label: Text("How did you feel")) {
                        ForEach(0..<self.feelings.count) {
                            Text(self.feelings[$0])
                        }
                    }
                }

                Section(header: Text("Food")) {
                    Toggle(isOn: $didEatBreakfast.animation()) {
                        Text("Did you eat at breakfast ?")
                    }
                    if self.didEatBreakfast {
                        TextField("What did you eat at breakfast", text: $breakfastFood)
                    }

                    Toggle(isOn: $didEatLunch.animation()) {
                        Text("Did you eat at lunch ?")
                    }
                    if self.didEatLunch {
                        TextField("What did you eat at lunch", text: $lunchFood)
                    }

                    Toggle(isOn: $didEatDinner.animation()) {
                        Text("Did you eat at dinner ?")
                    }
                    if self.didEatDinner {
                        TextField("What did you eat at dinner", text: $dinnerFood)
                    }
                }

                Section(header: Text("Weather")) {
                    Picker(selection: $selectedWeather, label: Text("How was the weather")) {
                        ForEach(0..<self.weather.count) {
                            Text(self.weather[$0])
                        }
                    }
                }

                Section(header: Text("Work")) {
                    Picker(selection: $selectedWork, label: Text("How was work")) {
                        ForEach(0..<self.work.count) {
                            Text(self.work[$0])
                        }
                    }
                }

                Section(header: Text("Personal")) {
                    Toggle(isOn: $didHaveSex) {
                        Text("Did you have sex today ?")
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("How was your day ?")
        }

    }
}

struct SurveyView_Previews: PreviewProvider {
    static var previews: some View {
        SurveyView()
    }
}
