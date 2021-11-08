//
//  TypeErasureView.swift
//  Bookworm
//
//  Created by Giovanni Gaffé on 2021/11/8.
//

import SwiftUI

struct TypeErasureView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    var body: some View {
        if sizeClass == .compact {
            return HStack {
                Text("Active size class:")
                Text("COMPACT")
            }
            .font(.largeTitle)
        }
    }
}

struct TypeErasureView_Previews: PreviewProvider {
    static var previews: some View {
        TypeErasureView()
    }
}
