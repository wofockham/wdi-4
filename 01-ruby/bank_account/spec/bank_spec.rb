require_relative 'spec_helper'
require_relative '../bank'

describe Bank do
  let(:bank) { Bank.new('TD Bank') }

  describe '.new' do
    it 'should create a Bank object' do
      expect(bank).to_not eq nil
    end

    it 'should have a name' do
      expect(bank.name).to eq 'TD Bank'
    end

    it 'should have no accounts' do
      expect(bank.accounts.length).to eq 0
    end
  end

  describe '#create_account' do
    it 'should create an account' do
      bank.create_account('Zippy', 200)
      expect(bank.accounts['Zippy']).to eq 200
    end
  end

  describe '#deposit' do
    it 'should deposit money into a named account' do
      bank.create_account('Zippy', 200)
      bank.deposit('Zippy', 300)
      expect(bank.accounts['Zippy']).to eq 500
    end
  end

  describe '#balance' do
    it 'should return the balance for the client' do
      bank.create_account('Zippy', 200)
      expect(bank.balance('Zippy')).to eq 200
    end
  end

  describe '#withdraw' do
    it 'should subtract money from a named account' do
      bank.create_account('Zippy', 200)
      bank.withdraw('Zippy', 50)
      expect(bank.balance('Zippy')).to eq (200 - 50)
    end

    it "should not allow withdrawals that exceed the balance" do
      bank.create_account('Zippy', 200)
      bank.withdraw('Zippy', 1_000_000_000)
      expect(bank.balance('Zippy')).to eq 200
    end
  end

end
