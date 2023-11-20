# frozen_string_literal: true

require_relative "conditional_organizer/version"
require 'interactor'

module Interactor
  module ConditionalOrganizer
    include Interactor::Organizer

    def call
      self.class.organized.each do |interactor|
        interactor[:class].call!(context) if interactor[:if] && send(interactor[:if])
      end
    end

    def self.included klass
      klass.class_eval do
        include Interactor::Organizer
      end
    end
  end
end
