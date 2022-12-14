//
//  NetworkManagerProtocol.swift
//  PetProject
//
//  Created by Антон Кирилюк on 19.11.2022.
//

import Foundation
import Alamofire

protocol NetworkManagerProtocol {
    func getArrayOfImages(url: String,searchText: String, completion: @escaping (([String]) -> ()), errorCompletion: @escaping (AFError) -> ())
}
