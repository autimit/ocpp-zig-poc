const std = @import("std");

const energy = @import("energy.zig");
const session = @import("session.zig");

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    const file = try std.fs.cwd().openFile("data/mock-session.json", .{});
    defer file.close();

    const file_size = try file.getEndPos();
    const buffer = try allocator.alloc(u8, file_size);
    defer allocator.free(buffer);

    _ = try file.readAll(buffer);

    const parsed = try session.parseSession(buffer);
    const power_kw = energy.computePowerKw(parsed.voltage, parsed.current);
    const energy_kwh = energy.computeEnergyKwh(power_kw, parsed.durationHours);
    const total_cost = energy.computeTotalCost(energy_kwh, parsed.pricePerKwh);

    const host_earnings = energy.computeHostEarnings(total_cost, parsed.hostCommission);

    std.debug.print("\n Energy delivered: {d:.2} kWh\n", .{energy_kwh});
    std.debug.print("\n Total cost: R$ {d:.2} kWh\n", .{total_cost});
    std.debug.print("\n Host earnings: R$ {d:.2}\n", .{host_earnings});
}
