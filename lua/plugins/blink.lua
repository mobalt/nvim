return {
  -- Build the fuzzy-matcher library from source instead of downloading a
  -- prebuilt binary from GitHub on first load. Requires a Rust toolchain
  -- (blink.cmp pins its own via rust-toolchain.toml); the build runs once
  -- during :Lazy sync, so nvim never needs network access at runtime.
  { "saghen/blink.cmp", build = "cargo build --release" },
}
