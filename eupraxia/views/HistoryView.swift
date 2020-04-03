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
    @FetchRequest(entity: Survey.entity(), sortDescriptors: []) var surveys: FetchedResults<Survey>

    var body: some View {
        NavigationView {
            List {
                ForEach(surveys, id: \.self) { (survey: Survey) in
                    Text("Fake data")
                }
                .onDelete(perform: delete)
            }
            .navigationBarTitle("History")
            .navigationBarItems(trailing: EditButton())
        }
    }

    func delete(at offset: IndexSet) {
        for index in offset {
            let survey = self.surveys[index]
            self.context.delete(survey)
        }

        do {
            try self.context.save()
        } catch {
            fatalError("couldn't save context after deletion")
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return HistoryView().environment(\.managedObjectContext, context)
    }
}
