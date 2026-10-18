import Foundation

// Function that replace readLine, this now look like python input()

func input(_ prompt: String = "") -> String {
    print(prompt, terminator: "")
    return readLine() ?? ""
}

enum Characters {
    case Magician, Man, Hobbit, Elves
}

enum rarity {
    case Bad, Common, Uncommon, Rare, Epic, Mythic, Legendary
}

enum mob {
    case Spiders, GiantSpider, Troll, GroupOfGoblin, Orcs, Dragons
}

enum type {
    case Hat, Chestplace, Leggins, Boots, Sword, Axe, Shield
}

struct mobs {
    let type: mob
    var health: Int
    var attack: Int
    var defense: Int
    var speed: Int
    
}

struct items {
    let rarityI: rarity
    let defenseI: Int
    let attackI: Int
    let healthI: Int
    let type: type
}

struct Player {
    let classes: String
    var name: String
    var xp = 0
    var level = 1
    var health = 100
    var attack = 0
    var defense = 0
    var speed = 0
}

// Here starts the choice for the name and the classes of the Player

print("""
    Your choice is between: 
    \(Characters.Magician), \(Characters.Man), \(Characters.Hobbit), \(Characters.Elves))
    """)
var player = Player(classes: (input("Who you want to be between the classes ?: ")), name: input("How can we call you ?: "))


print("Welcome \(player.name), you are a \(player.classes)", terminator: " ")

// Print a nice emoji that match the classes

if player.classes == "Magician" {
    print("🧙🏻‍♂️")
    player.health += 15
    player.attack += 30
    player.defense += 50
    player.speed += 25
}

else if player.classes == "Man" {
    print("🧍🏼‍♂️")
    player.attack += 30
    player.defense += 20
    player.speed += 25
}

else if player.classes == "Hobbit" {
    print("👨🏻‍🌾")
    player.health -= 20
    player.attack += 10
    player.defense += 40
    player.speed += 80
}

else if player.classes == "Elves" {
    print("🧝🏻‍♂️")
    player.health += 100
    player.attack += 40
    player.defense += 20
    player.speed += 50
    
}

let baseWeapon = items(rarityI: rarity.Bad, defenseI: 0, attackI: 3, healthI: 0, type: type.Sword)

print("""
    [EXPLANATION OF THE GAME]
    Now you're almost ready, you just need a weapon to enter the Great Dungeons of this world.
    Oh you don't have one ?
    Take this \(baseWeapon.type), this is not the best one but you will found more stuffs in the dungeons.
    Let me just explain what you will find, there is mobs at each floor and every 5 floors there is a boss: he gives better loots but need more preparation. 
    Everytime a fight arrive, you can try to run (it's more difficult when there is a lot of mobs) or try to kill the mobs. Every mob you kill give you xp that give you better stats!
    """)
let h = input("Are you ready?")
print("Let's Go to the dungeons!")

// -------- xp part, scroll to the other comment for next part --------

var xpCap = Double(100)
var levelCheck = 1

func XP () {
    if Double(player.xp) >= xpCap && player.level == levelCheck {
        player.level += 1
        xpCap = xpCap * 1.5
        levelCheck += 1
        return
    }
}

// -------- end of xp part --------

print("I forgot, when you fights you can make choice, every choice is represented by a letter (i.e: [1] Run to escape the fight), you have to just put the number, in this case 1, not the whole sentence")

var floor = 1
func NewFloor (Flevel: Int) {
    print("┏━━━━━━┛ Floor \(Flevel) ┗━━━━━━┓")
    
}
