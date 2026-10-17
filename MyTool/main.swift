import Foundation

func input(_ prompt: String = "") -> String {
    print(prompt, terminator: "")
    return readLine() ?? ""
}

enum Characters {
    case Magician, Man, Hobbit, Elves, Orc, Dragons
}

struct Player {
    let classes: String
    var name: String
    
}

print("""
    Your choice is between: 
    \(Characters.Magician), \(Characters.Man), \(Characters.Hobbit), \(Characters.Elves), \(Characters.Orc), \(Characters.Dragons)
    """)
var player = Player(classes: (input("Who you want to be between the classes ?: ")), name: input("How can we call you ?: "))


print("Welcome \(player.name), you are a \(player.classes)", terminator: " ")


if player.classes == "Magician" {
    print("🧙🏻‍♂️")
}

else if player.classes == "Man" {
    print("🧍🏼‍♂️")
}

else if player.classes == "Hobbit" {
    print("👨🏻‍🌾")
}

else if player.classes == "Elves" {
    print("🧝🏻‍♂️")
}

else if player.classes == "Orc" {
    print("🧌")
}

else if player.classes == "Dragons" {
    print("🐉")
}







