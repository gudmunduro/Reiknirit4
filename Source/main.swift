import Foundation

while true {

    let menu = Menu(title: "Reiknirit - Verkefni 4", 
                    options: [
                        (text: "Linear search", option: runLinearSearch),
                        (text: "Hætta", option: {
                            exit(0)
                        })
                    ])

    menu.show()
}