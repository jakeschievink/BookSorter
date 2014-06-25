# encoding: utf-8
class Sorter

  def initialize(book)
    @book_name = book
    @book_contents = File.read(book, encoding: "UTF-8")
  end

  def process
    @book_contents = remove_things.downcase
    puts "removed special characters"
    sorted_books = sort_array(@book_contents.split)
    puts "put book in sorted hash"
    text_of_book = print_from_hash(sorted_books)
    puts "printed text" 
    save_file(text_of_book, @book_name)
    puts "Saved file"
  end

  def remove_things
    characters_to_remove = [",","(",")","/",".","?","!","[","]","*","Project Gutenberg-tm","'","\""]
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

  def save_file(text, filename)
    File.open("sorted#{filename}.txt", "w") {|contents|
      contents.write(text)
    } 
  end

end
