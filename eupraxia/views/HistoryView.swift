//
//  HistoryView.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 03/04/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import SwiftUI
import CoreData

struct HistoryView: View {
    @Environment(\.managedObjectContext) var context: NSManagedObjectContext
    @FetchRequest(
        entity: Survey.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Survey.date, ascending: false)]
    ) var surveys: FetchedResults<Survey>

    var body: some View {
        ZStack(alignment: .top) {
            Image("history_background")
                .offset(x: 0, y: -80)

            ScrollView {
                VStack(alignment: .leading) {
                    Text("History")
                        .font(Font.custom(K.Font.openSansBold, size: 35))
                        .foregroundColor(Color.darkPink)
                        .padding(.top, 72)
                        .padding(.leading, 42)

                    Text("You had no stomach pains for 28 days straight.")
                        .font(Font.custom(K.Font.openSansSemiBold, size: 16))
                        .foregroundColor(Color.darkPink)
                        .padding(.top, 22)
                        .padding(.leading, 42)

                    VStack(alignment: .leading) {
                        ForEach(surveys, id: \.id) { (survey: Survey) in
                            HStack {
                                ZStack(alignment: .top) {
                                    Rectangle()
                                        .fill(Color.darkPink)
                                        .frame(width: 1)
                                        .padding(.leading, 24)
                                        .padding(.top, -12)
                                        .padding(.bottom, -40)
                                    Circle()
                                        .fill(Color.darkPink)
                                        .frame(width: 10, height: 10)
                                        .offset(x: 12, y: 10)
                                }
                                HistoryRow(viewModel: HistoryRowViewModel(with: survey))
                                    .padding(.leading)
                                    .padding(.trailing, 44)
                            }
                        }
                    }
                    .padding(.top, 30)
                    .padding(.bottom, 40)
                }
            }
            .onAppear { UITableView.appearance().separatorStyle = .none }
            .onDisappear { UITableView.appearance().separatorStyle = .singleLine }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        _ = Survey.createTestSurvey(from: context)
        return HistoryView().environment(\.managedObjectContext, context)
    }
}
