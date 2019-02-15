import Foundation

while true {

    let menu = Menu(title: "Reiknirit - Verkefni 4", 
                    options: [
                        (text: "Spurning 2", option: runLinearSearch),
                        (text: "Spurning 6", option: runTreeSearch),
                        (text: "Hætta", option: {
                            exit(0)
                        })
                    ])

    menu.show()
}