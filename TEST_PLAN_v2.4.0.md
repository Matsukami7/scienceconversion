# Test Plan for Science Conversion v2.4.0

## Overview
Version 2.4.0 adds bidirectional conversion toggles (Enable Upgrades / Enable Downgrades). This test plan ensures all features work correctly.

## Pre-Testing Setup
1. Build the mod using `./build-mod.sh`
2. Launch Factorio with the mod enabled
3. Create a new test world or use an existing save
4. Access mod settings: Main Menu → Settings → Mod Settings → Startup tab

---

## Test Cases

### Test 1: Default Behavior (All Settings Enabled)
**Purpose**: Verify backward compatibility

**Settings:**
- Enable Upgrades: Yes (default)
- Enable Downgrades: Yes (default)
- All Tiers: Enabled (default)
- All other settings: Default values

**Expected Results:**
- ✅ All 18 conversion recipes should be available (9 tiers × 2 directions)
- ✅ All 9 technologies should be researchable
- ✅ Recipes should use default ratios (10, 20, 30, 50, 100 for upgrades)
- ✅ Both upgrade and downgrade recipes work in assemblers

**Test Steps:**
1. Research "Science Conversion Tier 1"
2. Verify both "red-to-green" and "green-to-red" recipes are unlocked
3. Craft both recipes manually or in assembler
4. Confirm ratios: 10 red → 1 green, 1 green → 1 red

---

### Test 2: Upgrades Only Mode
**Purpose**: Verify upgrade-only functionality

**Settings:**
- Enable Upgrades: Yes
- Enable Downgrades: No
- All Tiers: Enabled
- All other settings: Default

**Expected Results:**
- ✅ Only upgrade recipes visible (9 total)
- ✅ Downgrade recipes hidden (red-to-green, blue-to-green, etc.)
- ✅ Technologies still researchable but only unlock upgrade recipes
- ✅ Can convert red→green but NOT green→red

**Test Steps:**
1. Restart game after changing settings
2. Check recipe list - should only see upgrade recipes
3. Research Tier 1 technology
4. Verify only "red-to-green" is unlocked, not "green-to-red"
5. Attempt to craft downgrade recipe (should not be available)

---

### Test 3: Downgrades Only Mode
**Purpose**: Verify downgrade-only functionality

**Settings:**
- Enable Upgrades: No
- Enable Downgrades: Yes
- All Tiers: Enabled
- All other settings: Default

**Expected Results:**
- ✅ Only downgrade recipes visible (9 total)
- ✅ Upgrade recipes hidden (green-to-red, blue-to-green, etc.)
- ✅ Technologies still researchable but only unlock downgrade recipes
- ✅ Can convert green→red but NOT red→green

**Test Steps:**
1. Restart game after changing settings
2. Check recipe list - should only see downgrade recipes
3. Research Tier 1 technology
4. Verify only "green-to-red" is unlocked, not "red-to-green"
5. Attempt to craft upgrade recipe (should not be available)

---

### Test 4: Both Directions Disabled
**Purpose**: Verify complete disabling works

**Settings:**
- Enable Upgrades: No
- Enable Downgrades: No
- All Tiers: Enabled
- All other settings: Default

**Expected Results:**
- ✅ No conversion recipes available
- ✅ Technologies hidden or have no effects
- ✅ No recipes appear in assembler crafting menu

**Test Steps:**
1. Restart game after changing settings
2. Check technology tree - conversion techs should be hidden
3. Check recipe list - no conversion recipes visible
4. Verify assemblers cannot craft any conversion recipes

---

### Test 5: Combination with Tier Toggles
**Purpose**: Verify bidirectional toggles work with tier-specific toggles

**Settings:**
- Enable Upgrades: Yes
- Enable Downgrades: No
- Tier 1: Enabled
- Tier 2: Disabled
- Tiers 3-9: Enabled
- All other settings: Default

**Expected Results:**
- ✅ Tier 1 upgrades available (red-to-green)
- ✅ Tier 1 downgrades hidden (green-to-red)
- ✅ Tier 2 completely hidden (both directions)
- ✅ Tiers 3-9 upgrades available
- ✅ Tiers 3-9 downgrades hidden

**Test Steps:**
1. Restart game after changing settings
2. Research Tier 1 - only "red-to-green" unlocked
3. Verify Tier 2 technology is hidden
4. Research Tier 3 - only "blue-to-purple" unlocked
5. Confirm no downgrade recipes available for any tier

---

### Test 6: Custom Ratios with Bidirectional Toggles
**Purpose**: Verify settings interact correctly

**Settings:**
- Enable Upgrades: Yes
- Enable Downgrades: Yes
- Base Upgrade Ratio: 20
- Base Downgrade Ratio: 2
- Linear Scaling: Disabled
- All Tiers: Enabled

**Expected Results:**
- ✅ All upgrade recipes require 20 input (uniform)
- ✅ All downgrade recipes require 2 input
- ✅ Both directions work correctly with custom ratios

**Test Steps:**
1. Restart game after changing settings
2. Check "red-to-green" recipe: should require 20 red science
3. Check "green-to-red" recipe: should require 2 green science
4. Verify all tiers use same ratios (20 for upgrades, 2 for downgrades)

---

### Test 7: Linear Scaling with Upgrades Only
**Purpose**: Verify linear scaling works with directional toggles

**Settings:**
- Enable Upgrades: Yes
- Enable Downgrades: No
- Linear Scaling: Enabled
- Base Upgrade Ratio: 10
- All Tiers: Enabled

