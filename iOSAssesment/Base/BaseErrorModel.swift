//
//  BaseError.swift
//  iOSAssesment
//
//  Created by Ahmed Elsman on 20/12/2020.
//

import Foundation

struct BaseErrorModel: Codable {
    let message: String?
    let status_code: Int?
}

