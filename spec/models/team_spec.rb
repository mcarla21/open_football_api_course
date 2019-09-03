# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Team, type: :model do
  describe '#validations' do
    context 'when team already exists' do
      let!(:team) { FactoryBot.create(:team, name: 'Real Madrid') }

      subject { Team.new(name: 'Real Madrid') }

      it 'should not be valid' do
        expect(subject).not_to be_valid
      end
    end

    context 'when team does not exist' do
      subject { Team.new(name: 'Real Madrid') }

      it 'should create the team' do
        expect(subject).to be_valid
      end
    end

    context 'when using fixtures' do
      fixtures :teams

      context 'when team already exists' do
        subject { Team.new(name: 'Real Madrid') }

        it 'should not be valid' do
          teams(:real)

          expect(subject).not_to be_valid
        end
      end

      # this will not work as the data is not erased when using fixtures
      context 'when team does not exist' do
        subject { Team.new(name: 'Real Madrid') }

        it 'should create the team' do
          expect(subject).to be_valid
        end
      end
    end
  end
end
