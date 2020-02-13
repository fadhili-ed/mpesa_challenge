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
    it 'returns  increase balance on deposit' do
        subject.deposit(500)
        expect(subject.balance).to eq 500
    end
    it 'returns message on deposit' do      
        expect(subject.deposit(500)).to eq "Confirmed you deposited 500, your new balance 500
        at #{subject.current_time()}"
    end
end