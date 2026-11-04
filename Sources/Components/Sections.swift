import Foundation
import Ignite

// MARK: - Header

struct SiteHeader: HTML {
    var body: some HTML {
        Tag("header") {
            Tag("div") {
                Link(target: "./") {
                    Span("RW").class("mark")
                    Span("Rye Water Cycles").class("wordmark")
                }
                .class("brand")

                Tag("nav") {
                    Link("Services", target: "#services")
                    Link("How it works", target: "#process")
                    Link("Tyre guide", target: "#pressure")
                    Link("Visit", target: "#visit")
                }
                .class("nav")
                .attribute("aria-label", "Main")

                Span("Checking hours…").class("status").id("status")
            }
            .class("wrap", "bar")
        }
        .class("site-header")
    }
}

// MARK: - Hero

struct Hero: HTML {
    var body: some HTML {
        Tag("section") {
            Tag("div") {
                Tag("div") {
                    Span("Bike workshop · Kilcock, Co. Kildare").class("eyebrow")
                    Tag("h1") {
                        Span("Ride in")
                        Span("rattling.").class("strike")
                        Span("Ride out")
                        Span("quiet.").class("accent")
                    }
                    Text("A small repair workshop beside the Royal Canal greenway. Most jobs are done the same day, and every quote is agreed before a spanner touches your bike.")
                        .class("lede")
                    Tag("div") {
                        Link("Book a repair", target: "#visit").class("cta", "cta-primary")
                        Link("See prices", target: "#services").class("cta", "cta-ghost")
                    }
                    .class("actions")
                }
                .class("hero-copy")

                Tag("div") {
                    Include("wheel.html")
                    Tag("dl") {
                        Tag("div") { Tag("dt") { "Spokes trued" }; Tag("dd") { "32" } }
                        Tag("div") { Tag("dt") { "From" }; Tag("dd") { "€15" } }
                        Tag("div") { Tag("dt") { "Turnaround" }; Tag("dd") { "48h max" } }
                    }
                    .class("hero-stats")
                }
                .class("hero-art")
            }
            .class("wrap", "hero-grid")
        }
        .class("hero")
    }
}

// MARK: - Services

struct ServicesSection: HTML {
    var body: some HTML {
        Tag("section") {
            Tag("div") {
                SectionHead(eyebrow: "Price list", title: "Workshop services",
                            intro: "Labour prices include VAT. Parts are quoted separately and only fitted with your OK. Tap jobs to build a rough quote.")

                Tag("div") {
                    Tag("div") {
                        ForEach(Service.all) { service in
                            ServiceCard(service: service)
                        }
                    }
                    .class("services-grid")

                    Tag("aside") {
                        Span("Your quote").class("eyebrow")
                        Tag("p") {
                            Span("€0").class("quote-total").id("quote-total")
                        }
                        Tag("p") { "Nothing picked yet" }.class("quote-meta").id("quote-meta")
                        Link("Book these jobs", target: "#visit").class("cta", "cta-primary")
                    }
                    .class("quote")
                    .attribute("aria-live", "polite")
                }
                .class("services-layout")
            }
            .class("wrap")
        }
        .class("band")
        .id("services")
    }
}

struct ServiceCard: HTML {
    let service: Service

    var body: some HTML {
        Tag("button") {
            Tag("span") {
                Span(service.name).class("svc-name")
                Span("€\(service.price)").class("svc-price")
            }
            .class("svc-top")
            Span(service.detail).class("svc-detail")
            Tag("span") {
                Span("\(service.unit) · \(service.duration)")
                Span("Add").class("svc-add")
            }
            .class("svc-meta")
        }
        .class("svc", service.featured ? "svc-featured" : nil)
        .attribute("type", "button")
        .attribute("aria-pressed", "false")
        .attribute("data-price", "\(service.price)")
        .attribute("data-minutes", "\(service.minutes)")
    }
}

// MARK: - Process

