//
//  DetailsView.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 04/04/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import SwiftUI

struct DetailsView: View {
    @ObservedObject var viewModel: DetailsViewModel

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Feeling : \(viewModel.getFeeling())")
                Text("Breakfast : \(viewModel.getBreakFast())")
                Text("Lunch : \(viewModel.getLunch())")
                Text("Dinner : \(viewModel.getDinner())")
                Text("Weather : \(viewModel.getWeather())")
                Text("Work : \(viewModel.getWork())")
                Text("Sex : \(viewModel.getDidHaveSex())")
                Text("Stomach ache : \(viewModel.getDidHaveStomachAche())")

                Spacer()
            }
            .padding()

            Spacer()
        }
        .navigationBarTitle(Text(viewModel.getDate()), displayMode: .inline)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let survey = ManagedSurvey.createTestSurvey(from: context).toSurvey()
        return DetailsView(viewModel: DetailsViewModel(with: survey))
    }
}
