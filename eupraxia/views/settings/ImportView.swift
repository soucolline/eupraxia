//
//  ImportView.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 07/05/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import SwiftUI

struct ImportView: View {

    @ObservedObject var viewModel: ImportViewModel

    @State private var textfieldValue: String = ""

    var body: some View {
        VStack {
            Text("Import your data")
                .font(.title)
                .padding(.vertical)

            TextField("Import your data here", text: $textfieldValue)
                .padding()

            Button(action: {
                self.viewModel.importData(from: self.textfieldValue)
            }, label: {
                Text(viewModel.importButtonTitle)
            })
                .foregroundColor(.white)
                .padding()
                .background(Color.green)
                .cornerRadius(8)

            Spacer()
        }
    }
}

struct ImportView_Previews: PreviewProvider {
    static var previews: some View {
        let previewContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return ImportView(viewModel: ImportViewModel(with: ImportManager(with: SurveysRepositoryImpl(with: previewContext))))
    }
}
