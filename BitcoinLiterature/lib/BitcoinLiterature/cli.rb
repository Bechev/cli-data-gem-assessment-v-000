require_relative '../BitcoinLiterature'

class BitcoinLiterature::CLI

  def call
    make_a_search = true
    puts "Welcome to Gemini"
    while make_a_search == true
      BitcoinLiterature::Scrapper.new
      menu
      make_a_search = new_request?
    end
  end

  def menu
    puts "The documents available are:"
      BitcoinLiterature::Document.display_documents
    puts "What document do you want more info on?"
    input = get_user_input
    if input.to_i > 0 && input.to_i <= BitcoinLiterature::Document.all.size
      document = BitcoinLiterature::Document.all[input.to_i - 1]
      document.display_documents_info
    elsif input == "exit"
      return
    else
      puts "Selection unclear - please type the number of the pair you want to check or exit."
      menu
    end
  end

  def new_request?
    puts "Do you want to check another document? (Y/N)"
    user_input = get_user_input.downcase
    case user_input
    when "y"
      BitcoinLiterature::Document.reset
      true
    when "n"
      false
    else puts "selection_unclear - please type Y or N"
      new_request?
    end
  end

  def get_user_input
    gets.to_s.strip
  end

end