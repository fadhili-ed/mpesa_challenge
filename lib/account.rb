class Account 
    attr_accessor :balance  
    def initialize
        @balance = 0 
    end

    def check_balance 
        "Your current balance is #{@balance}"
    end
end