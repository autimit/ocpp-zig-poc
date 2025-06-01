const std = @import("std");

// computes the electrical power in kilowatts (kW)
// formula: power (kW) = voltage (V) x current (A) / 1000

pub fn computePowerKw(voltage: f64, current: f64) f64 {
    return (voltage * current) / 1000.0;
}

// computes the energy consumption in kilowatt-hours (kWh)
pub fn computeEnergyKwh(power_kw: f64, hours: f64) f64 {
    return power_kw * hours;
}

// computes the total cost of the energy used
// formula: cost = energy (kWh) x price per kWh
pub fn computeTotalCost(energy_kwh: f64, price_per_kwh: f64) f64 {
    return energy_kwh * price_per_kwh;
}

// computes the earnings for the host based on a commission percentage
// formular: earnings = total cost x commission (e.g., 0.3 for 30%)
pub fn computeHostEarnings(total_cost: f64, commission: f64) f64 {
    return total_cost * commission;
}
