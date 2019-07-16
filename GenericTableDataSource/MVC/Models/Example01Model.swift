//
//  Example01Model.swift
//  GenericTableDataSource
//
//  Created by Sandeep Kumar on 15/07/19.
//  Copyright © 2019 SandsHellCreations. All rights reserved.
//

import Foundation

class Example01Model {
    var name: String?
    var description: String?
    var imageName: String?
    
    init(_ _name: String?, _ _desc: String?, _ _imageName: String?) {
        name = _name
        description = _desc
        imageName = _imageName
    }
    
    class func getItems() -> [Example01Model] {
        return [Example01Model("Felicity Smoak",
                               "Felicity Smoak is a fictional character appearing in comics published by DC Comics. Her first appearance was in The Fury of Firestorm #23, created by writer Gerry Conway and artist Rafael Kayanan.",
                               "profile_01"),
                Example01Model("Thea Queen",
                               "Thea Dearden Queen, also known as Speedy, is a fictional character portrayed by Willa Holland on The CW television series Arrow, created by Greg Berlanti, Marc Guggenheim, and Andrew Kreisberg. She is the maternal half-sister of series protagonist Oliver Queen / Green Arrow.",
                               "profile_02"),
                Example01Model("Oliver Queen",
                               "Oliver Queen, also known by his alter-ego Green Arrow, is a fictional character in The CW's Arrowverse franchise, first introduced in the 2012 pilot episode of the television series Arrow.",
                               "profile_03"),
                Example01Model("Hannah Baker",
                               "Hannah Baker is a fictional character created by American author Jay Asher. She is the subject of his 2007 young adult fiction mystery novel Thirteen Reasons Why, which was adapted by the media company Netflix as 13 Reasons Why.",
                               "profile_04"),
                Example01Model("Clay Jensen",
                               "Clay Jensen is a fictional character created by author Jay Asher. He is the main character in Thirteen Reasons Why, a novel written for teenagers where a girl, Hannah Baker commits suicide.",
                               "profile_05"),
                Example01Model("Harley Quinn",
                               "Harley Quinn is a fictional character appearing in comic books published by DC Comics. The character was created by Paul Dini and Bruce Timm, and first appeared in Batman: The Animated Series in September 1992.",
                               "profile_06") ]
    }
}
