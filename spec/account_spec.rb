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
    it 'reduces balance when money is sent' do
        subject.deposit(1000) 
        pin = subject.pin 
        subject.send(1234567890, 200, pin )
        expect(subject.balance).to eq 800

    end
    it 'send transaction details when money is sent' do
        subject.deposit(1000) 
        pin = subject.pin 
        expect(subject.send(1234567890, 200, pin )).to eq "Success you sent 200 to 1234567890 you current balance is 800 at #{subject.current_time}"
    end
    it 'return error if pin number is wrong when sending money' do
        expect(subject.send(1234567890, 200, 0000)).to eq 'invalid pin number try again' 
    end
    it "return errors if receiver phone number is invalid" do
        pin = subject.pin 
        expect(subject.send(12, 200, pin)).to eq 'receiver phone number is invalid'
        expect(subject.send("1234567890 ", 200, pin)).to eq 'receiver phone number is invalid'
    end

    it 'return error if balance is less than amount withdrawn' do
        pin = subject.pin     
        expect(subject.send(1234567890, 200, pin)).to eq "Insufficient balance,you cannot send 200,your current balance is 0"
    end

    it 'change the value of pin to be new pin' do
        pin = subject.pin 
        expect(subject.change_pin(pin, 8888)).to eq 'Pin successfully changed your new pin is 8888'
    end
    it 'returns error if new pin give is of bad format'  do
        pin = subject.pin 
        expect(subject.change_pin(pin, '')).to eq "pin must be numbers only" 
        expect(subject.change_pin(pin, 34)).to eq "pin must be 4 digits" 
        expect(subject.change_pin(pin, 340000)).to eq "pin must be numbers only and of 4 digits" 
    end
end