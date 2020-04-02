//
//  SurveyView.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 02/04/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import SwiftUI

struct SurveyView: View {

    @ObservedObject var viewModel: SurveyViewModel

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("General")) {
                    Picker(selection: $viewModel.selectedFeeling, label: Text("How did you feel")) {
                        ForEach(0..<self.viewModel.feelings.count) {
                            Text(self.viewModel.feelings[$0].rawValue)
                        }
                    }
                }

                Section(header: Text("Food")) {
                    Toggle(isOn: $viewModel.didEatBreakfast.animation()) {
                        Text("Did you eat at breakfast ?")
                    }
                    if self.viewModel.didEatBreakfast {
                        TextField("What did you eat at breakfast", text: $viewModel.breakfastFood)
                    }

                    Toggle(isOn: $viewModel.didEatLunch.animation()) {
                        Text("Did you eat at lunch ?")
                    }
                    if self.viewModel.didEatLunch {
                        TextField("What did you eat at lunch", text: $viewModel.lunchFood)
                    }

                    Toggle(isOn: $viewModel.didEatDinner.animation()) {
                        Text("Did you eat at dinner ?")
                    }
                    if self.viewModel.didEatDinner {
                        TextField("What did you eat at dinner", text: $viewModel.dinnerFood)
                    }
                }

                Section(header: Text("Weather")) {
                    Picker(selection: $viewModel.selectedWeather, label: Text("How was the weather")) {
                        ForEach(0..<self.viewModel.weather.count) {
                            Text(self.viewModel.weather[$0].rawValue)
                        }
                    }
                }

                Section(header: Text("Work")) {
                    Picker(selection: $viewModel.selectedWork, label: Text("How was work")) {
                        ForEach(0..<self.viewModel.work.count) {
                            Text(self.viewModel.work[$0].rawValue)
                        }
                    }
                }

                Section(header: Text("Personal")) {
                    Toggle(isOn: $viewModel.didHaveSex) {
                        Text("Did you have sex today ?")
                    }
                }

                Section {
                    Button(action: {
                        let survey = self.viewModel.generateSurvey()
                        print(survey)
                        self.viewModel.showSuccessAlert = true
                    }) {
                        Text("Validate")
                    }
                    .disabled(self.viewModel.isValidateButtonDisabled())
                    .alert(isPresented: $viewModel.showSuccessAlert) {
                        Alert(
                            title: Text("Success"),
                            message: Text("Your survey was successfully created"),
                            dismissButton: .default(Text("OK"))
                        )
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
        SurveyView(viewModel: SurveyViewModel())
    }
}
