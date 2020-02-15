//
//  NotyView.swift
//  SwiftUICode
//
//  Created by Abdullah Alhaider on 15/02/2020.
//  Copyright © 2020 Abdullah Alhaider. All rights reserved.
//

import SwiftUI


struct NotyView: View {
    @FetchRequest(entity: Noty.entity(), sortDescriptors: []) var notes: FetchedResults<Noty>
    @Environment(\.managedObjectContext) var moc
    @State private var showAddView = false
    
    var showList: Bool {
        !self.notes.isEmpty
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if showList {
                    List {
                        ForEach(notes, id: \.self) { note in
                            VStack(alignment: .leading) {
                                Text("Is importent: \(note.isImportent ? "YES" : "Nah")")
                                    .font(.system(size: 12))
                                Text("\(note.text)")
                            }
                        }
                        .onDelete(perform: removeNoty)
                    }
                } else {
                    Text("Please add a new Noty.")
                }
                
                Button("Add Noty" ) {
                    self.showAddView.toggle()
                }
            }
            .navigationBarTitle("Noty")
            .navigationBarItems(leading: showList ? EditButton() : nil)
            .sheet(isPresented: $showAddView) {
                AddView(isPresented: self.$showAddView).environment(\.managedObjectContext, self.moc)
            }
        }
    }
    
    func removeNoty(at offset: IndexSet) {
        offset.forEach { index in
            let note = notes[index]
            moc.delete(note)
            try? moc.save()
        }
    }
}

struct NotyView_Previews: PreviewProvider {
    static var previews: some View {
        NotyView()
    }
}
