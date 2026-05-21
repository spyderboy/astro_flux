# Fusion Logic Formulas

This document outlines the mathematical formulas used for the fusion of Motes into Vectors within Astro Flux.

## Constants

- $R_{m:v} = 10$
  The fixed ratio of Motes required to create one Vector.

## Calculations

### 1. Vector Availability

The number of Vectors that can be created from a given total number of Motes ($M_{total}$):

$$V_{available} = \lfloor \frac{M_{total}}{R_{m:v}} \rfloor$$

### 2. Fusion Capacity

The total number of Motes that will be consumed in a single fusion cycle ($M_{consumed}$), based on the number of Vectors being created ($V_{count}$):

$$M_{consumed} = V_{count} \times R_{m:v}$$

### 3. Remaining Motes

The number of Motes remaining in the pool after a fusion operation ($M_{remaining}$):

$$M_{remaining} = M_{total} - (V_{created} \times R_{m:v})$$

### 4. Fusion Eligibility

A fusion operation is valid if the count of active Motes ($M_{active}$) meets or exceeds the threshold:

$$M_{active} \ge R_{m:v}$$

## Implementation Reference

All logic is implemented in `lib/game/fusion_rules.dart` using the `FusionRules` class.