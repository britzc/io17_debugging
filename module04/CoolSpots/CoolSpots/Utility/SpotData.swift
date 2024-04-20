
import Foundation

class Spot {
    var ordinal: Int
    var image: String
    var description: String
    
    init(ordinal:Int,image:String, description:String){
        self.ordinal = ordinal
        self.image = image
        self.description = description
    }
}

class SpotData {
    private var current: Spot
    
    private var items = [
        Spot(ordinal:1,image:"milfordsound",description:"Milford Sound, New Zealand"),
        Spot(ordinal:2,image:"sydneyharbourbridge",description:"Sydney Harbour Bridge, Australia"),
        Spot(ordinal:3,image:"grandcanyon",description:"Grand Canyon, America"),
        Spot(ordinal:4,image:"machupicchu",description:"Machu Picchu, Peru"),
        Spot(ordinal:5,image:"moremi",description:"Moremi, Botswana"),
        Spot(ordinal:6,image:"eiffeltower",description:"Eiffel Tower, France")
    ]
    
    func next() -> Spot {
        var randomNumber: Int = 1
        repeat {
            randomNumber = Int.random(in: 1...items.count)
        } while randomNumber == current.ordinal
        
        current = items[randomNumber-1]
        
        return current
    }
    
    init() {
        current = items[0]
    }
}
