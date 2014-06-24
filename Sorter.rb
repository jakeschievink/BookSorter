class Sorter

    def initialize(book)
        @book_contents = File.read(book)
    end

    def reomove_things
        characters_to_remove = [",","(",")","/",".","?","!","[","]"."*"]
        removed_things = @book_contents.split.join(" ")
        characters_to_remove.map {|e| removed_things = removed_things.gsub(e, "")}
        removed_things
    end
    
    def sort_array(arr)
        words_and_occurences = {}
        arr.map {|e| 
            if words_and_occurences.has_key?(e)
                words_and_occurences[e] = words_and_occurences[e] + 1
            else
                words_and_occurences[e] = 1
            end
        }
        Hash[words_and_occurences.sort_by{|k, v| v}.reverse]

    end

    def print_from_hash(hash)
        alltext = "" 
        hash.map {|k, v| alltext += (k + " ")*v}
        alltext
    end

end
