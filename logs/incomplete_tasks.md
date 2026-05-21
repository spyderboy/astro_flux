# Incomplete Tasks — Recovery Plan
Generated after work run. 9 task(s) skipped because all 4 model tiers (`qwen2.5-coder:7b-instruct-q4_K_M` → `deepseek-coder-v2:16b` → `qwen2.5-coder:32b` → `deepseek-r1:32b`) produced the same error 1× each.

## Skipped Tasks
- [ ] **Task 4:** If total points >= 25: produce one Tier-3 Surge at the group centroid and consume all selected units
- [ ] **Task 5:** If the group contains a damaged higher-tier unit: spend incoming points to heal it first (1pt = 1hp) before applying upgrade threshold logic
- [ ] **Task 9:** For each colliding pair apply simultaneous damage: each unit's currentHealth -= the other unit's power value (Tier-1=1, Tier-2=3, Tier-3=9)
- [ ] **Task 10:** Remove any unit whose currentHealth reaches 0 or below from the game and play a demolish effect at its position
- [ ] **Task 11:** Units continue moving toward their target while combat ticks resolve — they do not stop to fight
- [ ] **Task 13:** Owned stars (currentTier >= 1) produce motes each cycle (every 5 seconds) at rate: tier-1=1, tier-2=3, tier-3=9, tier-4=27 motes per cycle
- [ ] **Task 14:** When a unit arrives within 48px of any star: consume the unit immediately and add its power value to the star's accumulatedPower pool
- [ ] **Task 16:** When a neutral or enemy star advances from tier 0 to tier 1: flip ownership to the arriving unit's owner
- [ ] **Task 17:** Show a visual pulse on the star each time a unit arrives and contributes power so the player sees progress accumulating

## How to Resume
1. Read the errors in `logs/errors.jsonl` for each skipped task index.
2. Identify the root cause (usually a missing file, wrong import, or API mismatch).
3. Apply a manual fix to unblock the task.
4. Resume from the first skipped task:
   ```bash
   python work.py --project /Users/joseantoniolicon/Code/astro_flux --start-at 4
   ```

## Common Fixes
- **undefined_class**: Find where the class is defined and add the import.
- **wrong API**: Check `.roorules` for the correct method name.
- **locked file conflict**: The task needs a file that is locked — consider unlocking it or pre-building the required change.

## Skipped Task Indices (for --start-at)
4, 5, 9, 10, 11, 13, 14, 16, 17
