//
//  ContentView.swift
//  Finder
//
//  Created by Jordan Singer on 1/10/21.
//

import SwiftUI

struct ContentView: View {
    @State var selection: Set<Int> = [0]
        var body: some View {
            NavigationView {
                List(selection: self.$selection) {
                    Section(header: Text("Favorites")) {
                        Label("Desktop", systemImage: "menubar.dock.rectangle").tag(0)
                        Label("Home", systemImage: "house")
                        Label("Downloads", systemImage: "arrow.down.circle")
                        Label("Recents", systemImage: "clock")
                        Label("AirDrop", systemImage: "airplayaudio")
                        Label("Folder", systemImage: "folder")
                        Label("Documents", systemImage: "doc")
                    }
                    
                    Section(header: Text("iCloud")) {
                        Label("Desktop", systemImage: "icloud")
                        Label("Documents", systemImage: "doc")
                        Label("Desktop", systemImage: "menubar.dock.rectangle")
                    }
                }
                .listStyle(SidebarListStyle())
                .frame(minWidth: 150, idealWidth: 150, maxWidth: 200, maxHeight: .infinity)
                
                Finder()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
}

struct Finder: View {
    let folders = [
        FinderFolder(label: "Applications", icon: "folder.fill"),
        FinderFolder(label: "Desktop", icon: "macwindow")
    ]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        VStack(spacing: 0) {
            Divider()
            ScrollView {
                LazyVGrid(columns: columns, spacing: 40) {
                    FinderFolder(label: "Applications", icon: "folder.fill")
                    FinderFolder(label: "Desktop", icon: "macwindow")
                    FinderFolder(label: "Documents", icon: "folder.fill")
                    FinderFolder(label: "Downloads", icon: "arrow.down.circle.fill")
                    FinderFolder(label: "Library", icon: "folder.fill")
                    FinderFolder(label: "Music", icon: "music.note")
                    FinderFolder(label: "Movies", icon: "video.fill")
                    FinderFolder(label: "Pictures", icon: "photo.fill")
                    FinderFolder(label: "Public", icon: "folder.fill")
                }
                .padding()
            }
        }
        .background(Color.white)
        .navigationTitle("Desktop")
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button(action: {}) {
                    Image(systemName: "chevron.backward")
                }
            }
            
            ToolbarItem(placement: .navigation) {
                Button(action: {}) {
                    Image(systemName: "chevron.forward")
                }
                .disabled(true)
            }
            
            ToolbarItem(placement: .status) {
                Button(action: {}) {
                    Image(systemName: "square.grid.2x2")
                }
            }
            
            ToolbarItem(placement: .status) {
                Button(action: {}) {
                    Image(systemName: "square.and.arrow.up")
                }
            }
            
            ToolbarItem(placement: .status) {
                Button(action: {}) {
                    Image(systemName: "ellipsis.circle")
                }
            }
            
            ToolbarItem(placement: .status) {
                Button(action: {}) {
                    Image(systemName: "magnifyingglass")
                }
            }
            
        }
    }
}

struct FinderFolder: View {
    @State var label: String
    @State var icon: String
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 40))
                .foregroundColor(Color(NSColor.systemBlue.withAlphaComponent(0.5)))
            Text(label)
                .font(.body)
                .foregroundColor(Color(NSColor.labelColor))
        }
        .frame(width: 92)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
