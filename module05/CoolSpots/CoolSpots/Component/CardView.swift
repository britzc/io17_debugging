
import SwiftUI
import OSLog

extension Logger {
    private static var subsystem = Bundle.main.bundleIdentifier!
    
    static let viewCycle = Logger(subsystem: subsystem, category: "viewcycle")
    static let statistics = Logger(subsystem: subsystem, category: "statistics")
}

struct CardView: View {
    let spotData = SpotData()
    
    @State private var spotItem: Spot
    
    func randomContent() {
        let newItem = spotData.next()
        spotItem = newItem!
    }
    
    var body:  some View {
        ZStack {
            VStack {
                VStack(alignment: .leading) {
                    Text("Cool Spots")
                        .fontWeight(.black)
                        .font(.system(size:45))
                    
                    Text("Amazing places around the world to explore")
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        .italic()
                }
                .padding(.horizontal,30)
                
                Image(spotItem.image)
                    .resizable()
                    .scaledToFit()
                    .animation(
                        .default,
                        value:spotItem.ordinal)
                
                Text(spotItem.description)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .italic()
                
                Text(spotItem.country!.name)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .italic()
                
                Button("Show Next") {
                    randomContent()
                }
                .buttonStyle(.borderedProminent)
                .padding(.vertical,30)
                
            }
        }
        .frame(width:320,height:570)
    }
    
    init() {
        self.spotItem = spotData.next()!
    }
}

#Preview {
    CardView()
}

