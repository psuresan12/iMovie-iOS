//
//  MoviesList.swift
//  iMovie
//
//  Created by pratap surendran ganesan on 22/8/17.
//  Copyright © 2017 pratap surendran ganesan. All rights reserved.
//

import Foundation
import UIKit

enum MovieList:Int
{
    case annabelle=1, beautyandthebeast, deadpool, despicableme3, dunkirk, guardiansofthegalaxy, logan, minions, planetoftheapes, spiderman
    
    
    // This initialiser is used to request a specific movie on its rank.
    // Note this must be declared as 'Optional' because an invalid number could be provided which would result in 'nil' being returned.
    init?(number: Int)
    {
        switch number
        {
        case 1: self = .annabelle case 2: self = .beautyandthebeast case 3: self = .deadpool
        case 4: self = .despicableme3 case 5: self = .dunkirk case 6: self = .guardiansofthegalaxy
        case 7: self = .logan case 8: self = .minions case 9: self = .planetoftheapes
        case 10: self = .spiderman
        default:
            return nil
        }
    }
    
    
    static var movieCount:Int = 10;
    
    var rank:Int
    {
        get
        {
            return self.rawValue
        }
    }
    
    var name:String
    {
        get
        {
            switch self
            {
            case .annabelle: return "Annabelle"
            case .beautyandthebeast: return "Beauty And The Beast"
            case .deadpool: return "Deadpool"
            case .despicableme3: return "Despicable Me 3"
            case .dunkirk: return "Dunkirk"
            case .guardiansofthegalaxy: return "Guardians Of The Galaxy"
            case .logan: return "Logan"
            case .minions: return "Minions"
            case .planetoftheapes: return "Planet Of The Apes"
            case .spiderman: return "Spiderman"
            }
        }
    }
    
    
    var imageName:String
    {
        get
        {
            return self.name.replacingOccurrences(of: " ", with: "").lowercased()
        }
    }
    
    
    var overview:String
    {
        get
        {
            switch self
            {
            case .annabelle: return "Several years after the tragic death of their little girl, a dollmaker and his wife welcome a nun and several girls from a shuttered orphanage into their home, soon becoming the target of the dollmaker's possessed creation, Annabelle."
            case .beautyandthebeast: return "A live-action adaptation of Disney's version of the classic 'Beauty and the Beast' tale of a cursed prince and a beautiful young woman who helps him break the spell."
            case .deadpool: return "Deadpool tells the origin story of former Special Forces operative turned mercenary Wade Wilson, who after being subjected to a rogue experiment that leaves him with accelerated healing powers, adopts the alter ego Deadpool. Armed with his new abilities and a dark, twisted sense of humor, Deadpool hunts down the man who nearly destroyed his life."
            case .despicableme3: return "Gru and his wife Lucy must stop former '80s child star Balthazar Bratt from achieving world domination."
            case .dunkirk: return "Miraculous evacuation of Allied soldiers from Belgium, Britain, Canada, and France, who were cut off and surrounded by the German army from the beaches and harbor of Dunkirk, France, between May 26 and June 04, 1940, during Battle of France in World War II."
            case .guardiansofthegalaxy: return "The Guardians must fight to keep their newfound family together as they unravel the mysteries of Peter Quill's true parentage."
            case .logan: return "In the near future, a weary Logan cares for an ailing Professor X in a hideout on the Mexican border. But Logan's attempts to hide from the world and his legacy are upended when a young mutant arrives, pursued by dark forces"
            case .minions: return "Minions Stuart, Kevin and Bob are recruited by Scarlet Overkill, a super-villain who, alongside her inventor husband Herb, hatches a plot to take over the world."
            case .planetoftheapes: return "PCaesar and his apes are forced into a deadly conflict with an army of humans led by a ruthless Colonel. After the apes suffer unimaginable losses, Caesar wrestles with his darker instincts and begins his own mythic quest to avenge his kind. As the journey finally brings them face to face, Caesar and the Colonel are pitted against each other in an epic battle that will determine the fate of both their species and the future of the planet."
            case .spiderman: return "Following the events of Captain America: Civil War, Peter Parker, with the help of his mentor Tony Stark, tries to balance his life as an ordinary high school student in Queens, New York City, with fighting crime as his superhero alter ego Spider-Man as a new threat, the Vulture, emerges."
                
            }
        }
    }
    
    
    
    var genre:String
    {
        get
        {
            switch self
            {
            case .annabelle: return "Horror,Thriller"
            case .beautyandthebeast: return "Fantasy,War"
            case .deadpool: return "Action,Thriller"
            case .despicableme3: return "Animation,Comedy"
            case .dunkirk: return "Action,Thriller,Comedy"
            case .guardiansofthegalaxy: return "Fantasy,War,Fiction"
            case .logan: return "Action"
            case .minions: return "Animation,Comedy,Fiction"
            case .planetoftheapes: return "Thriller,Action,Fiction,Fantasy,War"
            case .spiderman: return "Action,Drama,Comedy,Crime"
            }
        }
    }
    
    
    
    static func getList() ->[MovieList]
    {
       return[annabelle,beautyandthebeast,deadpool,despicableme3,dunkirk,guardiansofthegalaxy,logan,minions,planetoftheapes,spiderman]
        
    }
    
    
    static var favoriteList = [Int]()
    
    static func getFavoriteMovieImageList() -> Array<UIImage>{
        var movieImageArray = [UIImage]()
        
        //For Testing
        for item in 1...8{
        favoriteList.append(item)
        }
        
        
        //Looping through all tghe favorite list and creating items.
        for item in favoriteList{
            movieImageArray.append(UIImage(named: self.getList()[item].imageName)!)
        }
        return []
    }
    
}

