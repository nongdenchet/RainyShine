//
//  NibLoadableView.swift
//  RainyShine
//
//  Created by nongdenchet on 5/14/17.
//  Copyright © 2017 nongdenchet. All rights reserved.
//

import UIKit

protocol NibLoadableView: class {}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}
