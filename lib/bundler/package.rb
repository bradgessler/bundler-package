# frozen_string_literal: true

require_relative "package/version"

module Bundler
  module Package
    def self.local
      Resolver.new.platform
    end

    class Error < StandardError; end

    class Resolver
      def platform
        case Gem::Platform.local.os
        when "darwin"
          MacOS.new
        when "linux"
          Linux.new
        end
      end
    end

    class Distribution
      def to_s
        "#{name} #{version}"
      end

      def id
        "#{name}-#{version}"
      end
    end

    class MacOS < Distribution
      def initialize
        @release = parse
      end

      def version
        Gem::Version.new @release["ProductVersion"]
      end

      def name
        @release["ProductName"]
      end

      private
        def parse
          Hash[
            %x[sw_vers]
              .lines
              .map { |line| line.split(/\:\t/).map(&:chomp) }
          ]
        end
    end

    class Linux < Distribution
      def initialize(path: "/etc/os-release")
        @os_release_path = path
        @release = parse
      end

      def name
        @release["ID"]
      end

      def version
        Gem::Version.new @release["VERSION_ID"]
      end

      private
        def parse
          Hash[
            File.read(@os_release_path)
              .lines
              .map { |line| line.split("=").map(&:chomp) }
          ]
        end
    end
  end
end
