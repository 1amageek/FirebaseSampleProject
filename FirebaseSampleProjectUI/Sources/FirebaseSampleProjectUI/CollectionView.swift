//
//  CollectionView.swift
//  CollectionView
//
//  Created by nori on 2021/09/01.
//

import SwiftUI

public struct CollectionView: View {

    @EnvironmentObject var model: ViewModel

    public init() { }

    public var body: some View {
        List {
            ForEach(model.data) { data in
                Text(data.text)
            }
        }
        .navigationTitle("CollectionView")
        .navigationBarItems(trailing: Button(action: {
            withAnimation {
                model.add()
            }
        }, label: {
            Image(systemName: "plus")
        }))
        .onAppear {
            withAnimation {
                model.fetch()
            }
        }
    }
}

public protocol SampleDocumentCollectionDelegate {

    func fetch(_ model: CollectionView.ViewModel)

    func add(_ model: CollectionView.ViewModel)
}

extension CollectionView {

    public class ViewModel: ObservableObject {

        @Published public var data: [SampleDocument] = []

        var delegate: SampleDocumentCollectionDelegate?

        public init(delegate: SampleDocumentCollectionDelegate? = nil) {
            self.delegate = delegate
        }

        func add() {
            self.delegate?.add(self)
        }

        func fetch() {
            self.delegate?.fetch(self)
        }
    }
}


struct CollectionView_Previews: PreviewProvider {

    class Delegate: SampleDocumentCollectionDelegate {

        func add(_ model: CollectionView.ViewModel) {
            let count = model.data.count
            model.data.append(SampleDocument(id: "\(count)", text: "\(count)"))
        }

        func fetch(_ model: CollectionView.ViewModel) {
            model.data = (0..<10).map { SampleDocument(id: "\($0)", text: "\($0)") }
        }
    }


    static var previews: some View {
        NavigationView {
            CollectionView()
        }
        .environmentObject(CollectionView.ViewModel(delegate: Delegate()))
    }
}
