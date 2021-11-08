//
//  CoreDataView.swift
//  Bookworm
//
//  Created by Giovanni Gaffé on 2021/11/8.
//

import SwiftUI

struct CoreDataView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Student.entity(), sortDescriptors: []) var students: FetchedResults<Student>
    
    var body: some View {
        VStack {
            List {
                ForEach(students, id: \.id) { student in
                    Text(student.name ?? "Unknown")
                }
            }
            
            Button("Add") {
                let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
                
                let chosenFirstName = firstNames.randomElement()!
                let chosenLastName = lastNames.randomElement()!
                
                let student = Student(context: self.moc)
                student.id = UUID()
                student.name = "\(chosenFirstName) \(chosenLastName)"
                
                try? self.moc.save()
                
            }
//            .navigationTitle("Students")
        }
    }
}

struct CoreDataView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataView()
    }
}
