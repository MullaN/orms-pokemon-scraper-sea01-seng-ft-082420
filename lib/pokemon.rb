class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(args)
        args.each {|key, value| self.send("#{key}=", value)}
    end

    def self.save(name, type, db)
        sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ?"
        pokemon_row = db.execute(sql, id).first
        self.new(id: pokemon_row[0], name: pokemon_row[1], type: pokemon_row[2], db: db)
    end
end
