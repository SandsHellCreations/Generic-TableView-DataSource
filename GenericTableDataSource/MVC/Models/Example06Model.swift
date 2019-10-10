//
//  Example06Model.swift
//  GenericTableDataSource
//
//  Created by Sandeep Kumar on 28/07/19.
//  Copyright © 2019 SandsHellCreations. All rights reserved.
//

import UIKit

class StrangerThingsSectionData {
    var title: String?
    
    init(_ _title: String?) {
        title = _title
    }
}

class StrangerThingsFooterData {
    
}

class StrangerThingCellData {
    var desc: String?
    var character: Actor?
    
    var episode: String?
    var director: String?
    
    init(_ _desc: String?) {
        desc = _desc
    }
    
    init(_ _character: Actor?) {
        character = _character
    }
    
    init(_ _episode: String?, _ _director: String?) {
        episode = _episode
        director = _director
    }
}

class STSection: HeaderFooterModelProvider {
    
    typealias CellModelType = STCell
    
    typealias HeaderModelType = StrangerThingsSectionData
    
    typealias FooterModelType = StrangerThingsFooterData
    
    var headerProperty: (identifier: String?, height: CGFloat?, model: StrangerThingsSectionData?)?
    
    var footerProperty: (identifier: String?, height: CGFloat?, model: StrangerThingsFooterData?)?
    
    var items: [STCell]?
    
    required init(_ _header: (identifier: String?, height: CGFloat?, model: StrangerThingsSectionData?)?, _ _footer: (identifier: String?, height: CGFloat?, model: StrangerThingsFooterData?)?, _ _items: [STCell]?) {
        headerProperty = _header
        footerProperty = _footer
        items = _items
    }
}

