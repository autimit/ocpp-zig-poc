const std = @import("std");

// represents a simulated EV charging session parsed from JSON data
pub const Session = struct {
    sessionId: []const u8,
    startedAt: []const u8,
    endedAt: []const u8,
    voltage: f64,
    current: f64,
    pricePerKwh: f64,
    hostCommission: f64,
    energyDelivered: f64,
    durationHours: f64,
};

pub fn parseSession(json_bytes: []const u8) !Session {
    const json = std.json;
    const parsed = try json.parseFromSlice(Session, std.heap.page_allocator, json_bytes, .{});
    return parsed.value;
}
