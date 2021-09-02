//
//  XCTestCase+loadDataFromBundle.swift
//  MarleySpoonTests
//
//  Created by AhmedFitoh on 9/1/21.
//

import Foundation

extension Bundle {
        
    func loadDataFromBundle(withName name: String, ext: String) ->  Data? {
        guard let path = Bundle.unitTestBundle.path(forResource: name, ofType: ext),
              let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {
            debugPrint("loadDataFromBundle error, invalid path")
            return nil
        }
        return data
    }
}

