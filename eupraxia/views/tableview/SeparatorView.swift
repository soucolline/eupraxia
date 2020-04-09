//
//  SeparatorView.swift
//  eupraxia
//
//  Created by Thomas Guilleminot on 09/04/2020.
//  Copyright © 2020 Thomas Guilleminot. All rights reserved.
//

import SwiftUI

struct SeparatorView: View {
    var body: some View {
        Rectangle()
            .background(Color.separator)
            .frame(height: 0.5)
    }
}

struct SeparatorView_Previews: PreviewProvider {
    static var previews: some View {
        SeparatorView()
    }
}
