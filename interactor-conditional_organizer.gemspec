# frozen_string_literal: true

require_relative "lib/interactor/conditional_organizer/version"

Gem::Specification.new do |spec|
  spec.name = "interactor-conditional_organizer"
  spec.version = Interactor::ConditionalOrganizer::VERSION
  spec.authors = ["Gamberi Elia"]
  spec.email = ["e.gamberi@engim.eu"]

  spec.summary = "Extension of the Interactor Gem, that allows for conditional organizer calls"
  spec.description = "This extension allows conditional calls for interactors that are organized in an interactor"
  spec.homepage = "https://gimbaro.dev"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://gimbaro.dev"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "interactor", "~> 3.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
