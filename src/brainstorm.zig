// brainstorm business model energy consumption calculation

// v1
// pub fn main() void {
//     const voltage: f64 = 220.0;
//     const current: f64 = 16.0;
//     const hours: f64 = 3.0;
//     const price_per_kwh: f64 = 1.25;
//     const host_commission: f64 = 0.3;

//     const power_kw = (voltage * current) / 1000.0;
//     const energy = power_kw * hours;
//     const total_cost = energy * price_per_kwh;
//     const host_earnings = total_cost * host_commission;

//     std.debug.print("energy consumption: {d:.2} kWh\n", .{energy});
//     std.debug.print("total cost: {d:.2}\n", .{total_cost});
//     std.debug.print("host gain: {d:.2}\n", .{host_earnings});
// }
