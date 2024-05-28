
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
    @State private var showingPost = false
    
    func randomContent() {
        let newItem = spotData.next()
        spotItem = newItem!
    }
    
    func callURLEndpoint()  {
        let url = URL(string: "http://localhost:8080/fast")!
        
        do {
            let _ = try Data(contentsOf:url)
            print("Data retrieval passed")
        } catch {
            print("Data retrieval failed")
        }
    }
    
    @ViewBuilder
    func getSpotStack() -> some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Cool Spots")
                    .fontWeight(.black)
                    .font(.system(size:45))
                
                Text("Amazing places around the world to explore")
                    .multilineTextAlignment(.leading)
                    .italic()
            }
            
            Image(spotItem.image)
                .resizable()
                .scaledToFit()
                .animation(
                    .default,
                    value:spotItem.ordinal)
            
            Text(spotItem.description)
                .multilineTextAlignment(.leading)
                .italic()
            
            Text(spotItem.country!.name)
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                .italic()
        }
    }
    
    @ViewBuilder
    func getButtonStack() -> some View {
        VStack {
            Button("Show Next") {
                randomContent()
            }
            .buttonStyle(.borderedProminent)
            .padding(.vertical,30)
            
            Button("Post") {
                callURLEndpoint()
                showingPost.toggle()
            }
            .buttonStyle(.borderedProminent)
            .sheet(isPresented: $showingPost) {
                PostView()
            }
        }
    }
    
    @ViewBuilder
    func getVerticalLayout() -> some View {
        VStack{
            getSpotStack()
            getButtonStack()
        }
        .frame(width:320,height:570)
    }
    
    @ViewBuilder
    func getHorizontalLayout() -> some View {
        HStack{
            getSpotStack()
            getButtonStack()
        }
        .frame(width:570,height:320)
    }
    
    @State private var currentOrientation = UIDevice.current.orientation
    
    var body:  some View {
        ZStack {
            VStack{
                if (!currentOrientation.isLandscape) {
                    getVerticalLayout()
                } else {
                    getHorizontalLayout()
                }
            }
        }
        .padding(.horizontal,20)
        .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
            self.currentOrientation = UIDevice.current.orientation
        }
    }
    
    init() {
        self.spotItem = spotData.next()!
    }
}

#Preview {
    CardView()
}

