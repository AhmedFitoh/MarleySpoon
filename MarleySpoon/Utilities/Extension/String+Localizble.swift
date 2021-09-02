//
//  String+Localizble.swift
//  MarleySpoon
//
//  Created by AhmedFitoh on 9/1/21.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
