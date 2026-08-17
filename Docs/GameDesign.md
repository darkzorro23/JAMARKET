# JaMarket - Game Design Document (GDD)

## 1. High Concept

**JaMarket** is a TCG (Trading Card Game) shop simulator that combines:
- 🏪 Shop management/tycoon gameplay
- 🎴 Card collecting & trading
- ⚔️ Competitive dueling
- 🍿 Food/beverage business simulation

**Core Loop**: Earn coins → Buy cards → Duel players → Win coins → Upgrade shop → Unlock features

---

## 2. Core Features

### 2.1 Card System
**Goal**: Collect and manage diverse card decks

- **Deck Size**: 40-60 cards (Yu-Gi-Oh! standard)
- **Card Types**: 
  - Monster Cards
  - Spell Cards
  - Trap Cards
  - Effect Cards
- **Rarity Grades**:
  - Common (White)
  - Uncommon (Green)
  - Rare (Blue)
  - Super Rare (Gold)
  - Ultra Rare (Rainbow)
- **Card Properties**:
  - Name, Type, Rarity
  - Attack/Defense (for Monster cards)
  - Description/Effect
  - Card ID & Edition
  - Buy Price & Sell Value

### 2.2 Shop System
**Goal**: Build, manage, and customize your TCG shop

- **Shop Sizes** (Progression):
  - Level 1: Small counter shop (1 table, basic layout)
  - Level 2: Medium shop (3 tables, more designs)
  - Level 3: Large store (5 tables, premium designs)
  - Level 4: Mega shop (10 tables, full customization)
  - Level 5+: Endless upgrades

- **Shop Features**:
  - Dueling tables
  - Card display/inventory
  - Food counter
  - Customer seating
  - Decorations/themes

### 2.3 Dueling System
**Goal**: Compete 1v1 against other players

- **Duel Mechanics**:
  - 1v1 Turn-based battles
  - Life Points: 8000 (Yu-Gi-Oh! standard)
  - Win condition: Reduce opponent LP to 0
  - Win = Earn coins
  - Lose = Learn for next time

- **Difficulty Levels**:
  - Beginner NPCs (Easy)
  - Intermediate Players (Medium)
  - Expert Duelists (Hard)
  - Legendary Masters (Extreme)

### 2.4 Economy System
**Goal**: Manage resources and progression

- **Currency**: Coins (in-game only, no real money)
  - Starting: 1000 coins
  - Win duel: +500-2000 coins
  - Sell card: Card's value in coins
  - Buy card: Cost in coins
  - Sell snack: Profit in coins
  - Shop upgrade: Cost in coins

- **Price Dynamics**:
  - Common cards: 50-200 coins
  - Rare cards: 500-2000 coins
  - Ultra Rare: 5000+ coins
  - Rarer = More expensive

### 2.5 Food & Beverage System
**Goal**: Additional revenue stream

- **Menu Items**:
  - Popcorn (make yourself)
  - Chips (various flavors)
  - Candy/Sweets
  - Ice Cream (maker machine - YOU create flavors)
  - Drinks (soda, juice, coffee)

- **Crafting**:
  - Ice cream maker: Choose flavor, toppings, colors
  - Popcorn: Choose seasonings
  - Snack preparation: Similar to Ice Cream Simulator

- **Economics**:
  - Cost to make: 10-50 coins
  - Sell price: 50-200 coins
  - Profit: 40-150 coins per item
  - NPC customers buy items

### 2.6 Progression System
**Goal**: Long-term player engagement

- **Shop Levels**: Unlock features, larger space
- **Card Collection**: Rarity achievements
- **Duel Record**: Win/loss statistics
- **Unlockables**:
  - New card packs
  - Shop themes/decorations
  - NPC challengers
  - Food recipes
  - Special events

---

## 3. Game Loop

```
Start Day
├─ Player money: [Current Coins]
├─ Tasks (Choose 1-3):
│  ├─ Buy card packs
│  ├─ Duel NPCs/Players
│  ├─ Make food items
│  └─ Manage shop
├─ Resolution:
│  ├─ Earn coins from duels
│  ├─ Sell items to customers
│  └─ Spend coins on upgrades
└─ End Day → Save Progress
```

---

## 4. User Interface

### Main Menu
- New Game
- Continue
- Settings
- Credits

### In-Game UI
- **Top Bar**: Coins, Day/Time, Quick menu
- **Left Panel**: Inventory, Card Collection
- **Center**: Shop view, Dueling, Food station
- **Right Panel**: NPC list, Shop status, Shop customization
- **Bottom**: Actions, Shortcuts

### Key Screens
1. **Shop View**: See your shop, customers, dueling
2. **Card Store**: Browse & buy cards
3. **Dueling Arena**: 1v1 battle view
4. **Food Maker**: Craft ice cream, snacks
5. **Shop Customization**: Upgrade, decorate, expand
6. **Inventory**: Manage cards, items, money
7. **Stats**: View progress, achievements

---

## 5. Target Audience

- **Age**: 13+ (TCG fans, simulation fans)
- **Genre**: TCG Simulation / Tycoon
- **Platforms**: PC → Console → Mobile
- **Style**: Anime-inspired, colorful, engaging

---

## 6. Tone & Aesthetics

- **Visual Style**: Anime / Manga inspired
- **Color Palette**: Vibrant, fantasy-themed
- **Characters**: Anime NPCs with personality
- **Music**: Upbeat, Japanese-inspired BGM
- **Tone**: Fun, casual, competitive (not dark/serious)

---

## 7. Win/Fail Conditions

### Win Conditions
- Reach shop level 5+
- Collect all card types
- Win 100+ duels
- Unlock all decorations

### Fail Conditions
- No fail state - Endless gameplay
- Players can restart if wanted

---

## 8. Monetization Strategy (Future)

**Current Version**: Free-to-play, no real money

**Future (Post-Launch)**:
- Optional cosmetics (shop decorations)
- Battle pass (cosmetic items)
- NOT pay-to-win
- NO loot boxes/gacha (due to TCG laws)

---

## 9. Platforms

### Phase 1 (Release)
- 🖥️ Windows PC
- 🎮 Steam

### Phase 2 (Post-Launch)
- 🎮 Xbox One/Series X|S
- 🎮 PlayStation 4/5

### Phase 3 (Mobile)
- 📱 iOS (eventually)
- 📱 Android (eventually)

---

## 10. Success Metrics

- Player Engagement: Time played per session
- Retention: % returning after 1 week
- Shop Progression: % reaching level 3+
- Community: Review score > 4.0/5.0

---

**Version**: 1.0 Draft
**Last Updated**: 2026-08-17
