//
//  Delegate.swift
//  Delegate
//
//  Created by nori on 2021/09/01.
//

import Foundation
import FirebaseSampleProjectUI
import FirebaseFirestore
import FirebaseFirestoreSwift

final class MyDelegate: SampleDocumentCollectionDelegate {

    func fetch(_ model: CollectionView.ViewModel) {
        Firestore.firestore().collection("anyDocuments")
            .addSnapshotListener { snapshot, error in
                if let error = error {
                    print(error)
                    return
                }
                let documents = snapshot?.documents.compactMap({ documentSnapshot -> SampleDocument? in
                    let document = try? documentSnapshot.data(as: SampleDocument.self)
                    return document
                })
                model.data = documents ?? []
            }
    }

    func add(_ model: CollectionView.ViewModel) {
        let ref = Firestore.firestore().collection("anyDocuments").document()
        let document = SampleDocument(id: ref.documentID, text: ref.documentID)
        _ = try? ref.setData(from: document)
    }
}
