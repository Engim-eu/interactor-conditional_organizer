# frozen_string_literal: true

require 'interactor'

RSpec.describe Interactor::ConditionalOrganizer do
  it "has a version number" do
    expect(Interactor::ConditionalOrganizer::VERSION).not_to be nil
  end


  it 'allows to organize some interactors, and call them based on a condition' do

    CALLED_INTERACTOR = double('fake-interactor', call!: true)
    NOT_CALLED_INTERACTOR = double('fake-interactor', call!: true)

    class ExampleConditionalOrganizer
      include Interactor::ConditionalOrganizer

      def true_method
        true
      end

      def false_method
        false
      end

      organize [{ class: CALLED_INTERACTOR, if: :true_method },
                { class: NOT_CALLED_INTERACTOR, if: :false_method }]
    end

    expect(CALLED_INTERACTOR).to receive(:call!).exactly(1).times
    expect(NOT_CALLED_INTERACTOR).not_to receive(:call!)
    ExampleConditionalOrganizer.call
  end
end
