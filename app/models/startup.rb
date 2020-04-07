class Startup

    attr_reader :founder, :domain
    attr_accessor :name
    @@all = []

    def initialize(name, founder, domain)
        @name = name 
        @founder = founder 
        @domain = domain 
        @@all << self
    end

    def self.all 
        @@all
    end
    def pivot(name, domain)
        @name = name
        @domain = domain
    end
    def self.find_by_founder(founder_name)
        Startup.all.select{|s| s.founder == founder_name}
    end
    def self.domains
        Startup.all.map{|s| s.domain}
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end
    def num_funding_rounds
        FundingRound.all.select{|fr| fr.startup == self}.count
    end

    def total_funds
        total = 0
        FundingRound.all.select{|fr| fr.startup == self}
        .map{|fr| total += fr.investment}
        total
    end
    def investors 
        FundingRound.all.select{|fr| fr.startup == self}
        .map{|fr| fr.venture_capitalist}.uniq!
    end
    def big_investors
        FundingRound.all.select{|fr| fr.startup == self}
        .select{|fr| fr.venture_capitalist.total_worth >= 1000000000}
    end

end
