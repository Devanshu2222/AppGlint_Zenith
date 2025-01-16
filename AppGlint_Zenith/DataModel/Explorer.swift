//
//  Explorer.swift
//  AppGlint_Zenith
//
//  Created by student-2 on 18/12/24.
//

class ExplorerDataModel{
//    func recommendedByGlint(games: [Game] ,  user : User) -> Game {
//        var game : Game = games[0]
//        for game in games{
//            for game1 in user.playedGames{
//                if game1.name != game.name{
//                    continue
//                }else {
//                    break
//                }
//            }
//        }
//        return game
//    }
    
    func calmingGames(games: [Game], gameCategory : Game.GameType) -> Game {
        
            if gameCategory == .parental{
                for game in games {
                    if game.gameType == .parental && game.categories == .calming{
                        return game
                    }
                }
            }
            else{
                for game in games {
                    if game.gameType == .appBased && game.categories == .calming{
                        return game
                    }
                }
        }
        return games.first!
    }
    
    func sensoryGames(games: [Game] , gameCategory : Game.GameType) -> Game {
        if gameCategory == .parental{
            for game in games {
                if game.gameType == .parental && game.categories == .sensory{
                    return game
                }
            }
        }
        else{
            for game in games {
                if game.gameType == .appBased && game.categories == .sensory{
                    return game
                }
            }
        }
        return games.first!
    }
    
    func interactiveGames(games: [Game] , gameCategory : Game.GameType) -> Game {
        if gameCategory == .parental{
            for game in games {
                if game.gameType == .parental && game.categories == .interactive{
                    return game
                }
            }
        }
        else{
            for game in games {
                if game.gameType == .appBased && game.categories == .interactive{
                    return game
                }
            }
        }
        return games.first!
    }
}
                                                                                                   
