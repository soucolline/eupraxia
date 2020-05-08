//
//  TabBarHomeView.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 03/04/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import SwiftUI
import CoreData

struct TabBarHomeView: View {
    @Environment(\.managedObjectContext) var context

    var body: some View {
        TabView {
            SurveyView(viewModel: SurveyViewModel(with: SurveysRepositoryImpl(with: context)))
                .tabItem {
                    Image(systemName: "heart")
                    Text("Survey")
                }

            HistoryView(viewModel: HistoryViewModel(with: SurveysRepositoryImpl(with: context)))
                .tabItem {
                    Image(systemName: "clock")
                    Text("History")
                }

            SettingsView(viewModel: SettingsViewModel(with: NotificationsManager(with: UNUserNotificationCenter.current()), surveysRepository: SurveysRepositoryImpl(with: context)))
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}

struct TabBarHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarHomeView()
    }
}
