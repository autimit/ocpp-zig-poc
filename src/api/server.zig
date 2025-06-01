const std = @import("std");

const root = @import("../root.zig");
const energy = root.energy;

pub fn startServer() !void {
    const address = try std.net.Address.parseIp("0.0.0.0", 8080);

    var listener = try address.listen(.{});
    std.debug.print("listening on http://0.0.0.0:8080\n", .{});

    while (true) {
        var conn = try listener.accept();

        var buffer: [1024]u8 = undefined;
        const bytes_read = try conn.stream.reader().read(&buffer);

        const request_line = buffer[0..bytes_read];
        std.debug.print("request: \n{s}\n", .{request_line});

        const response =
            \\HTTP/1.1 200 OK\r\n
            \\Content-Type: text/plain\r\n
            \\Content-Length: 14\r\n
            \\Connection: close\r\n
            \\r\n
            \\autimit server is alive
        ;

        _ = try conn.stream.writer().writeAll(response);
        conn.stream.close();
    }
}
