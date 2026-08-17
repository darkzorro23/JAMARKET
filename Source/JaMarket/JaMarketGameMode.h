// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include "CoreMinimal.h"
#include "GameFramework/GameModeBase.h"
#include "JaMarketGameMode.generated.h"

UCLASS()
class JAMARKET_API AJaMarketGameMode : public AGameModeBase
{
	GENERATED_BODY()


public:
	AJaMarketGameMode();

	virtual void BeginPlay() override;
};
