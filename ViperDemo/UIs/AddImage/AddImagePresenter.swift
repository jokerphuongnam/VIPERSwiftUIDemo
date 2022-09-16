//
//  AddImagePresenter.swift
//  ViperDemo
//
//  Created by P.Nam on 16/09/2022.
//

import SwiftUI
import Combine

protocol AddImagePresentation {
    
}

final class AddImagePresenter: AddImagePresentation {
    private var interactor: AddImageUseCase
    
    init(interactor: AddImageUseCase) {
        self.interactor = interactor
#if DEBUG
        print("Init \(String(describing: Self.self))")
#endif
    }
}

final class AddImagePresentationKey: EnvironmentKey {
    typealias Value = AddImagePresentation
    static var defaultValue: AddImagePresentation = ReviewAddImagePresentation()
}

extension EnvironmentValues {
    var addImagePresentation: AddImagePresentation {
        get { self[AddImagePresentationKey.self] }
        set { self[AddImagePresentationKey.self] = newValue }
    }
}

final class ReviewAddImagePresentation: AddImagePresentation {
    fileprivate static let review: AddImagePresentation = ReviewAddImagePresentation()
}

#if DEBUG
extension AddImagePresentation {
    static var review: AddImagePresentation {
        ReviewAddImagePresentation.review
    }
}
#endif
