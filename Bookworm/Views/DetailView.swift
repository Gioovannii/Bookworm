//
//  DetailView.swift
//  Bookworm
//
//  Created by Giovanni Gaffé on 2021/11/9.
//

import CoreData
import SwiftUI

struct DetailView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @State private var showingDeleteAlert = false

    let book: Book
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    Image(self.book.genre ?? "Fantasy")
                        .frame(maxWidth: geometry.size.width)
                    
                    Text(self.book.genre?.uppercased() ?? "FANTASY")
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(8)
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.75))
                        .clipShape(Capsule())
                        .offset(x: -9, y: -5)
                }
                    
                Text(self.book.author ?? "Unknown author")
                    .font(.title)
                    .foregroundColor(.secondary)
                
                Text(self.book.review ?? "No review")
                    .padding()
                
                RatingView(rating: .constant(Int(self.book.rating)))
                    .font(.largeTitle)
                
                
                Text("Date : \(formatDate())")
                    .font(.headline)
                    .padding()
                
                Spacer()
            }
        }
        .navigationBarTitle(Text(book.title ?? "Unknown book"), displayMode: .inline)
        .alert(isPresented: $showingDeleteAlert) {
            Alert(title: Text("delete book"), message: Text("Are you sure ?"), primaryButton: .destructive(Text("Delete")){
                self.deleteBook()
            }, secondaryButton: .cancel())
        }
        .navigationBarItems(trailing: Button(action: {
            self.showingDeleteAlert = true
        }) {
            Image(systemName: "trash")
        })
    }
    
    func deleteBook () {
        moc.delete(book)
        
        try? self.moc.save()
        
        presentationMode.wrappedValue.dismiss()
    }
    
    func formatDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        
        
        guard let date = book.date else { return "No date "}
        let strDate = dateFormatter.string(from: date)
        
        return strDate
    }
}

struct DetailView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
        let book = Book(context: moc)
        book.title = "Test book"
        book.author = "Test author"
        book.genre = "Fantasy"
        book.rating = 4
        book.review = "This is a great book, I really enjoyed it."
        
        return NavigationView {
            DetailView(book: book)
        }
    }
}
