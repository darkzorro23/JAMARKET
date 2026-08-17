# JaMarket Development Tutorial

## Getting Started with Unreal Engine 5.8

### Step 1: Project Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/darkzorro23/JAMARKET.git
   cd JAMARKET
   ```

2. **Generate UE5 project files**
   - Right-click `JAMARKET.uproject`
   - Select "Generate Visual Studio project files"
   - If not available, use cmd:
     ```bash
     .\\GenerateProjectFiles.bat
     ```

3. **Open in Visual Studio**
   - Open `JAMARKET.sln`
   - Build solution (Ctrl+Shift+B)
   - Wait for compilation

4. **Open in Unreal Engine**
   - Double-click `JAMARKET.uproject`
   - Unreal Engine 5.8 will launch
   - Wait for shader compilation (first time: 5-10 min)

---

### Step 2: Project Structure

**Where to put your code:**

```
Source/JaMarket/
├── Core/              ← Core game logic
│   ├── Card/          ← Card system classes
│   ├── Shop/          ← Shop system
│   ├── Duel/          ← Dueling system
│   └── Economy/       ← Currency & progression
├── UI/                ← User interface code
├── Gameplay/          ← Game mechanics
└── Data/              ← Data structures
```

---

### Step 3: Creating Your First C++ Class

#### 3.1 Create a Card Class

1. **In UE5 Editor**:
   - File → New C++ Class
   - Choose "Actor" as parent
   - Name it: `Card`
   - Location: `Source/JaMarket/Core/Card/`

2. **Edit Card.h**:
   ```cpp
   #pragma once
   
   #include "CoreMinimal.h"
   #include "GameFramework/Actor.h"
   #include "Card.generated.h"
   
   UENUM(BlueprintType)
   enum class ECardType : uint8
   {
       Monster = 0,
       Spell = 1,
       Trap = 2
   };
   
   UENUM(BlueprintType)
   enum class ECardRarity : uint8
   {
       Common = 0,
       Uncommon = 1,
       Rare = 2,
       SuperRare = 3,
       UltraRare = 4
   };
   
   UCLASS()
   class JAMARKET_API ACard : public AActor
   {
       GENERATED_BODY()
   
   public:
       ACard();
       
       UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Card")
       FString CardName;
       
       UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Card")
       ECardType CardType = ECardType::Monster;
       
       UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Card")
       ECardRarity Rarity = ECardRarity::Common;
       
       UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Combat")
       int32 AttackPower = 0;
       
       UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Combat")
       int32 DefensePower = 0;
       
       UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Economy")
       int32 BuyPrice = 100;
       
       UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Economy")
       int32 SellValue = 50;
   };
   ```

3. **Edit Card.cpp**:
   ```cpp
   #include "Card.h"
   
   ACard::ACard()
   {
       PrimaryActorTick.bCanEverTick = false;
   }
   ```

4. **Compile & Refresh**:
   - Visual Studio: Build solution
   - UE5: Click "Refresh" in Blueprints browser

---

#### 3.2 Create a Shop Class

1. **Create new C++ class**:
   - File → New C++ Class
   - Parent: "Character"
   - Name: `ShopManager`
   - Location: `Source/JaMarket/Core/Shop/`

2. **Edit ShopManager.h**:
   ```cpp
   #pragma once
   
   #include "CoreMinimal.h"
   #include "GameFramework/Character.h"
   #include "Core/Card/Card.h"
   #include "ShopManager.generated.h"
   
   UCLASS()
   class JAMARKET_API AShopManager : public ACharacter
   {
       GENERATED_BODY()
   
   public:
       AShopManager();
       
       virtual void BeginPlay() override;
       
       // Shop Properties
       UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Shop")
       int32 ShopLevel = 1;
       
       UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Shop")
       int32 MoneyInRegister = 1000;
       
       UPROPERTY(EditAnywhere, BlueprintReadWrite, Category = "Shop")
       int32 NumDuelTables = 1;
       
       // Card Inventory: Card ID → Quantity
       UPROPERTY(BlueprintReadWrite, Category = "Inventory")
       TMap<int32, int32> CardInventory;
       
       // Functions
       UFUNCTION(BlueprintCallable, Category = "Shop")
       void BuyCard(ACard* Card);
       
       UFUNCTION(BlueprintCallable, Category = "Shop")
       void SellCard(ACard* Card);
       
       UFUNCTION(BlueprintCallable, Category = "Shop")
       void UpgradeShop();
   };
   ```

3. **Edit ShopManager.cpp**:
   ```cpp
   #include "ShopManager.h"
   
   AShopManager::AShopManager()
   {
       PrimaryActorTick.bCanEverTick = false;
   }
   
   void AShopManager::BeginPlay()
   {
       Super::BeginPlay();
       
       UE_LOG(LogTemp, Warning, TEXT("Shop initialized! Level: %d, Money: %d"), ShopLevel, MoneyInRegister);
   }
   
   void AShopManager::BuyCard(ACard* Card)
   {
       if (!Card) return;
       
       if (MoneyInRegister >= Card->BuyPrice)
       {
           MoneyInRegister -= Card->BuyPrice;
           CardInventory[Card->CardID]++;
           UE_LOG(LogTemp, Warning, TEXT("Bought card: %s"), *Card->CardName);
       }
   }
   
   void AShopManager::SellCard(ACard* Card)
   {
       if (!Card || CardInventory[Card->CardID] <= 0) return;
       
       MoneyInRegister += Card->SellValue;
       CardInventory[Card->CardID]--;
       UE_LOG(LogTemp, Warning, TEXT("Sold card: %s"), *Card->CardName);
   }
   
   void AShopManager::UpgradeShop()
   {
       int32 UpgradeCost = ShopLevel * 5000;
       
       if (MoneyInRegister >= UpgradeCost)
       {
           MoneyInRegister -= UpgradeCost;
           ShopLevel++;
           NumDuelTables = ShopLevel * 2;
           UE_LOG(LogTemp, Warning, TEXT("Shop upgraded to level: %d"), ShopLevel);
       }
   }
   ```

4. **Compile**

---

### Step 4: Creating Blueprints from C++ Classes

1. **In Content Browser**:
   - Right-click → Blueprint Class
   - Choose "Card" as parent
   - Name: `BP_CardBasic`
   - Open & customize

2. **Set Card Details**:
   - Card Name: "Fire Dragon"
   - Card Type: Monster
   - Rarity: Rare
   - Attack Power: 2500
   - Defense Power: 2000
   - Buy Price: 500
   - Sell Value: 250

3. **Save & compile**

---

### Step 5: Creating UI (Blueprint)

1. **Create Main Menu Widget**:
   - Right-click Content → User Interface → Widget Blueprint
   - Name: `WBP_MainMenu`

2. **Add UI Elements**:
   - Canvas Panel (root)
   - Vertical Box
     - Button: "New Game"
     - Button: "Continue"
     - Button: "Settings"

3. **Add Click Events**:
   - Select "New Game" button
   - Details → On Clicked → Create event
   - Add: `Open Level (JaMarket_GameLevel)`

---

### Step 6: Testing Your Code

1. **In Editor**:
   - Place a ShopManager actor in the level
   - Place a Card actor
   - Press Play
   - Check Output Log for messages

2. **Debug**:
   - Use `UE_LOG()` statements
   - Watch Output Log
   - Use Blueprints debugger

---

## Common UE5 Tips

### Compiling
```
Ctrl+Shift+B (Visual Studio)  = Compile project
Recompile in UE5              = Recompile UE5 code
```

### Debugging
```cpp
// Print message
UE_LOG(LogTemp, Warning, TEXT("Message: %d"), MyVariable);

// Print to screen (temporary)
if (GEngine) GEngine->AddOnScreenDebugMessage(-1, 15.0f, FColor::Yellow, TEXT("Debug Message"));
```

### Blueprint vs. C++
- **C++**: Performance-critical, complex logic
- **Blueprints**: UI, quick prototyping, visual logic
- **Hybrid**: Use both! C++ for systems, Blueprints for gameplay

---

## Next Steps

1. ✅ Read `GameDesign.md` for game features
2. ✅ Read `SystemDesign.md` for architecture
3. ✅ Create Card & Shop classes (follow above)
4. ✅ Create test Blueprints
5. ✅ Build a simple level with UI
6. ✅ Test buy/sell functionality
7. ✅ Add duel system
8. ✅ Add food system
9. ✅ Polish and optimize

---

**Questions?** Check:
- Unreal Engine docs: https://docs.unrealengine.com/
- UE5 official tutorials on YouTube
- This repo's GitHub Issues

---

**Version**: 1.0
**Last Updated**: 2026-08-17
