require './lib/account'
describe Account do
    it 'confirmed initial balance is 0' do
        account1 = Account.new
        expect(account1.balance).to eq 0
    end
    it 'returns my current balance' do
        balance = subject.balance
        expect(subject.check_balance).to eq "Your current balance is #{balance}"
    end
end