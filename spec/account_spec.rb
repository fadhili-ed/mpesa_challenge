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
    it 'returns reduces balance on withdrawal' do
        agent_number = Account.agent_numbers.first        
        subject.deposit(1000)
        subject.withdraw(agent_number, 200, 1234 )        
        expect(subject.check_balance).to eq "Your current balance is 800"

    end
    it 'returns message on withdrawal' do
        agent_number = Account.agent_numbers.first
        pin = subject.pin
        subject.deposit(1000)     
        expect(subject.withdraw(agent_number, 200, pin)).to eq "Confirmed you withdrew 200, your new balance 800 at #{subject.current_time()}"
    end
    it  'returns error if agent number is invalid' do
        subject.deposit(1000) 
        expect(subject.withdraw(000, 200, 1234 )).to eq "invalid agent number try again"
    end
    it  'returns error if pin is invalid' do
        agent_number = Account.agent_numbers.first
        subject.deposit(1000) 
        expect(subject.withdraw(agent_number, 200, 12)).to eq "invalid pin number try again"
    end
    it 'returns error if current balance less than withdrawn amount' do
        agent_number = Account.agent_numbers.first
        pin = subject.pin
        balance = subject.balance
        expect(subject.withdraw(agent_number, 200, pin)).to eq "Insufficient balance,you cannot withdraw 200,your current balance is #{balance}"
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