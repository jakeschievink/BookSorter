class Sorter
    def initialize(book)
        @book_contents = File.read(book)
        @characters_to_remove = [",","(",")","/",".","?","!","[","]"."*"]
        @words_and_occurences = {}

    end

    def reomove_things
        removed_things = @book_contents.split.join(" ")
        @characters_to_remove.map {|e| removed_things = removed_things.gsub(e, "")}
    end
    
    def

end
