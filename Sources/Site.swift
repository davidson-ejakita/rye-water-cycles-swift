import Foundation
import Ignite

@main
struct IgniteWebsite {
    static func main() async {
        var site = RyeWaterSite()

        do {
            try await site.publish()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct RyeWaterSite: Site {
    var name = "Rye Water Cycles"
    var titleSuffix = " · Rye Water Cycles"
    var url = URL(static: "https://davidson123456789.github.io/rye-water-cycles-swift")
    var author = "Rye Water Cycles"

    var homePage = Home()
    var layout = MainLayout()
}
