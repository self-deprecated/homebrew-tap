class Sd < Formula
  desc "Project task dispatcher for .sd/tasks.yaml manifests"
  homepage "https://github.com/self-deprecated/sd"
  url "https://github.com/self-deprecated/sd/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "6539c611a3be449be314252b3c86c2403dc9e0090eb959d675f29e74d754218a"
  license "MIT"
  head "https://github.com/self-deprecated/sd.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/self-deprecated/sd/internal/cli.Version=#{version}"
    system "go", "build", *std_go_args(ldflags:), "./cmd/sd"
    generate_completions_from_executable(bin/"sd", "completion")
  end

  test do
    assert_match "sd version #{version}", shell_output("#{bin}/sd --version")

    (testpath/".sd/tasks.yaml").write <<~YAML
      version: 1
      project: {id: demo, dir: .}
      tasks:
        hello: {run: printf hello}
    YAML
    assert_equal "hello", shell_output("#{bin}/sd hello")
  end
end
