//
//  DetailsView.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 04/04/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import SwiftUI

struct DetailsView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @ObservedObject var viewModel: DetailsViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Group {
                    HeaderRow(text: "General")
                    ChoiceRow(text: "How did you feel?", icon: Image(viewModel.getFeelingIcon()), feeling: viewModel.getFeeling())

                    HeaderRow(text: "Food")
                    ToggleRow(viewModel: ToggleRowViewModel(text: "Did you eat breakfast?", details: viewModel.getBreakFast(), value: viewModel.getBreakFast().isNotNil()))
                        .padding(.bottom, 1)
                    ToggleRow(viewModel: ToggleRowViewModel(text: "Did you eat lunch?", details: viewModel.getLunch(), value: viewModel.getLunch().isNotNil()))
                        .padding(.bottom, 1)
                    ToggleRow(viewModel: ToggleRowViewModel(text: "Did you eat dinner?", details: viewModel.getDinner(), value: viewModel.getDinner().isNotNil()))
                }

                Group {
                    HeaderRow(text: "Weather")
                    ChoiceRow(text: "How was the weather?", icon: Image(viewModel.getWeatherIcon()), feeling: viewModel.getWeather())

                    HeaderRow(text: "Work")
                    ChoiceRow(text: "How was work?", icon: Image(viewModel.getWorkIcon()), feeling: viewModel.getWork())

                    HeaderRow(text: "Sex")
                    ToggleRow(viewModel: ToggleRowViewModel(text: "Did you have sex today", details: nil, value: viewModel.didHaveSex()))
                }

                HStack(alignment: .center, spacing: 20) {
                    Button(action: {
                        print("Should delete survey")
                        self.mode.wrappedValue.dismiss()
                    }) {
                        Text("Delete")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .foregroundColor(Color.white)
                            .font(.custom(K.Font.openSansSemiBold, size: 16.0))
                    }
                    .background(Color.red)
                    .cornerRadius(10.0)
                }
                .padding(20)
            }
        }
        .navigationBarTitle(Text(viewModel.getDate()), displayMode: .inline)
        .background(Color.background)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let survey = ManagedSurvey.createTestSurvey(from: context).toSurvey()
        return NavigationView {
            DetailsView(viewModel: DetailsViewModel(with: survey))
        }
    }
}
