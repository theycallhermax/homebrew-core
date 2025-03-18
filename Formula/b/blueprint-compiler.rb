class BlueprintCompiler < Formula
  desc "A markup language for GTK user interfaces"
  homepage "https://jwestman.pages.gitlab.gnome.org/blueprint-compiler/"
  url "https://gitlab.gnome.org/jwestman/blueprint-compiler/-/archive/v0.16.0/blueprint-compiler-v0.16.0.tar.gz"
  sha256 "01feb8263fe7a450b0a9fed0fd54cf88947aaf00f86cc7da345f8b39a0e7bd30"
  license "LGPL-3.0-or-later"

  head "https://gitlab.gnome.org/jwestman/blueprint-compiler", branch: "main", using: :git

  depends_on "meson" => [:build,:test]
  depends_on "ninja" => [:build,:test]
  depends_on "gtk4"
  depends_on "pygobject3"
  depends_on "python"

  on_macos do
    depends_on "pkgconf" => [:build,:test]
  end

  def install
    system "meson", "setup", "build", *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"
  end

  test do
    system "meson", "test", "-C", "build", "--print-errorlogs"
  end
end
