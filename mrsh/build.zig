const std = @import("std");
const Builder = std.build.Builder;

pub fn build(b: *Builder) !void {
    const target = b.standardTargetOptions(.{});
    const mode = b.standardReleaseOptions();

    const src = std.os.getenvZ("src") orelse unreachable;
    const out = std.os.getenvZ("out") orelse unreachable;

    // ugly hack
    b.exe_dir = out;

    const exe = b.addExecutable("mrsh", null);
    exe.addIncludePath(try std.fmt.allocPrint(b.allocator, "{s}/include", .{src}));

    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/main.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/arithm.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/array.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/ast.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/ast_print.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/buffer.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/getopt.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/hashtable.c", .{src}), &[_][]const u8 {});

    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/shell/arithm.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/shell/entry.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/shell/shell.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/shell/word.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/shell/trap.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/shell/redir.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/shell/process.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/shell/path.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/shell/job.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/frontend/basic.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/parser/arithm.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/parser/parser.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/parser/program.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/parser/word.c", .{src}), &[_][]const u8 {});

    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/builtin/builtin.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/builtin/wait.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/builtin/unspecified.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/builtin/unset.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/builtin/unalias.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/builtin/umask.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/builtin/ulimit.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/builtin/type.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/builtin/true.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/builtin/trap.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/builtin/times.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/builtin/shift.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/builtin/set.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/builtin/return.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/builtin/read.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/builtin/pwd.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/builtin/jobs.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/builtin/hash.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/builtin/getopts.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/builtin/fg.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/builtin/false.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/builtin/export.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/builtin/exit.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/builtin/exec.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/builtin/eval.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/builtin/dot.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/builtin/command.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/builtin/colon.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/builtin/cd.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/builtin/break.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/builtin/bg.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/builtin/alias.c", .{src}), &[_][]const u8 {});

    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/shell/task/pipeline.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/shell/task/task.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/shell/task/word.c", .{src}), &[_][]const u8 {});
    exe.addCSourceFile(try std.fmt.allocPrint(b.allocator, "{s}/shell/task/simple_command.c", .{src}), &[_][]const u8 {});

    exe.setTarget(target);
    exe.linkLibC();
    exe.setBuildMode(mode);
    exe.install();
}
