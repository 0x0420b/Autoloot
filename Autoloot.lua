UnlockedInteract = function (...) return lb.Unlock(lb.ObjectInteract, ...) end
MoveForward = function () return lb.Unlock(MoveForwardStart) end
MoveForwStop = function () return lb.Unlock(MoveForwardStop) end

function LootFast()
    for i = GetNumLootItems(), 1, -1 do
        LootSlot(i)
        ConfirmLootSlot(i)
    end
    CloseLoot()
end

local function RetrieveLoot()
    local RetrieveDistance = 5
    for _, guid in ipairs(lb.GetObjects(RetrieveDistance, lb.EObjectTypes.Units)) do
        if lb.UnitIsLootable(guid) then
            return guid
        end
    end
end

local function Main()
    if lb then
        local aLoot = RetrieveLoot()
        if aLoot and not IsMounted() then
            UnlockedInteract(aLoot) 
        end
    end
    
    LootFast()
end

C_Timer.NewTicker(0.01, Main)