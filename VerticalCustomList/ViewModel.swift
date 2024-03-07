//
//  ViewModel.swift
//  VerticalCustomList
//
//  Created by Ayaal Ivanov on 06.03.2024.
//

import SwiftUI

final class ViewModel: ObservableObject {

    @Published var viewModels: [VerticalCellViewModel] = []

    init() {
        viewModels = makeVerticalList()
    }
}

extension ViewModel {

    private func makeVerticalList() -> [VerticalCellViewModel] {
        let totalCount = Int.random(in: 100..<200)
        return (0..<totalCount).map { _ in
            VerticalCellViewModel(horizontalCellViewModels: makeHorizontalList())
        }
    }

    private func makeHorizontalList() -> [HorizontalCellViewModel] {
        let totalCount = Int.random(in: 10..<20)
        return (0..<totalCount).map { _ in
            let randomNumber = Int.random(in: 1..<100)
            return HorizontalCellViewModel(number: randomNumber)
        }
    }
}
