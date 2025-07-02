# Autimit OCPP Charging Station Research

Autimit Charge is a lightweight simulator build in Zig to model EV charging session,
const computation, and host profit sharing. It uses mocked session data based on
typical smart charger behavior and OCPP-inspired events.

## Project Documentation

The project uses a JSON file to simulate a charging session. This mock file represents a 2.5-hour charging event with the following properties:

```json
{
  "sessionId": "sess-001",
  "startedAt": "2025-05-31T14:00:00Z",
  "endedAt": "2025-05-31T16:30:00Z",
  "voltage": 220.0,
  "current": 16.0,
  "pricePerKwh": 1.25,
  "hostCommission": 0.3,
  "energyDelivered": 5.28
}
```

sessionId: Unique identifier for the session.

startedAt / endedAt: Timestamps defining the session duration.

voltage: Voltage (V) supplied during charging.

current: Current (A) drawn by the vehicle.

pricePerKwh: Price charged per kilowatt-hour.

hostCommission: Percentage of the revenue that goes to the charging station host.

energyDelivered: Total energy delivered in kWh (used for reporting).

## Running local

Make sure you have [Zig](https://ziglang.org/download/) installed (version 0.14.1 or later).

1. Clone the repository:

```bash
https://github.com/hirowf/ocpp-zig-poc
cd ocpp-zig-poc
```

2. Build the project:

```bash
zig build
```

3. Run the simulator:

```bash
./zig-out/bin/autimit_ocpp
```

---

## References

- [Open Charge Point Protocol (OCPP) - Wikipedia](https://en.wikipedia.org/wiki/Open_Charge_Point_Protocol)
