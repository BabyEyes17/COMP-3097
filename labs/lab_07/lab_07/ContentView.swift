//
//  ContentView.swift
//  lab_07
//
//  Created by Jayden Lewis on 2026-03-17.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        entity: Student.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Student.name, ascending: true)]
    )
    
    var students: FetchedResults<Student>
    
    @State private var showAddView = false
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                ForEach(students) {
                    
                    student in
                    NavigationLink(destination: StudentFormView(student: student)) {
                            
                            VStack(alignment: .leading) {
                                
                                Text(student.name ?? "Unamed")
                                Text(courseList(student))
                                    .font(.caption)
                            }
                        }
                    
                }.onDelete(perform: deleteStudents)
            }.navigationTitle("Students")
                .toolbar {
                    Button(action: {showAddView = true}) {
                        
                        Label("Add", systemImage: "plus")
                    }
                }.sheet(isPresented: $showAddView) {
                    
                    StudentFormView()
                }
        }
    }
    
    private func courseList(_ student: Student) -> String {
        
        let courses = student.courses as? Set<Course> ?? []
        
        return courses.map { $0.title ?? "" }.joined(separator: ", ")
    }
    
    private func deleteStudents(offset: IndexSet) {
        
        offset.map { students[$0] }.forEach { viewContext.delete($0) }
        try? viewContext.save()
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
