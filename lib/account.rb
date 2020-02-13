class Account 
    attr_accessor :balance  
    def initialize
        @balance = 0 
    end

    def check_balance 
        "Your current balance is #{@balance}"
    end
    def deposit (amount)
        @balance += amount       
        "Confirmed you deposited #{amount}, your new balance #{balance}
        at #{current_time()}"
    end 
    def current_time 
        @deposit_time  = Time.now.strftime('%d %b %Y %H:%M:%S')

    end
end