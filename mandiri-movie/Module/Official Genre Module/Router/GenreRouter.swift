//
//  GenreRouter.swift
//  mandiri-movie
//
//  Created by Isaac on 6/11/23.
//

import Foundation
import UIKit

typealias EntryPoint = GenreView & BaseVC

protocol GenreRouter {
    var entry: EntryPoint? { get }
    
    static func start() -> GenreRouter
}

class GenreRouters: GenreRouter {
    var entry: EntryPoint?
    
    static func start() -> GenreRouter {
        let router = GenreRouters()
        
        // Assign VIP
        var view: GenreView = GenreVC()
        var presenter: GenrePresenter = GenrePresentation()
        var interactor: GenreInteractor = GenreInteractors()
        
        view.onLoading()
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.entry = view as? EntryPoint
        
        return router
    }
    
}
