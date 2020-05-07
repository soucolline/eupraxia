//
//  ExportView.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 07/05/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import SwiftUI

struct ExportView: View {

    @ObservedObject var viewModel: ExportViewModel
    @State private var didCopyToClipBoard = false

    var body: some View {
        VStack {
            Text("Export your data")
                .font(.title)
                .padding(.vertical)

            Text(viewModel.exportedData)
                .padding()

            Button(action: {
                UIPasteboard.general.string = self.viewModel.exportedData
                self.didCopyToClipBoard = true
            }, label: {
                Text((self.didCopyToClipBoard ? "Copied !" : "Copy to clipboard"))
            })
                .foregroundColor(.white)
                .padding()
                .background(Color.green)
                .cornerRadius(8)

            Spacer()
        }
        .onAppear {
            self.viewModel.exportData()
        }
    }
}

struct ExportView_Previews: PreviewProvider {
    static var previews: some View {
        let previewContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return ExportView(viewModel: ExportViewModel(with: SurveysRepositoryImpl(with: previewContext)))
    }
}
