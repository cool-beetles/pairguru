class TitleBracketsValidator < ActiveModel::Validator
  def validate(record)
    brackets = [ ["{", "}"], ["(", ")"], ["[", "]"] ]
    
    brackets.each do |open_bracket, closed_bracket| 
      words = record.title.split
      if (words.include?("{}") || words.include?("()") || words.include?("[]"))
        record.errors.add(:title, 'has empty brackets') 
      end

      letters = record.title.split("")
      if letters.include?(open_bracket) && letters.include?(closed_bracket)
        has_both_brackets = true
      end

      if (letters.include?(open_bracket) || letters.include?(closed_bracket)) && has_both_brackets == false
        record.errors.add(:title, 'has unclosed brackets')
      end

      if letters.count(open_bracket) != letters.count(closed_bracket)
        record.errors.add(:title, 'has too much open or closed brackets')
      end
      
      if has_both_brackets == true && letters.index(open_bracket) > letters.index(closed_bracket)
        record.errors.add(:title, 'has invalid brackets') 
      end    
    end
  end
end