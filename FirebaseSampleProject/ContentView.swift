//
//  ContentView.swift
//  FirebaseSampleProject
//
//  Created by nori on 2021/09/01.
//

import SwiftUI
import FirebaseSampleProjectUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            CollectionView()
        }
        .environmentObject(CollectionView.ViewModel(delegate: MyDelegate()))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
