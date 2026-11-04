# Rye Water Cycles (Swift)

A demo website for a made-up bike repair workshop in Kilcock, Co. Kildare, written in Swift using [Ignite](https://github.com/twostraws/Ignite).

**Live site:** https://davidson123456789.github.io/rye-water-cycles-swift/

Ignite lets you describe a web page with SwiftUI-style code. Running the project turns that Swift code into a static HTML website, ready to host anywhere.

## What is on the page

- A hero section with a spinning spoked wheel graphic
- A price list where tapping services builds a quote, which becomes a floating total bar on phones
- A three step "how it works" section
- A tyre pressure guide, where the pressures are calculated in Swift when the site is built
- Opening hours that highlight today, and a badge in the header showing whether the shop is open right now
- Light and dark themes, and a layout that reflows from desktop down to a small phone

## How the code is organised

| File | What it does |
| --- | --- |
| `Sources/Site.swift` | Site settings and the entry point that publishes the site |
| `Sources/Layouts/MainLayout.swift` | Shared page layout: fonts, stylesheet, header, footer and script |
| `Sources/Pages/Home.swift` | The home page, listing its sections in order |
| `Sources/Components/Sections.swift` | Each section of the page as its own Swift struct (`Hero`, `ServicesSection`, `PressureSection` and so on) |
| `Sources/Components/Data.swift` | The data: services and prices, the tyre pressure formula, and opening hours |
| `Assets/css/site.css` | The design, using CSS custom properties for both themes |
| `Assets/js/site.js` | The quote builder and the open or closed badge |
| `Includes/wheel.html` | The wheel graphic as inline SVG |

## Build it yourself

You need a Mac with Xcode 16 or later.

```
swift run
```

The finished website is written to the `Build` folder. To preview it:

```
cd Build && python3 -m http.server 8000
```

then open http://localhost:8000

## Note

Rye Water Cycles is not a real business. The name, address, phone number and prices are made up for the demo.
