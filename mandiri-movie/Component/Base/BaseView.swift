//
//  BaseView.swift
//  mandiri-movie
//
//  Created by Isaac on 6/11/23.
//

import Foundation

protocol BaseView {
    func showError(msg: String)
    func onLoading()
    func onFinishLoading()
}
