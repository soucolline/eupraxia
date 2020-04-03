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
    @Environment(\.managedObjectContext) var context: NSManagedObjectContext

    var body: some View {
        TabView {
            SurveyView(viewModel: SurveyViewModel(with: context))
                .tabItem {
                    Image(systemName: "heart")
                    Text("Survey")
            }
        }
    }
}

struct TabBarHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarHomeView()
    }
}
