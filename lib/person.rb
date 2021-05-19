class Person
    @@all = []

    def self.all
        @@all
    end

    def self.all_money
        @@all.reduce(0) {|sum, num| sum + num.money}
    end

    attr_reader :name
    attr_accessor :bank_account

    def initialize(name)
        @name = name
        @bank_account = 25
        @happiness = 8
        @hygiene = 8
        @@all << self
    end

    def happiness=(value)
        @happiness = value.clamp(0,10)
    end

    def happiness
        @happiness
    end

    def hygiene=(value)
        @hygiene = value.clamp(0,10)
    end

    def hygiene
        @hygiene
    end

    def say_name
        "My name is #{self.name}"
    end

    def clean?
        @hygiene > 7
    end

    def happy?
        @happiness > 7
    end

    def get_paid(salary)
        @bank_account += salary
        "all about the benjamins"
    end

    def take_bath
        self.hygiene=(@hygiene + 4)
        "♪ Rub-a-dub just relaxing in the tub ♫"
    end

    def work_out
        self.happiness=(@happiness + 2)
        self.hygiene=(@hygiene - 3)
        "♪ another one bites the dust ♫"
    end

    def call_friend(person)
        self.happiness=(@happiness + 3)
        person.happiness=(person.happiness + 3)
        "Hi #{person.name}! It's #{@name}. How are you?"
    end

    def start_conversation(person, topic)
       case topic
        when "politics"
            self.happiness=(@happiness - 2)
            person.happiness=(person.happiness - 2)
            "blah blah partisan blah lobbyist"
        when "weather"
            self.happiness=(@happiness + 1)
            person.happiness=(person.happiness + 1)
            "blah blah sun blah rain"
        else
            "blah blah blah blah blah"
        end
    end
end

p1 = Person.new("Stella")
p1.happiness = 15
p1.hygiene = -5
puts p1.happiness
puts p1.hygiene