
import Foundation

class Country {
    var name: String
    
    init(name:String) {
        self.name = name
    }
}

class Spot {
    var ordinal: Int
    var image: String
    var description: String
    var country: Country?
    
    init(ordinal:Int,image:String, description:String, country: Country? = nil){
        self.ordinal = ordinal
        self.image = image
        self.description = description
        self.country = country
    }
}

class SpotData {
    private var currentOrdinal: Int
    
    private var images = ["milfordsound", "sydneyharbourbridge", "grandcanyon", "machupicchu", "moremi", "eiffeltower", "nazare"]
    private var descriptions = ["Milford Sound", "Sydney Harbour Bridge", "Grand Canyon", "Machu Picchu", "Moremi", "Eiffel Tower", "Nazare"]
    private var countries = ["New Zealand", "Australia", "America", "Peru", "Botswana", "France", "Portugal"]
    
    func next() -> Spot? {
        var randomNumber: Int = 0
        repeat {
            randomNumber = Int.random(in: 0...images.count-1)
        } while randomNumber == currentOrdinal
        
        currentOrdinal = randomNumber
        
        let country: Country? = Country(name:countries[currentOrdinal])
        
        let spot: Spot? = Spot(ordinal:currentOrdinal + 1,image:images[currentOrdinal],description:descriptions[currentOrdinal],country: country)
        
        return spot
    }
    
    init() {
        currentOrdinal = 1
    }
}
