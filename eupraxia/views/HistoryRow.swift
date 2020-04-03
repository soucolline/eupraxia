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
                Text(self.viewModel.getUUID())
                    .lineLimit(1)
                    .foregroundColor(.black)
                Text("Feelings: \(self.viewModel.getFeeling())")
                    .lineLimit(1)
                    .foregroundColor(.black)
                Text("Weather: \(self.viewModel.getWeather())")
                    .lineLimit(1)
                    .foregroundColor(.black)
                Text("Work: \(self.viewModel.getWork())")
                    .lineLimit(1)
                    .foregroundColor(.black)

                HStack {
                    Spacer()

                    Text("B")
                    .frame(width: 30, height: 30)
                    .background((self.viewModel.didEatBreakfast() ? Color.green : Color.red))
                    .foregroundColor(.white)
                    .clipShape(Circle())

                    Text("L")
                    .frame(width: 30, height: 30)
                    .background((self.viewModel.didEatLunch() ? Color.green : Color.red))
                    .foregroundColor(.white)
                    .clipShape(Circle())

                    Text("D")
                    .frame(width: 30, height: 30)
                    .background((self.viewModel.didEatDinner() ? Color.green : Color.red))
                    .foregroundColor(.white)
                    .clipShape(Circle())

                    Text("S")
                    .frame(width: 30, height: 30)
                    .background((self.viewModel.didHaveSex() ? Color.green : Color.red))
                    .foregroundColor(.white)
                    .clipShape(Circle())
                }
            }
            .padding()
        }
        .background(Color("brokenWhite"))
        .cornerRadius(10.0)
        .shadow(color: Color.gray, radius: 0.5, x: 0, y: 0)
    }
}

struct HistoryRow_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let survey = Survey(context: context)
        survey.id = UUID()
        survey.feeling = 1
        survey.weather = 1
        survey.work = 1
        survey.lunch = "My lunch"
        return HistoryRow(viewModel: HistoryRowViewModel(with: survey))
    }
}
