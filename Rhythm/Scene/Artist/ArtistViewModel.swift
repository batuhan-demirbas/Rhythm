//
//  ArtistViewModel.swift
//  Rhythm
//
//  Created by Batuhan on 8.05.2023.
//

import Foundation

protocol ArtistViewModelDelegate: AnyObject {
    func prepareCollectionView()
    func reloadData()
}

protocol ArtistViewModelProtocol {
    var delegate: ArtistViewModelDelegate? { get set }
    var numberOfItems: Int { get }
    func load()
}

final class ArtistViewModel {
    let manager = DeezerManager.shared
    weak var delegate: ArtistViewModelDelegate?

}

extension ArtistViewModel: ArtistViewModelProtocol {
    var numberOfItems: Int {
        //artists.count
        5
    }

    func load() {
        delegate?.prepareCollectionView()
    }
}
