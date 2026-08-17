# JaMarket - TCG Card Shop Simulator

**Unreal Engine 5.8** | Single Player | Shop Simulation & Card Duels

## 📋 Project Overview

JaMarket is a TCG (Trading Card Game) shop simulator where you:
- 🏪 Build and manage your own card shop
- 🎴 Collect and trade cards (40-60 cards per deck, Yu-Gi-Oh! inspired)
- ⚔️ Duel other players at shop tables
- 🍿 Sell snacks (chips, popcorn, ice cream, sweets) - make your own!
- 💰 Earn coins and upgrade your shop
- 🎮 Progress: Bigger shop = More designs & larger space

## 🎯 Features

### Core Systems
- **Card Collection**: Various card types, rarity grades, deck management
- **Dueling System**: 1v1 PvP duels with shop tables
- **Shop Management**: Buy/sell cards, upgrade shop size
- **Food & Beverage**: Ice cream maker, snack shop
- **Economy**: In-game coins currency system
- **Shop Progression**: Unlock larger shops and more designs

### Planned Platforms
- 🖥️ PC (Primary)
- 🎮 Steam (Release)
- 🎮 Xbox, PlayStation, Mobile (Future)

## 🛠️ Tech Stack

- **Engine**: Unreal Engine 5.8
- **Language**: C++ (Core Systems) + Blueprints (UI/Logic)
- **Save System**: Local Save (PC)
- **Version Control**: Git/GitHub

## 📁 Project Structure

```
JaMarket/
├── Source/
│   ├── JaMarket/
│   │   ├── Core/              # Core game systems
│   │   │   ├── Card/          # Card system
│   │   │   ├── Shop/          # Shop management
│   │   │   ├── Duel/          # Dueling system
│   │   │   └── Economy/       # Currency & progression
│   │   ├── UI/                # User interface
│   │   ├── Gameplay/          # Game mechanics
│   │   └── Data/              # Data structures
│   └── JaMarketEditor/        # Editor plugins
├── Content/
│   ├── Blueprints/            # Blueprint assets
│   ├── Characters/            # NPC characters (Anime style)
│   ├── UI/                    # UI widgets & menus
│   ├── Materials/             # Textures & materials
│   └── Data/                  # Game data (cards, items)
├── Docs/
│   ├── GameDesign.md          # Game design document
│   ├── SystemDesign.md        # Technical design
│   └── Tutorial.md            # Development guide
└── .gitignore                 # Unreal Engine ignore rules
```

## 🚀 Getting Started

### Prerequisites
- Unreal Engine 5.8 installed
- Visual Studio 2022 (C++ development)
- GitHub Desktop or Git CLI

### Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/darkzorro23/JAMARKET.git
   cd JAMARKET
   ```

2. **Generate Visual Studio files**
   ```bash
   .\\GenerateProjectFiles.bat
   ```

3. **Open in Unreal Engine**
   - Right-click `JAMARKET.uproject`
   - Select "Generate Visual Studio project files"
   - Open `JAMARKET.sln` in Visual Studio
   - Build the solution
   - Open the project in Unreal Engine 5.8

4. **Start developing!**
   - Check `Docs/Tutorial.md` for first steps

## 📚 Documentation

- **Game Design**: See `Docs/GameDesign.md`
- **System Architecture**: See `Docs/SystemDesign.md`
- **Development Guide**: See `Docs/Tutorial.md`

## 🎮 Game Mechanics

### Shop System
- Start small, upgrade to larger shops
- Each shop size has different layouts & features
- Customize with different themes/designs

### Card System
- 40-60 cards per deck (Yu-Gi-Oh! inspired)
- Multiple card types: Monster, Spell, Trap, etc.
- Rarity grades: Common → Ultra Rare
- Buy from vendors, sell to players

### Dueling
- 1v1 PvP battles at shop tables
- Win = Earn coins & experience
- Lose = Keep trying, learn strategies

### Food & Beverage
- Make your own ice cream
- Sell snacks & drinks
- Players purchase to enjoy in shop

### Economy
- **Currency**: Coins only (no real money for now)
- **Income**: Selling cards & snacks
- **Costs**: Buying cards & upgrading shop

## 🔄 Development Phases

### Phase 1: Foundations (Week 1)
- [ ] Project setup & structure
- [ ] Card system C++ classes
- [ ] Shop management system
- [ ] Basic UI framework

### Phase 2: Core Systems (Week 2-3)
- [ ] Dueling mechanics
- [ ] Card collection system
- [ ] Economy & progression
- [ ] NPC characters

### Phase 3: Polish (Week 4+)
- [ ] Anime-style visuals
- [ ] Food/beverage system
- [ ] Sound design
- [ ] Save/load system
- [ ] Bug fixes & optimization

## 📝 Contributing

Solo project for now, but documentation kept clean for future collaboration!

## 📄 License

MIT License - See LICENSE file

## 👤 Author

**darkzorro23** - Solo Developer

---

**Status**: 🚀 In Development

**Last Updated**: 2026-08-17
