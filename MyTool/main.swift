import Foundation

// Function to that replace readLine, this now look like python input()

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
    var health = 100
    var attack = 0
    var defense = 0
    var speed = 0
}

// Here starts the choice for the name and the classes of the Player

print("""
    Your choice is between: 
    \(Characters.Magician), \(Characters.Man), \(Characters.Hobbit), \(Characters.Elves), \(Characters.Orc), \(Characters.Dragons)
    """)
var player = Player(classes: (input("Who you want to be between the classes ?: ")), name: input("How can we call you ?: "))


print("Welcome \(player.name), you are a \(player.classes)", terminator: " ")

// Print a nice emoji that match the classes

if player.classes == "Magician" {
    print("🧙🏻‍♂️")
    player.health += 10
    player.attack += 30
    player.defense += 50
    player.speed += 20
}

else if player.classes == "Man" {
    print("🧍🏼‍♂️")
    player.attack += 30
    player.defense += 20
    player.speed += 20
}

else if player.classes == "Hobbit" {
    print("👨🏻‍🌾")
    player.health -= 20
    player.attack += 20
    player.defense += 40
    player.speed += 80
}

else if player.classes == "Elves" {
    print("🧝🏻‍♂️")
    player.health += 300000
    player.attack += 40
    player.defense += 20
    player.speed += 50
}

else if player.classes == "Orc" {
    print("🧌")
    player.health -= 10
    player.attack += 40
    player.defense += 10
    player.speed += 10
}

else if player.classes == "Dragons" {
    print("🐉")
    player.health += 2000
    player.attack += 300
    player.defense += 50
    player.speed += 40
}








