//
//  BundleExtensionTest.swift
//  MarleySpoonTests
//
//  Created by AhmedFitoh on 9/2/21.
//

import XCTest

class BundleExtensionTest: XCTestCase {
    
    
    func testLoadDataSuccess() {
        let filename = "RecipeList_Stub"
        let ext = "json"
        
        let data = Bundle().loadDataFromBundle(withName: filename, ext: ext)
        
        XCTAssertNotNil(data, "Data shouldn't be nil")
    }
    
    
    func testLoadDataFailure(){
        let filename = "InvalidFileName"
        let ext = "json"
        
        let data = Bundle().loadDataFromBundle(withName: filename, ext: ext)
        
        XCTAssertNil(data, "Data be nil")
    }
    
}
