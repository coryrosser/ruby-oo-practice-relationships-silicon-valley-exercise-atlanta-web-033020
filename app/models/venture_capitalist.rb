class VentureCapitalist

    attr_reader :name 
    attr_accessor :total_worth

    @@all = []

    def initialize(name, total_worth = 0)
        @name = name 
        @total_worth = total_worth
        @@all << self
    end

    def self.all 
        @@all
    end

    def self.tres_commas_club 
        VentureCapitalist.all.select{|vc| vc.total_worth >= 1000000000}
    end
    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end
    def funding_rounds 
        FundingRound.all.select{|fr| fr.venture_capitalist == self}
    end
    def portfolio 
        funding_rounds.map{|fr| fr.startup}.uniq!
    end
    def biggest_investment 
        funding_rounds.max_by{|fr| fr.investment}
    end
    def invested(domain)
        total = 0
        FundingRound.all.select{|fr| fr.startup.domain == domain}
        .map{|fr| total+= fr.investment}
    end

end
