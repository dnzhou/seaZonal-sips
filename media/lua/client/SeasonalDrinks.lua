local base_perform = ISEatFoodAction.perform

local function isBeverage(item)
    local temperature = item:getHeat()
    if string.find(tostring(item:getFoodType()), "SoftDrink") then
        getPlayer():SayShout(string.format("yummy softdrink! this is %.2f degrees!", temperature))
        return true
    end
    return false
end
-- Overriding this function to extend vanilla behaviour when consuming food
function ISEatFoodAction:perform()    
    base_perform(self)   
    -- Constant definitions (copied from ErosionSeason class because no way to expose class fields)
	local SEASON_AUTUMN	= 4
    local SEASON_DEFAULT = 0
    local SEASON_SPRING	= 1
    local SEASON_SUMMER	= 2
    local SEASON_SUMMER2 = 3
    local SEASON_WINTER	= 5

    -- DEBUG: Sets the value of season
    -- getErosion():getSeasons():setCurSeason(SEASON_WINTER)
    if isBeverage(self.item) == true then
        print(string.format("Drink is %.2f degrees", temperature))
    end
    -- Player shouts the current season in game
    -- local currentSeason = getErosion():getSeasons():getSeason()
    -- if currentSeason == SEASON_SUMMER then
	--     getPlayer():SayShout("it is summer")
    -- elseif currentSeason == SEASON_WINTER then
	--     getPlayer():SayShout("it is winter")
    -- elseif currentSeason == SEASON_AUTUMN then
	--     getPlayer():SayShout("it is autumn")
    -- elseif currentSeason == SEASON_SPRING then
	--     getPlayer():SayShout("it is spring")
    -- end
end

