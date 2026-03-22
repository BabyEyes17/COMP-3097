//
//  StudentFormView.swift
//  lab_07
//
//  Created by Tech on 2026-03-17.
//

import SwiftUI

struct StudentFormView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    
    var student: Student?
    
    @State private var name: String = ""
    @State private var selectedCourses: Set<Course> = []
    
    @FetchRequest(
        entity: Course.entity(),
        sortDescriptors: []
    ) var courses: FetchedResults<Course>
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section(header: Text("Student Info")) {
                    TextField("Name",text: $name)
                }
                
                Section(header: Text("Courses")) {
                    ForEach(courses) {
                        
                        course in
                        MultipleSelectionRow(title: course.title, isSelected: selectedCourses.contains(course)) {
                            
                            if selectedCourses.contains(course) {
                                selectedCourses.remove(course)
                            }
                            
                            else {
                                selectedCourses.insert(course)
                            }
                        }
                    }
                }
            }
            .navigationTitle(student == nil ? "Add Student" : "Edit Student")
            .toolbar {
                Button("Save", action: saveStudent)
            }
            .onAppear(perform: loadData)
        }
    }
    
    private func loadData() {
        
        if let student = student {
            
            name = student.name ?? ""
            selectedCourses = student.courses as? Set<Course> ?? []
        }
    }
    
    private func saveStudent() {
        
        let s = student ?? Student(context: viewContext)
        
        s.id = UUID()
        s.name = name
        s.courses = selectedCourses as NSSet
        
        try? viewContext.save()
        dismiss()
    }
}
