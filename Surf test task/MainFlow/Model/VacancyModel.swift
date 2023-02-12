//
//  VacancyModel.swift
//  Surf test task
//
//  Created by Djinsolobzik on 07.02.2023.
//

import Foundation

struct VacancyModel {
    var name: String
    var isSelect = false
}

#if DEBUG
extension VacancyModel {
    static let sampleData = [
        VacancyModel(name: "iOS"),
        VacancyModel(name: "Android"),
        VacancyModel(name: "PM"),
        VacancyModel(name: "Analyst"),
        VacancyModel(name: "BackEnd"),
        VacancyModel(name: "Fulls-tack"),
        VacancyModel(name: "FrontEnd"),
        VacancyModel(name: "Python"),
        VacancyModel(name: "QA"),
        VacancyModel(name: "SysAdmin")
    ]
}
#endif
