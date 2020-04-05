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
        HStack {
            VStack(alignment: .leading) {
                Text(self.viewModel.getDate())
                    .font(.custom(K.Font.openSansSemiBold, size: 14))
                    .lineLimit(1)
                    .foregroundColor(.darkPink)
                    .padding(.bottom, 12)

                HStack {
                    VStack {
                        Text(self.viewModel.didHaveSex() ? "Pain" : "No pain")
                            .lineLimit(1)
                            .foregroundColor(.black)
                            .font(.custom(K.Font.openSansSemiBold, size: 12))
                    }
                    .frame(width: 70, height: 61)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.border, lineWidth: 1)
                    )

                    Spacer()

                    HStack {
                        Image(self.viewModel.getFeelingIcon())
                            .padding(.trailing, 10)
                        Image(self.viewModel.getWeatherIcon())
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
            .padding([.leading, .trailing])
            .padding(.top, 8)
        }
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
