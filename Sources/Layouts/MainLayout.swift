import Foundation
import Ignite

/// Every page shares the same header, footer, fonts and stylesheet.
struct MainLayout: Layout {
    var body: some Document {
        Head {
            MetaLink(href: "https://fonts.googleapis.com", rel: "preconnect")
            MetaLink(
                href: "https://fonts.googleapis.com/css2?family=Big+Shoulders+Display:wght@700;800;900&family=Instrument+Sans:wght@400;500;600&family=IBM+Plex+Mono:wght@500&display=swap",
                rel: .stylesheet
            )
            MetaLink(href: "/css/site.css", rel: .stylesheet)
        }

        Body {
            SiteHeader()
            content
            SiteFooter()
            Script(file: "js/site.js")
        }
        .ignorePageGutters()
    }
}
