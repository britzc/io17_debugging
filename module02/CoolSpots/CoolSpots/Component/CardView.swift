
import SwiftUI
import OSLog

extension Logger {
    private static var subsystem = Bundle.main.bundleIdentifier!
    
    static let viewCycle = Logger(subsystem: subsystem, category: "viewcycle")
    static let statistics = Logger(subsystem: subsystem, category: "statistics")
}

func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

struct CardView: View {
    let spotData = SpotData()
    
    @State private var contentNumber: Int = 1
    
    func randomContent() {
        print("---- SELECTING NEW CONTENT ----")
        
        let username = "Pluralsight User"
        Logger.viewCycle.info("Welcome \(username)")
        
        var randomNumber: Int = 0
        repeat {
            randomNumber = Int.random(in: 0...2)
        } while randomNumber == contentNumber
        contentNumber = randomNumber
    }
    
    var body: some View {
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
                
                    Image("spot-\(contentNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(
                            .default,
                            value:contentNumber)
                
                Text(spotData.spotDescriptions[contentNumber])
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
}

#Preview {
    CardView()
}

