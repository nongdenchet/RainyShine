//
//  ReusableView.swift
//  RainyShine
//
//  Created by nongdenchet on 5/14/17.
//  Copyright © 2017 nongdenchet. All rights reserved.
//

import UIKit

protocol ReusableView: class {}

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
