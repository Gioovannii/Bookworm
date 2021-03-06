//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by Giovanni GaffÃ© on 2021/11/9.
//

import SwiftUI

struct EmojiRatingView: View {
    let rating: Int16
    
    var body: some View {
        switch rating {
        case 1:
            return Text("ð´")
        case 2:
            return Text("ð")
        case 3:
            return Text("ð")
        case 4:
            return Text("ð")
        default:
            return Text("ð¤©")
        }
    }
}

struct EmojiRatingView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRatingView(rating: 3)
    }
}