extension STSection {
    class func getSectionalData() -> [STSection] {
        let actorHeight = UIScreen.main.bounds.width * 0.5
        return [STSection( (StragerThingsHeaderView.identfier, 40.0, StrangerThingsSectionData("Series info & characters")), nil,
                        [STCell((DescriptionCell.identfier, UITableView.automaticDimension, StrangerThingCellData("It's the fall of 1984, about a year after Will Byers was found, and he has been plagued by seeing visions of the Upside Down featuring a more dangerous monster. That leads the boy to see a suspiciously friendly new doctor, with the possibility that Will's visions are the result of suffering from PTSD. Nancy deals with survivor's remorse over the death of best friend Barb. Meanwhile, a new sinister entity threatens the Hawkins residents who survived the year-earlier events. New to the town is tomboy Max, who befriends the boys and attracts the romantic interests of Dustin and Lucas."))),
                        STCell((CharacterCell.identfier, actorHeight, StrangerThingCellData(Actor.init(_image: #imageLiteral(resourceName: "stranger_things_eleven"), _name: "Eleven")))),
                        STCell((CharacterCell.identfier, actorHeight, StrangerThingCellData(Actor.init(_image: #imageLiteral(resourceName: "stranger_things_cheif_hopper"), _name: "Chief Hopper")))),
                        STCell((CharacterCell.identfier, actorHeight, StrangerThingCellData(Actor.init(_image: #imageLiteral(resourceName: "stranger_things_steve"), _name: "Steve Harrington")))),
                        STCell((CharacterCell.identfier, actorHeight, StrangerThingCellData(Actor.init(_image: #imageLiteral(resourceName: "stranger_things_dustin"), _name: "Dustin")))),
                        STCell((CharacterCell.identfier, actorHeight, StrangerThingCellData(Actor.init(_image: #imageLiteral(resourceName: "stranger_things_jonathan"), _name: "Jonathan")))),
                        STCell((CharacterCell.identfier, actorHeight, StrangerThingCellData(Actor.init(_image: #imageLiteral(resourceName: "stranger_things_will"), _name: "Will")))),
                        STCell((CharacterCell.identfier, actorHeight, StrangerThingCellData(Actor.init(_image: #imageLiteral(resourceName: "stranger_things_lucas"), _name: "Mike")))),
                        STCell((CharacterCell.identfier, actorHeight, StrangerThingCellData(Actor.init(_image: #imageLiteral(resourceName: "stranger_things_nancy"), _name: "Nancy")))),
                        STCell((CharacterCell.identfier, actorHeight, StrangerThingCellData(Actor.init(_image: #imageLiteral(resourceName: "stranger_things_billy"), _name: "Billy")))),
                        STCell((CharacterCell.identfier, actorHeight, StrangerThingCellData(Actor.init(_image: #imageLiteral(resourceName: "stranger_things_max"), _name: "Max"))))]),
                
                STSection((StragerThingsHeaderView.identfier, 40.0, StrangerThingsSectionData("Season 1 (2016)")), nil,
                           [STCell((EpisodeCell.identfier, UITableView.automaticDimension, StrangerThingCellData("Chapter One: The Vanishing of Will Byers", "The Duffer Brothers"))),
                            STCell((EpisodeCell.identfier, UITableView.automaticDimension, StrangerThingCellData("Chapter Two: The Weirdo on Maple Street", "The Duffer Brothers"))),
                            STCell((EpisodeCell.identfier, UITableView.automaticDimension, StrangerThingCellData("Chapter Three: Holly, Jolly", "Shawn Levy"))),
                            STCell((EpisodeCell.identfier, UITableView.automaticDimension, StrangerThingCellData("Chapter Four: The Body", "Shawn Levy"))),
                            STCell((EpisodeCell.identfier, UITableView.automaticDimension, StrangerThingCellData("Chapter Five: The Flea and the Acrobat", "The Duffer Brothers"))),
                            STCell((EpisodeCell.identfier, UITableView.automaticDimension, StrangerThingCellData("Chapter Six: The Monster", "The Duffer Brothers"))),
                            STCell((EpisodeCell.identfier, UITableView.automaticDimension, StrangerThingCellData("Chapter Seven: The Bathtub", "The Duffer Brothers"))),
                            STCell((EpisodeCell.identfier, UITableView.automaticDimension, StrangerThingCellData("Chapter Eight: The Upside Down", "The Duffer Brothers")))]),
                
                STSection((StragerThingsHeaderView.identfier, 40.0, StrangerThingsSectionData("Season 2 (2017)")), nil,
                          [STCell((EpisodeCell.identfier, UITableView.automaticDimension, StrangerThingCellData("Chapter One: MADMAX", "The Duffer Brothers"))),
                           STCell((EpisodeCell.identfier, UITableView.automaticDimension, StrangerThingCellData("Chapter Two: Trick or Treat, Freak", "The Duffer Brothers"))),
                           STCell((EpisodeCell.identfier, UITableView.automaticDimension, StrangerThingCellData("Chapter Three: The Pollywog", "Shawn Levy"))),
                           STCell((EpisodeCell.identfier, UITableView.automaticDimension, StrangerThingCellData("Chapter Four: Will the Wise", "Shawn Levy"))),
                           STCell((EpisodeCell.identfier, UITableView.automaticDimension, StrangerThingCellData("Chapter Five: Dig Dug", "Andrew Stanton"))),
                           STCell((EpisodeCell.identfier, UITableView.automaticDimension, StrangerThingCellData("Chapter Six: The Spy", "Andrew Stanton"))),
                           STCell((EpisodeCell.identfier, UITableView.automaticDimension, StrangerThingCellData("Chapter Seven: The Lost Sister", "Rebecca Thomas"))),
                           STCell((EpisodeCell.identfier, UITableView.automaticDimension, StrangerThingCellData("Chapter Eight: The Mind Flayer", "The Duffer Brothers"))),
                           STCell((EpisodeCell.identfier, UITableView.automaticDimension, StrangerThingCellData("Chapter Eight: The Gate", "The Duffer Brothers")))]),
                
                STSection((StragerThingsHeaderView.identfier, 40.0, StrangerThingsSectionData("Season 3 (2019)")), nil,
                          [STCell((EpisodeCell.identfier, UITableView.automaticDimension, StrangerThingCellData("Chapter One: Suzie, Do You Copy?", "The Duffer Brothers"))),
                           STCell((EpisodeCell.identfier, UITableView.automaticDimension, StrangerThingCellData("Chapter Two: The Mall Rats", "The Duffer Brothers"))),
                           STCell((EpisodeCell.identfier, UITableView.automaticDimension, StrangerThingCellData("Chapter Three: The Case of the Missing Lifeguard", "Shawn Levy"))),
                           STCell((EpisodeCell.identfier, UITableView.automaticDimension, StrangerThingCellData("Chapter Four: The Sauna Test", "Shawn Levy"))),
                           STCell((EpisodeCell.identfier, UITableView.automaticDimension, StrangerThingCellData("Chapter Five: The Flayed", "Uta Briesewitz"))),
                           STCell((EpisodeCell.identfier, UITableView.automaticDimension, StrangerThingCellData("Chapter Six: E Pluribus Unum", "Uta Briesewitz"))),
                           STCell((EpisodeCell.identfier, UITableView.automaticDimension, StrangerThingCellData("Chapter Seven: The Bite", "The Duffer Brothers"))),
                           STCell((EpisodeCell.identfier, UITableView.automaticDimension, StrangerThingCellData("Chapter Eight: The Battle of Starcourt", "The Duffer Brothers")))])
                ]
    }
}

class STCell: CellModelProvider {
 
    typealias CellModelType = StrangerThingCellData

    var property: (identifier: String, height: CGFloat, model: StrangerThingCellData?)?
    
    var leadingSwipeConfig: SKSwipeActionConfig?
    
    var trailingSwipeConfig: SKSwipeActionConfig?
    
    required init(_ _property: (identifier: String, height: CGFloat, model: StrangerThingCellData?)?, _ _leadingSwipe: SKSwipeActionConfig? = nil, _ _trailingSwipe: SKSwipeActionConfig? = nil) {
        property = _property
        leadingSwipeConfig = _leadingSwipe
        trailingSwipeConfig = _trailingSwipe
    }
    
}
