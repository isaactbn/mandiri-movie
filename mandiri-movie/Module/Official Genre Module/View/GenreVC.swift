//
//  GenreVC.swift
//  mandiri-movie
//
//  Created by Isaac on 6/11/23.
//

import UIKit

protocol GenreView: BaseView {
    var presenter: GenrePresenter? { get set }
    
    func update(with genres: [GenreBodyFullResponse])
    func update(with error: String)
}

class GenreVC: BaseVC, GenreView {
    
    @IBOutlet weak var genreCollectionView: UICollectionView!
    
    var genres: [GenreBodyFullResponse]? = []
    
    var presenter: GenrePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.hideNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.showNavigationBar()
    }
    
    private func setupCollection() {
        genreCollectionView.delegate = self
        genreCollectionView.dataSource = self
        genreCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
    }
    
    func update(with genres: [GenreBodyFullResponse]) {
        DispatchQueue.main.async {
            self.genres = genres
            self.genreCollectionView.reloadData()
        }
    }
    
    func update(with error: String) {
        print(error)
    }
}

extension GenreVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genres?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: ((collectionView.frame.width / 2) - 32), height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.titleLabel.text = genres?[indexPath.row].name
        
        cell.viewWrapper.tapGesture{ [self] in
            let id = genres?[indexPath.row].id.codingKey.stringValue ?? ""
            let movieRouter = MovieRouters.start(id: id, navTitle: genres?[indexPath.row].name ?? "")
            let vc = movieRouter.entry

            pushVC(vc as? MovieViewVC ?? BaseVC())
        }
        
        return cell
    }
}