**Expected Results:**
- ✅ Upgrade recipes use linear scaling (10, 20, 30, 50, 100)
- ✅ No downgrade recipes available
- ✅ Linear scaling only affects visible upgrade recipes

**Test Steps:**
1. Restart game after changing settings
2. Verify "red-to-green": 10 red → 1 green
3. Verify "green-to-blue": 20 green → 1 blue
4. Verify "blue-to-purple": 30 blue → 1 purple
5. Verify "purple-to-yellow": 50 purple → 1 yellow
6. Confirm no downgrade recipes exist

---

### Test 8: Product Multiplier with Bidirectional Toggles
**Purpose**: Verify product multiplier affects both directions

**Settings:**
- Enable Upgrades: Yes
- Enable Downgrades: Yes
- Product Multiplier: 5
- All Tiers: Enabled
- All other settings: Default

**Expected Results:**
- ✅ All recipes produce 5 output instead of 1
- ✅ Both upgrades and downgrades produce 5 output
- ✅ Input amounts unchanged

**Test Steps:**
1. Restart game after changing settings
2. Check "red-to-green": 10 red → 5 green
3. Check "green-to-red": 1 green → 5 red
4. Verify all recipes produce 5 output

---

### Test 9: Technology Visibility
**Purpose**: Verify technologies hide correctly when no recipes remain

**Settings:**
- Enable Upgrades: No
- Enable Downgrades: No
- Tier 1: Enabled (but both directions disabled)

**Expected Results:**
- ✅ Tier 1 technology hidden (no recipes to unlock)
- ✅ Other tier technologies behave according to settings

**Test Steps:**
1. Restart game after changing settings
2. Open technology tree
3. Verify "Science Conversion Tier 1" is hidden
4. Verify no conversion recipes available

---

### Test 10: Mid-Game Settings Change
**Purpose**: Verify settings can be changed on existing saves

**Settings:**
Start with defaults, then change to upgrades only

**Expected Results:**
- ✅ Existing conversion buildings update to new recipes
- ✅ Previously available downgrade recipes become unavailable
- ✅ No crashes or errors

**Test Steps:**
1. Start with default settings
2. Build assemblers with both upgrade and downgrade recipes
3. Save game
4. Exit to main menu
5. Change to "Enable Downgrades: No"
6. Restart game and load save
7. Verify downgrade recipes no longer available in assemblers
8. Verify upgrade recipes still work

---

## Regression Testing

### Verify Previous Features Still Work:
- ✅ Linear scaling toggle (v2.2.0)
- ✅ Base upgrade/downgrade ratios (v2.2.0)
- ✅ Product multiplier (v2.2.0)
- ✅ Conversion time (v2.2.0)
- ✅ Tier-specific toggles (v2.3.0)

---

## Performance Testing

### Test 11: Large Factory Performance
**Purpose**: Verify no performance degradation

**Test Steps:**
1. Create large factory with 100+ assemblers doing conversions
2. Monitor UPS (updates per second)
3. Verify no lag or performance issues
4. Compare with v2.3.0 performance

**Expected Results:**
- ✅ No UPS drops
- ✅ No memory leaks
- ✅ Smooth gameplay

---

## Edge Cases

### Test 12: Invalid Setting Combinations
**Purpose**: Verify mod handles edge cases gracefully

**Test Cases:**
1. All tiers disabled + both directions disabled
   - Expected: No conversion content visible
2. Linear scaling with base ratio = 1
   - Expected: All upgrades cost 1, 2, 3, 5, 10
3. Product multiplier = 100
   - Expected: Massive output, no crashes

---

## Locale Testing

### Test 13: Setting Descriptions
**Purpose**: Verify all settings have proper names and descriptions

**Test Steps:**
1. Open mod settings
2. Verify all setting names are readable
3. Hover over settings to see descriptions
4. Verify descriptions are clear and helpful

**Expected Results:**
- ✅ "Enable Upgrade Conversions" has clear name
- ✅ "Enable Downgrade Conversions" has clear name
- ✅ Descriptions explain what each setting does
- ✅ No missing translations or placeholder text

---

## Build Script Testing

### Test 14: Build Script Version Update
**Purpose**: Verify build script uses correct version

**Test Steps:**
1. Check `build-mod.sh` line 7
2. Verify `MOD_VERSION="2.4.0"`
3. Run `./build-mod.sh`
4. Verify zip file created: `ScienceConversion_2.4.0.zip`
5. Extract and verify `info.json` shows version 2.4.0

**Expected Results:**
- ✅ Build script has correct version
- ✅ Zip file created successfully
- ✅ Mod loads in Factorio without errors

---

## Documentation Testing

### Test 15: Documentation Accuracy
**Purpose**: Verify all documentation matches implementation

**Files to Check:**
- ✅ README.md mentions v2.4.0 and bidirectional toggles
- ✅ SETTINGS_GUIDE.md has sections for new settings
- ✅ changelog.txt has v2.4.0 entry
- ✅ FUTURE_SETTINGS_IDEAS.md marks feature as complete

---

## Sign-Off Checklist

Before releasing v2.4.0:
- [ ] All test cases pass
- [ ] No Lua errors in Factorio log
- [ ] Build script creates valid zip
- [ ] Documentation is complete and accurate
- [ ] Backward compatibility verified
- [ ] Performance is acceptable
- [ ] Settings descriptions are clear
- [ ] No crashes or game-breaking bugs

---

## Known Issues / Notes
- None currently identified

---

## Test Results Summary
**Tester**: _____________  
**Date**: _____________  
**Factorio Version**: _____________  
**Mod Version**: 2.4.0  

**Overall Result**: ⬜ PASS / ⬜ FAIL  

**Notes**:
