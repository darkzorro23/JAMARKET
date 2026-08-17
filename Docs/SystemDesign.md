# JaMarket - Technical System Design

## 1. Architecture Overview

```
┌─────────────────────────────────────────────┐
│         JaMarket Game Instance              │
├─────────────────────────────────────────────┤
│  ┌──────────────┐  ┌──────────────┐        │
│  │ Game Manager │  │ Save Manager │        │
│  └──────────────┘  └──────────────┘        │
├─────────────────────────────────────────────┤
│  ┌──────────┐ ┌────────┐ ┌──────────┐     │
│  │  Card    │ │ Shop   │ │  Duel    │     │
│  │ System   │ │System  │ │ System   │     │
│  └──────────┘ └────────┘ └──────────┘     │
├─────────────────────────────────────────────┤
│  ┌──────────┐ ┌────────────┐ ┌─────────��┐ │
│  │ Economy  │ │ Food       │ │UI Manager│ │
│  │ System   │ │ System     │ │          │ │
│  └──────────┘ └────────────┘ └──────────┘ │
└─────────────────────────────────────────────┘
```

---

## 2. Core Systems

### 2.1 Card System (C++ Classes)

**Base Card Class**
```cpp
class ACard
{
  // Basic Properties
  FString CardName;
  ECardType CardType;  // Monster, Spell, Trap
  ECardRarity Rarity;  // Common, Rare, Ultra Rare
  int32 CardID;
  
  // Combat Stats
  int32 AttackPower;
  int32 DefensePower;
  
  // Economy
  int32 BuyPrice;
  int32 SellValue;
  
  // Visual
  UTexture2D* CardImage;
};
```

**Deck Management**
```cpp
class FPlayerDeck
{
  TArray<ACard*> Cards;  // 40-60 cards
  FString DeckName;
  ECardRarity HighestRarity;
};
```

### 2.2 Shop System (C++ Classes)

**Shop Data Structure**
```cpp
class AShop
{
  // Progression
  int32 ShopLevel;  // 1-∞
  int32 ExpToNextLevel;
  
  // Space
  int32 NumTables;  // Duel tables
  FVector ShopSize;
  
  // Customization
  EShopTheme CurrentTheme;
  TArray<FShopDecoration> Decorations;
  
  // Inventory
  TMap<ACard*, int32> CardInventory;
  int32 MoneyInRegister;
};
```

### 2.3 Duel System (C++ + Blueprint)

**Duel Flow (Blueprint-based)**
```
Start Duel
├─ Initialize: Player HP = 8000, Opponent HP = 8000
├─ Turn Loop:
│  ├─ Draw phase
│  ├─ Main phase (play cards)
│  ├─ Battle phase (attack)
│  ├─ End phase
│  └─ Check win condition
├─ Win/Loss:
│  ├─ Win → Earn coins
│  └─ Loss → Try again
└─ Return to Shop
```

**Duel Manager Class**
```cpp
class ADuelManager
{
  APlayerCharacter* Player;
  ANPCCharacter* Opponent;
  
  int32 PlayerHP = 8000;
  int32 OpponentHP = 8000;
  
  bool DoDuelTurn(EPlayer TurnOwner);
  bool CheckWinCondition();
  void CalculateCardDamage(ACard* AttackingCard);
};
```

### 2.4 Economy System (C++ Classes)

**Player Economy**
```cpp
class FPlayerEconomy
{
  int32 TotalCoins;
  int32 CoinsPerDayWon;
  int32 CoinsPerDaySpent;
  
  // Methods
  void AddCoins(int32 Amount);
  void SpendCoins(int32 Amount);
  bool CanAfford(int32 Cost);
};
```

**Card Pricing Logic**
```cpp
int32 CalculateCardPrice(ACard* Card)
{
  // Base price by rarity
  int32 BasePrice = 100;
  if (Card->Rarity == ECardRarity::Rare) BasePrice = 500;
  if (Card->Rarity == ECardRarity::UltraRare) BasePrice = 5000;
  
  // Adjust by supply/demand (later feature)
  return BasePrice;
}
```

### 2.5 Food & Beverage System (Blueprint-based)

**Food Item Structure**
```cpp
struct FFoodItem
{
  FString ItemName;
  EFoodType Type;  // IceCream, Popcorn, Chips
  int32 MakeCost;
  int32 SellPrice;
  UTexture2D* ItemImage;
};
```

**Food Maker Blueprint Logic**
- Player selects ingredients
- Customizes appearance (color, toppings)
- Item is created
- Can be sold to NPCs

---

## 3. Data Structures

### Player Data (Save File)
```json
{
  "PlayerData": {
    "Name": "YourName",
    "Level": 5,
    "Money": 25000,
    "DuelsWon": 42,
    "DuelsLost": 12
  },
  "Shop": {
    "Level": 2,
    "Theme": "Modern",
    "Decorations": ["Table1", "Light1", ...]
  },
  "Decks": [
    {
      "Name": "Dragon Deck",
      "Cards": [100001, 100002, ...]
    }
  ],
  "CardCollection": {
    100001: 2,
    100002: 1,
    ...
  }
}
```

---

## 4. Save/Load System

**Implementation**:
- Format: JSON (human-readable, easy to debug)
- Location: `%APPDATA%/JaMarket/SaveGames/`
- Filename: `SaveSlot_1.json`
- Auto-save: Every 5 minutes
- Manual save: Player can save anytime

**Save Manager Class**
```cpp
class USaveManager
{
  bool SaveGame(FString SlotName);
  bool LoadGame(FString SlotName);
  void AutoSave();
  TArray<FString> GetSaveSlots();
};
```

---

## 5. UI Framework

**UI Hierarchy** (Blueprints)
```
RootWidget
├─ TopBar
│  ├─ CoinDisplay
│  ├─ TimeDisplay
│  └─ MenuButton
├─ LeftPanel
│  ├─ CardInventory
│  └─ DeckSelector
├─ MainView
│  ├─ ShopScene (3D or 2D sprite)
│  ├─ DuelArena (when dueling)
│  └─ FoodMaker (when cooking)
├─ RightPanel
│  ├─ NPCList
│  └─ ShopCustomizer
└─ BottomBar
   ├─ ActionButtons
   └─ Shortcuts
```

---

## 6. NPC & AI System

**NPC Duelist Class**
```cpp
class ANPCDuelist
{
  FString NPCName;
  int32 DuelDifficulty;  // 1-10
  TArray<ACard*> DeckCards;  // Pre-built deck
  
  // AI
  ACard* ChooseCardToPlay();  // Simple AI decision
  int32 ChooseAttackTarget();
};
```

**AI Difficulty Levels**:
- Level 1: Random moves
- Level 5: Semi-strategic (blocks threats)
- Level 10: Full strategy (optimal plays)

---

## 7. Progression System

**Shop Level Progression**
```
Level 1 → 2:  Need 5000 coins + 10 wins
Level 2 → 3:  Need 15000 coins + 25 wins
Level 3 → 4:  Need 50000 coins + 50 wins
Level 4 → 5:  Need 100000 coins + 100 wins
...
```

**Unlock Features by Level**:
- Level 1: Basic shop, 1 table
- Level 2: 3 tables, new card shop
- Level 3: 5 tables, food vendor unlocked
- Level 4: 10 tables, cosmetics
- Level 5+: Unlimited customization

---

## 8. Implementation Roadmap

### Sprint 1: Project Setup (1 week)
- [x] Create GitHub repo
- [ ] UE5.8 project structure
- [ ] Basic C++ classes (Card, Shop)
- [ ] Project config files

### Sprint 2: Core Systems (2 weeks)
- [ ] Card system (buy/sell)
- [ ] Shop management
- [ ] Economy system
- [ ] Save/load system

### Sprint 3: Dueling (1 week)
- [ ] Duel manager
- [ ] Simple AI
- [ ] Duel UI
- [ ] Win/loss logic

### Sprint 4: Polish (1 week)
- [ ] UI refinement
- [ ] Sound effects
- [ ] Food system
- [ ] Bug fixes

---

## 9. Performance Targets

- FPS: 60 FPS (locked)
- Memory: < 2GB RAM
- Load Time: < 5 seconds
- Save Size: < 10MB per save

---

**Version**: 1.0 Draft
**Last Updated**: 2026-08-17
