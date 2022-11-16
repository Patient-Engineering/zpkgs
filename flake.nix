{
  description = "nixpkgs-less, Zig-based packages";

  outputs = { self, }: let
    version = "0.11.0-dev.174+d823680e1";
    system = "linux-x86_64";
    zig-boot = builtins.fetchTarball {
      url = "https://ziglang.org/builds/zig-${system}-${version}.tar.xz";
      sha256 = "1539xay1fkif0fgjbakxb4cwi8pbsanwhzbiv299kmlllr91cs3f";
    };
  in {
    packages.x86_64-linux = {
      mrsh-boot = derivation {
        name = "mrsh-boot";
        src = builtins.fetchGit {
          url = "https://github.com/emersion/mrsh.git";
          ref = "master";
          rev = "a858396b79ba217760b0982dd6f45c91c5192c3b";
        };

        builder = "${zig-boot}/zig";
        args = [
          "build"
          "-Dtarget=x86_64-linux-musl"
          "--cache-dir" "/build/cache"
          "--build-file" "${self}/mrsh/build.zig"
        ];
        system = "x86_64-linux";
        HOME="/build";
        zig = zig-boot;
      };
    };
  };
}
