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

    // computes the duration in hour beweend `startedAt` and `endedAt`
    pub fn durationHours(self: Session) f64 {
        const parse = std.time.timestamp();
        const start = parse(self.startedAt) catch return 0;
        const end = parse(self.endedAt) catch return 0;

        @as(f64, @floatFromInt(end.secs_since_epoch - start.secs_since_epoch)) / 3600.0;
    }
};

pub fn parseSession(json_bytes: []const u8) !Session {
    const json = std.json;
    const parsed = try json.parseFromSlice(Session, std.heap.page_allocator, json_bytes, .{});
    return parsed.value;
}
