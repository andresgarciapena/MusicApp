//
//  MusicAppTests.swift
//  MusicAppTests
//
//  Created by Andres Garcia on 11/03/2021.
//

import XCTest
import Alamofire
@testable import MusicApp

class MusicAppTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testValidCallToApi() {
        
        let url = "https://itunes.apple.com/search?media=music&term=taylor"
        
        let request = AF.request(url)
        
        request.responseDecodable(of: ItunesSongResponse.self) { (response) in
          guard let _ = response.value else { return }
            
            if let statusCode = response.response?.statusCode {
                if statusCode == 200 {
                    XCTAssert(statusCode == 200)
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
    }
}
