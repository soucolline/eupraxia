//
//  HistoryRow.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 03/04/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import SwiftUI

struct HistoryRow: View {

    @ObservedObject var viewModel: HistoryRowViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text(self.viewModel.getDate())
                .font(.custom(K.Font.openSansSemiBold, size: 14))
                .lineLimit(1)
                .foregroundColor(.darkPink)

            HStack {
                PainView(
                    text: self.viewModel.didHaveStomachAche() ? "Pain" : "No pain",
                    isEnabled: !self.viewModel.didHaveStomachAche()
                )

                Spacer()

                HStack {
                    Image(self.viewModel.getWeatherIcon())
                    .padding(.trailing, 10)
                    Image(self.viewModel.getFeelingIcon())
                        .padding(.trailing, 10)
                    Image(self.viewModel.getWorkIcon())
                        .padding(.trailing, 10)
                }
                .padding()

                Spacer()
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.border, radius: 5, x: 0, y: 3)
        }
        .padding(.top, 6)
        .background(Color.clear)
    }
}

struct HistoryRow_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let survey = Survey.createTestSurvey(from: context)
        return HistoryRow(viewModel: HistoryRowViewModel(with: survey))
    }
}
