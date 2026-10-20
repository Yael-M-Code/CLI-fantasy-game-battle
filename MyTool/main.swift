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
    case Spiders, GiantSpiders, Trolls, GroupOfGoblins, Orcs, BabyDragons, Rats
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
    let StartAtFloor: Int
    
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
    player.speed += 50
}

else if player.classes == "Elves" {
    print("🧝🏻‍♂️")
    player.health += 100
    player.attack += 40
    player.defense += 20
    player.speed += 35
    
}

sleep(2)

let baseWeapon = items(rarityI: rarity.Bad, defenseI: 0, attackI: 3, healthI: 0, type: type.Sword)

print("""
    
    
    [EXPLANATION OF THE GAME]
    Now you're almost ready, you just need a weapon to enter the Great Dungeons of this world.
    Oh you don't have one ?
    Take this \(baseWeapon.type), this is not the best one but you will found more stuffs in the dungeons.
    Let me just explain what you will find, there is mobs at each floor and every 5 floors there is a boss: he gives better loots but need more preparation. 
    Everytime a fight arrive, you can try to run (it's more difficult when there is a lot of mobs) or try to kill the mobs. Every mob you kill give you xp that give you better stats!
    """)

sleep(10)

let h = input("Are you ready?: ")
print("Let's Go to the dungeons!")

sleep(2)

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

// -------- mob part -------

var spider = mobs(type: mob.Spiders, health: 40, attack: 30, defense: 15, speed: 50, StartAtFloor: 2)
var giantSpider = mobs(type: mob.GiantSpiders, health: 90, attack: 130, defense: 100, speed: 40, StartAtFloor: 13)
var rat = mobs(type: mob.Rats, health: 30, attack: 20, defense: 5, speed: 70, StartAtFloor: 1)
var troll = mobs(type: mob.Trolls, health: 130, attack: 200, defense: 150, speed: 20, StartAtFloor: 18)
var groupOfGoblin = mobs(type: mob.GroupOfGoblins, health: 60, attack: 60, defense: 40, speed: 40, StartAtFloor: 5)
var orc = mobs(type: mob.Orcs, health: 65, attack: 85, defense: 20, speed: 30, StartAtFloor: 8)
var babyDragon = mobs(type: mob.BabyDragons, health: 250, attack: 400, defense: 300, speed: 25, StartAtFloor: 25)

// -------- end mob part -------


// -------- Dungeons part --------
print("I forgot, when you fights you can make choice, every choice is represented by a letter (i.e: [1] Run to escape the fight), you have to just put the number, in this case 1, not the whole sentence")

var actualFloor = 1

func MechantMob (_ Floor: Int, _ NbTour: Int) {
    
    }

func NewFloor (_ Flevel: Int) {
    
    if Flevel.isMultiple(of: 5) != true {
        print("┏━━━━━━┛ Floor \(Flevel) ┗━━━━━━┓")
    }
    if Flevel.isMultiple(of: 5) == true {
        print("""
              ┏━━━━━━┛ Floor n°\(Flevel) ┗━━━━━━┓
              ┗━━━━━━┓ A boss lives here ┏━━━━━━┛
              """)
    }
    Floor(Flevel)
}

func Floor (_ Flevels: Int) {
    var tour = Int.random(in: 2...5)
    if Flevels >= 10 {
        tour = Int.random(in: 4...10)
        print("The range for the number of combat per floor UPGRADE, now it's between 4...10")
    }
    if Flevels >= 25 {
        tour = Int.random(in: 12...20)
        print("The range for the number of combat per floor UPGRADE, now it's between 12...20")
    }
    if Flevels >= 50 {
        tour = Int.random(in: 25...100)
        print("The range for the number of combat per floor UPGRADE, now it's between 25...100, this is the last upgrade")
    }
    MechantMob(Flevels, tour)
    endFloor()
}

func endFloor () {
    actualFloor += 1
    NewFloor(actualFloor)
}
