//
//  Bundle+UnitTestBundle.swift
//  MarleySpoonTests
//
//  Created by AhmedFitoh on 9/2/21.
//

import Foundation

extension Bundle {
    private class Test {}
    public class var unitTestBundle: Bundle {
        return Bundle(for: Test.self)
    }
}
