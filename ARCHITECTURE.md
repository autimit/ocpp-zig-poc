# System Architecture and Flow Description

## Purpose

This project explores the concept of a mock OCPP-based charging station and the full EV charging pipeline:

- Understand how the charger behaves (events flow)
- Study the OCPP protocol in practice
- Build our own CSMS (Charge Station Management System)
- Simulate the business model (charging, consumption, transfer to the host)

## Architecture Flow
```markdown
┌─────────────────────┐
│    Simulator OCPP   │  ← sends mocked events (JSON)
└────────┬────────────┘
         │
         ▼
┌─────────────────────┐
│    CSMS (Node.js)   │  ← interprets events and saves them to a file
└────────┬────────────┘
         │
         ▼
┌─────────────────────┐
│   Processor Zig     │  ← analyzes data and prints report
└─────────────────────┘
```