struct ProcessSection: HTML {
    private let steps: [(String, String)] = [
        ("Drop it in", "No appointment needed for small jobs. For a full service, book a slot so we can have parts ready."),
        ("Agree the quote", "We check the bike over with you and text a fixed price before any work starts."),
        ("Ride it away", "We text when it is ready. Every job gets a test ride and a written note of what was done."),
    ]

    var body: some HTML {
        Tag("section") {
            Tag("div") {
                SectionHead(eyebrow: "How it works", title: "Three steps, no surprises", intro: nil)
                Tag("ol") {
                    ForEach(steps) { step in
                        Tag("li") {
                            Tag("h3") { step.0 }
                            Text(step.1)
                        }
                    }
                }
                .class("steps")
            }
            .class("wrap")
        }
        .class("band", "band-alt")
        .id("process")
    }
}

// MARK: - Tyre pressure guide

struct PressureSection: HTML {
    var body: some HTML {
        Tag("section") {
            Tag("div") {
                SectionHead(eyebrow: "Free advice", title: "Tyre pressure guide",
                            intro: "Starting pressures for a 75 kg rider on dry roads. Heavier riders add about 1 psi per 3 kg. Never go above the limit printed on the sidewall.")
                Tag("div") {
                    Tag("table") {
                        Tag("thead") {
                            Tag("tr") {
                                Tag("th") { "Tyre width" }
                                Tag("th") { "Used for" }
                                Tag("th") { "Front" }
                                Tag("th") { "Rear" }
                                Tag("th") { "Pressure" }.class("bar-col")
                            }
                        }
                        Tag("tbody") {
                            ForEach(PressureRow.guide) { row in
                                Tag("tr") {
                                    Tag("td") { "\(row.width) mm" }.class("mono")
                                    Tag("td") { row.use }
                                    Tag("td") { "\(row.front) psi" }.class("mono")
                                    Tag("td") { "\(row.rear) psi" }.class("mono")
                                    Tag("td") {
                                        Tag("span")
                                            .class("meter")
                                            .attribute("style", "--v: \(row.rear)")
                                            .attribute("aria-hidden", "true")
                                    }
                                    .class("bar-col")
                                }
                            }
                        }
                    }
                    .class("pressure")
                }
                .class("table-scroll")
            }
            .class("wrap")
        }
        .class("band")
        .id("pressure")
    }
}

// MARK: - Visit

struct VisitSection: HTML {
    var body: some HTML {
        Tag("section") {
            Tag("div") {
                Tag("div") {
                    SectionHead(eyebrow: "Visit", title: "Find the workshop",
                                intro: "Unit 4, Mill Lane, Kilcock, Co. Kildare. Two minutes from the canal path and the train station. This is a demo, so the address is made up.")
                    Tag("p") {
                        Span("Phone").class("eyebrow")
                        Span("01 555 0142").class("big-contact")
                    }
                    .class("contact")
                }
                Tag("div") {
                    Tag("table") {
                        Tag("tbody") {
                            ForEach(OpeningDay.week) { day in
                                Tag("tr") {
                                    Tag("td") { day.day }
                                    Tag("td") { day.hours }.class("mono")
                                }
                                .attribute("data-weekday", "\(day.weekday)")
                                .class(day.hours == "Closed" ? "closed" : nil)
                            }
                        }
                    }
                    .class("hours")
                }
                .class("hours-card")
            }
            .class("wrap", "visit-grid")
        }
        .class("band", "band-dark")
        .id("visit")
    }
}

// MARK: - Footer

struct SiteFooter: HTML {
    var body: some HTML {
        Tag("footer") {
            Tag("div") {
                Span("© Rye Water Cycles. A demo website for a made-up business.")
                Span("Built in Swift with Ignite")
            }
            .class("wrap", "footer-row")
        }
        .class("site-footer")
    }
}

// MARK: - Shared pieces

struct SectionHead: HTML {
    let eyebrow: String
    let title: String
    let intro: String?

    var body: some HTML {
        Tag("div") {
            Span(eyebrow).class("eyebrow")
            Tag("h2") { title }
            if let intro {
                Text(intro).class("section-intro")
            }
        }
        .class("section-head")
    }
}
