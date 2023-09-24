class Gorush < Formula
  desc "A push notification server written in Go (Golang)."
  homepage "https://github.com/tolki-app/gorush"
  head "https://github.com/tolki-app/gorush.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    gorushpath = buildpath/"src/github.com/tolki-app/gorush"
    gorushpath.install buildpath.children
    cd gorushpath do
      system "go", "build", "-o", bin/"gorush"
      prefix.install_metafiles
    end
  end
end
