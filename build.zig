const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "usign",
        .root_source_file = null,
        .target = target,
        .optimize = optimize,
    });

    exe.linkLibC();
    exe.addCSourceFiles(usign_src, &.{
        "-Wall",
        "-Werror",
        "--std=gnu99",
        "-Wmissing-declarations",
    });

    exe.install();
}

const usign_src = &.{
    "base64.c",
    "ed25519.c",
    "edsign.c",
    "f25519.c",
    "fprime.c",
    "main.c",
    "sha512.c",
};
