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
        sortDescriptors: [NSSortDescriptor(keyPath: \Survey.date, ascending: true)]
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

                    VStack {
                        ForEach(surveys, id: \.id) { (survey: Survey) in
                            ZStack {
                                HistoryRow(viewModel: HistoryRowViewModel(with: survey))
                                NavigationLink(destination: DetailsView(viewModel: DetailsViewModel(with: survey))) {
                                    EmptyView()
                                }
                            }
                        }
                    }
                    .padding(.top, 30)
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
