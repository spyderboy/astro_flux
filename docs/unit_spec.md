# Unit Spec — Astro Flux

## Overview

Units exist in three tiers. Smaller units are fast but weak; larger units are slow
but powerful. Units can be combined freely — any mix of tiers — to create or
reinforce higher-tier units.

---

## Tier Constants

| Tier | Name   | Speed (px/s) | Power | Max Health | Point Value |
|------|--------|-------------|-------|------------|-------------|
| 1    | Mote   | 300         | 1     | 1          | 1           |
| 2    | Vector | 150         | 3     | 5          | 5           |
| 3    | Surge  | 60          | 9     | 25         | 25          |

Speed and power follow a 3:1 ratio per step.
Point value follows a 5:1 ratio per step (cost to create the next tier).

---

## Fusion (auto, no gesture required)

10 free Motes produced by a star auto-fuse into 1 Tier-1 Mote unit.
This is the baseline production loop and requires no player action.

---

## Combine (long-press gesture)

The player selects any group of units and long-presses (≥ 600 ms) to combine them.

### Point budget

Each unit contributes its point value to a shared pool:
- Tier 1 contributes 1 point
- Tier 2 contributes 5 points
- Tier 3 contributes 25 points

### Upgrade thresholds

| Total points in group | Result                        |
|----------------------|-------------------------------|
| ≥ 5, < 25            | 1 Tier-2 Vector (remainder lost) |
| ≥ 25                 | 1 Tier-3 Surge (remainder lost)  |
| < 5                  | No combine — gesture ignored  |

The result unit spawns at the centroid of the selected group.

### Reinforcement (adding units to an existing higher-tier)

If the selected group contains a Tier-2 or Tier-3 unit that has taken damage,
the remaining units in the group heal it first before contributing to upgrades:
- Each contributed point restores 1 health point up to the unit's max health.
- Once fully healed, surplus points upgrade the unit's tier if threshold is met.

This means a damaged Tier-3 Surge can be partially healed by adding Tier-1 or
Tier-2 units to it, making retreating to your production stars a viable strategy.

---

## Unit vs Unit Combat

When a moving unit enters the collision radius (32 px) of an enemy unit, both
units engage automatically. Combat is resolved each game tick (per second):

- Each unit deals its **power value** as damage to the other's currentHealth.
- Damage is applied simultaneously — both units can die in the same tick.
- When currentHealth reaches 0 the unit is **demolished** and removed from the map.
- The surviving unit (if any) retains its remaining health and continues moving.

### Example exchanges

| Attacker       | Defender       | Outcome                                      |
|----------------|----------------|----------------------------------------------|
| Tier-1 (pw 1)  | Tier-1 (hp 1)  | Both demolished in 1 tick                    |
| Tier-2 (pw 3)  | Tier-1 (hp 1)  | Tier-1 demolished in 1 tick; Tier-2 loses 1hp |
| 5× Tier-1      | Tier-3 (hp 25) | Tier-3 takes 5 dmg/tick; all Tier-1s demolished in 1 tick; Tier-3 survives at 20hp |
| Tier-3 (pw 9)  | Tier-2 (hp 5)  | Tier-2 demolished in 1 tick; Tier-3 loses 3hp |

A swarm of Tier-1s can attrition a Surge down before it reaches a star, but
they must be numerous enough to outlast the Surge's high power output.

### Collision radius

- Tier-1: 16 px
- Tier-2: 24 px
- Tier-3: 36 px

Units do not stop to fight — they continue moving toward their target while
combat ticks resolve. This means faster units pass through slower ones if they
survive, and positioning determines who intercepts whom.

---

## Movement

Lassoed units can be sent to any point on the map with a single tap:
- If the destination is empty space, units move to that position and idle.
- If the destination is an enemy or neutral star, units move to populate/siege it.
- If the destination is a friendly star, units move to reinforce and upgrade it.
- En route, units automatically engage any enemy units within collision radius
  (see Unit vs Unit Combat above).

---

## Stars

### Star properties

Each star has two fixed values set at map generation:

| Property     | Description                                              |
|--------------|----------------------------------------------------------|
| `maxTier`    | The highest tier this star can ever reach (1–4). Small stars max at 1; large stars at 4. |
| `currentTier`| Starts at 0 (uncaptured/neutral). Increases as power accumulates. |
| `accumulatedPower` | Power pool that fills as units arrive. Resets to 0 each time a tier threshold is crossed. |
| `owner`      | Player ID, enemy ID, or null (neutral).                  |

### Mote production

Owned stars (currentTier ≥ 1) produce motes each cycle (every 5 seconds):

| Star tier | Motes per cycle |
|-----------|----------------|
| 1         | 1              |
| 2         | 3              |
| 3         | 9              |
| 4         | 27             |

A star at tier 0 (uncaptured) produces nothing.

### Power thresholds (power needed to advance one tier)

| Transition  | Power required |
|-------------|----------------|
| Tier 0 → 1  | 10  (capture)  |
| Tier 1 → 2  | 30             |
| Tier 2 → 3  | 90             |
| Tier 3 → 4  | 270            |

Stars cannot exceed their `maxTier`. Power added beyond a star's max tier cap
is discarded.

---

## Populating a star

When a unit arrives at a star's capture radius (48 px) it is **consumed**
immediately — destroyed regardless of the outcome — and its power value is
added to the star's `accumulatedPower` pool.

### Neutral or enemy star (siege)

- Arriving unit's power is added to the siege pool.
- When the pool reaches the current tier threshold, `currentTier` advances by 1
  and the pool resets to 0.
- Tier 0 → 1 transition flips ownership to the attacking player.
- Tier 1+ transitions on an enemy star do not flip ownership — the attacker
  must first strip the star back to tier 0 by sieging it until ownership flips.

### Friendly star (reinforce / upgrade)

- Arriving unit's power is added to the growth pool.
- When the pool reaches the next tier threshold, `currentTier` advances by 1
  and the pool resets to 0.
- If the star is already at `maxTier`, all arriving power is discarded.
  The player should redirect units elsewhere.

### Strategic implications

- Sending a Tier-3 Surge (power 9) to a neutral star fills 90% of the capture
  threshold in one shot, but the Surge is gone.
- Drip-feeding Tier-1 Motes (power 1 each) to a star takes 10 units to capture
  but preserves your Surges for defense.
- A Tier-4 star requires 10 + 30 + 90 + 270 = 400 total power to fully develop,
  making large stars a long-term investment worth defending.

---

## Star capture resolution

There is no separate "attack succeeds / fails" check. Units simply arrive,
contribute their power, and are consumed. Capture happens organically as power
accumulates. This means:
- Trickle attacks work but are slow.
- Mass assaults are fast but expensive.
- An enemy can reinforce a star to outpace your siege if they respond quickly.

---

## Speed note

Units travel in world-space pixels per second. At 1.0× zoom, 300 px/s feels
brisk on a 3000×3000 map. Tier-3 Surges at 60 px/s cross the map in 50 seconds,
making positioning and timing meaningful decisions.
