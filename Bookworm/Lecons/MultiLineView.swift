//
//  MultiLineView.swift
//  Bookworm
//
//  Created by Giovanni Gaffé on 2021/12/20.
//

import SwiftUI

struct MultiLineView: View {
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationView {
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

struct MultiLineView_Previews: PreviewProvider {
    static var previews: some View {
        MultiLineView()
    }
}
