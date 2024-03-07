//
//  Model.swift
//  VerticalCustomList
//
//  Created by Ayaal Ivanov on 06.03.2024.
//

import Foundation

struct VerticalCellViewModel: Identifiable {
    let id = UUID().uuidString
    let horizontalCellViewModels: [HorizontalCellViewModel]
}

struct HorizontalCellViewModel: Identifiable {
    let id = UUID().uuidString
    let number: Int
}
