//
//  SearchItunesServiceManager.swift
//  MusicApp
//
//  Created by Andres Garcia on 11/03/2021.
//

import Foundation
import Alamofire

class SearchItunesServiceManager {
    
    static let sharedService = SearchItunesServiceManager()
    
    func requestMusicList(text: String, completion: @escaping (ItunesSongResponse?, Error?) -> Void) {
        
        let apiToContact = Constants.apiUrl + text
        
        let request = AF.request(apiToContact)
        
        request.responseDecodable(of: ItunesSongResponse.self) { (response) in
          guard let result = response.value else { return }
            completion(result, nil)
        }
    }
}
